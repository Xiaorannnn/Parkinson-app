//import 'dart:math';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'package:parkinsons_app/services/Util.dart';
import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/services/database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:motion_sensors/motion_sensors.dart';

import 'package:quiver/async.dart';
import 'package:csv/csv.dart';
import 'dart:io';
import 'dart:async';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:amplify_flutter/amplify.dart';

class Rhythm extends StatefulWidget {
  // String medicineAnswer;
  static bool rhythmCompleted = false;

  // Rhythm({required this.medicineAnswer});
  @override
  _RhythmState createState() => _RhythmState();
}

class _RhythmState extends State<Rhythm> {
  //set variables
  late Size screenSize;
  bool rhythmStart = false;
  bool rhythmEnd = false;

  GlobalKey leftKey = GlobalKey();
  GlobalKey rightKey = GlobalKey();

  Offset? leftButtonPosition;
  Offset? rightButtonPosition;

  AuthService _authService = AuthService();
  int _amountPressed = 0;
  double _totalDistance = 0.0;
  double _meanDistance = 0.0;

  bool _leftActivated = false;
  bool _rightActivated = false;

  //prevents multiple countdowns
  bool _gamesCommenced = false;
  bool _countdownCommenced = false;

  //for initial count down
  int _readyTimerStart = 5;
  int _readyTimerCurrent = 5;

  // to display time left
  int _countDownStart = 30;
  int _countDownCurrent = 30;

  //controls visibility of timers
  double _readyTimerOpacity = 0.0;
  double _countDownOpacity = 0.0;

  //sensor variables
  List<List<dynamic>>? _sensorDataArray = [
    ["TimeStamp", "Acc_x", "Acc_y", "Acc_z", "Gyro_x", "Gyro_y", "Gyro_z"]
  ]; //this array of arrays will be converted into a csv
  List<double>? _userAccelerometerValues;
  List<double>? _gyroscopeValues;
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  List<List<dynamic>>? _DataArray = [
    [
      "TimeStamp",
      "TappedButtonType",
      "TappedCoordinate",
      "CoordinateOfLeftButton",
      "CoordinateOfRightButton",
      "PixelsFromTheCenter"
    ]
  ]; //this array of arrays will be converted into a csv
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkPermissions();
  }

  //cancel all the sensor stream
  void cancelStream() {
    _streamSubscriptions.forEach((subscription) {
      subscription.cancel();
    });
  }

  void resetData() {
    _sensorDataArray = [
      ["TimeStamp", "Acc_x", "Acc_y", "Acc_z", "Gyro_x", "Gyro_y", "Gyro_z"]
    ];
  }

  void updateSensorDataArray() {
    if (_gamesCommenced) {
      List<dynamic> row = [
        createTimeStamp(),
        _userAccelerometerValues![0],
        _userAccelerometerValues![1],
        _userAccelerometerValues![2],
        _gyroscopeValues![0],
        _gyroscopeValues![1],
        _gyroscopeValues![2]
      ];
      _sensorDataArray!.add(row);
    }
  }

  Future<bool?> showWarning(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("您确定想要退出吗？"),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text("取消")),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text("确认"))
            ],
          ));

  //build the context for rhythm
  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async {
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        },
        child: new Scaffold(
          appBar: AppBar(
            title: Text(
              // AppLocalizations.of(context)!.rhythm_header,
              "Rhythm game!",
              style: TextStyle(fontSize: 15.0),
            ),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Center(
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 40.0, horizontal: 0.0),
                      child: !rhythmEnd
                          ? Text(
                              "Press \"Start\" to start the game" +
                                  "\n" +
                                  "When the button turn to red, press it!",
                              // AppLocalizations.of(context)!.rhythm_title1 + "\n" +
                              //     AppLocalizations.of(context)!.rhythm_title2,
                              style: TextStyle(fontSize: 15.0))
                          : Text(
                              "恭喜你完成测试！🎉",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.red,
                                  fontFamily: "Helvetica"),
                            ))),
              Container(
                  // padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                  child: Opacity(
                      opacity: _countDownOpacity,
                      child: Text(
                          // AppLocalizations.of(context)!.rhythm_time,
                          "Time Left",
                          style: TextStyle(fontSize: 20.0)))),
              Container(
                  // padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                  child: Opacity(
                      opacity: _countDownOpacity,
                      child: Text("$_countDownCurrent",
                          style: TextStyle(fontSize: 20.0)))),
              Divider(
                height: 90.0,
                color: Colors.grey,
              ),
              Opacity(
                  opacity: _readyTimerOpacity,
                  child: Text(
                    AppLocalizations.of(context)!.rhythm_ready +
                        " $_readyTimerCurrent",
                    style: TextStyle(fontSize: 20.0),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[buildLeftButton(), buildRightButton()],
              ),
              Divider(
                height: 40.0,
                color: Colors.grey,
              ),
              if (!rhythmStart || rhythmEnd)
                Center(
                    child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 0.0, horizontal: 0.0),
                        child: ElevatedButton(
                            onPressed: () {
                              if (!(_countdownCommenced) &&
                                  !(_gamesCommenced) &&
                                  !(rhythmStart) &&
                                  !(rhythmEnd)) {
                                rhythmStart = true;
                                startReadyTimer();
                              } else if (rhythmEnd) {
                                rhythmEnd = false;
                                rhythmStart = false;
                                int count = 0;
                                Navigator.popUntil(context, (route) {
                                  return count++ == 2;
                                });
                              }
                            },
                            // child: rhythmEnd ? Text("结束") : Text(AppLocalizations.of(context)!.rhythm_start))
                            child: rhythmEnd ? Text("结束") : Text("Start")))),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                        child: Text(
                            // AppLocalizations.of(context)!.rhythm_score,
                            "Score",
                            style: TextStyle(fontSize: 15.0))),
                    Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                        child: Text(
                            // AppLocalizations.of(context)!.rhythm_pixel,
                            "Average Pixels from center",
                            style: TextStyle(fontSize: 15.0))),
                  ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: Text("$_amountPressed",
                            style: TextStyle(fontSize: 15.0))),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 40.0),
                        child: Text("$_meanDistance",
                            style: TextStyle(fontSize: 15.0))),
                  ]),
              // if (rhythmEnd)
              //   Text(
              //     "恭喜你完成测试！🎉",
              //     style: TextStyle(
              //         fontSize: 20.0,
              //         color: Colors.red,
              //         fontFamily: "Helvetica"),
              //   )
            ],
          ),
        ));
  }

  Future<bool> checkPermissions() async {
    final storageStatus = await Permission.storage.request();
    if (storageStatus != PermissionStatus.granted) {
      throw Exception("Permission denied");
    }
    return true;
  }

  void getPositions() {
    RenderBox? lbox = leftKey.currentContext!.findRenderObject() as RenderBox?;
    leftButtonPosition = lbox!.localToGlobal(Offset.zero);

    RenderBox? rbox = rightKey.currentContext!.findRenderObject() as RenderBox?;
    rightButtonPosition = rbox!.localToGlobal(Offset.zero);

    print(
        "LEFT BUTTON x: ${leftButtonPosition!.dx} , y: ${leftButtonPosition!.dy}");
    print(
        "RIGHT BUTTON x: ${rightButtonPosition!.dx} , y: ${rightButtonPosition!.dy}");
  }

  /**
   * Starts countdown timer to  when start test is pressed, when countdown reaches zero the game timer starts
   */

  void startReadyTimer() {
    _countdownCommenced = true;
    _readyTimerOpacity = 1.0;
    _totalDistance = 0.0;
    _meanDistance = 0.0;
    _amountPressed = 0;
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _readyTimerStart),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _readyTimerCurrent = _readyTimerStart - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(() {
      print("Done");
      _readyTimerOpacity = 0.0;
      _readyTimerCurrent = 10;
      _gamesCommenced = true;
      _leftActivated = true;

      initSensorSate();

      sub.cancel();
      startCountDownTimer();
    });
  }

  /**
   * Starts countdown timer to tell user how much time they have left in the test
   */
  void startCountDownTimer() {
    _countDownOpacity = 1.0;
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _countDownStart),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _countDownCurrent = _countDownStart - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(() async {
      print("Done");
      rhythmEnd = true;
      _countDownOpacity = 0.0;
      _countDownCurrent = 30;
      _gamesCommenced = false;
      _countdownCommenced = false;
      _leftActivated = false;
      _rightActivated = false;

      cancelStream();

      //get the user id
      final user = await Amplify.Auth.getCurrentUser();
      DataBaseService(uid: user.userId)
          .updateUserRythmGame(_amountPressed, _meanDistance, "");

      // DataBaseService(uid: user.userId).updateUserRythmGame(_amountPressed, _totalDistance, "");
      // DataBaseService(uid: user.userId).updateUserRythmGame(_amountPressed, _totalDistance, widget.medicineAnswer);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("你已经完成测试，结果已被记录！")));
      writeDataToCsv();
    });
  }

  void _onTapDown(TapDownDetails details) {
    if (_gamesCommenced) {
      //Find the Coordinants of the buttons
      RenderBox? lbox =
          leftKey.currentContext!.findRenderObject() as RenderBox?;
      leftButtonPosition = lbox!.localToGlobal(Offset.zero);

      RenderBox? rbox =
          rightKey.currentContext!.findRenderObject() as RenderBox?;
      rightButtonPosition = rbox!.localToGlobal(Offset.zero);

      String ButtonType = "";

      if (_leftActivated) {
        setState(() {
          //calculate distance from center of active button
          double distance = pixelsToCenter(
              details.globalPosition.dx,
              details.globalPosition.dy,
              leftButtonPosition!.dx + lbox.size.width / 2,
              leftButtonPosition!.dy + lbox.size.height / 2);
          _totalDistance += distance;

          _meanDistance = _totalDistance / _amountPressed;

          print("DISTANCE TO CENTER: $distance");

          //Add Info to DataArray to be turned into csv
          ButtonType = "LeftButton";
          List<dynamic> row = [
            createTimeStamp(),
            ButtonType,
            {'x': details.globalPosition.dx, 'y': details.globalPosition.dy},
            {'x': leftButtonPosition!.dx, 'y': leftButtonPosition!.dy},
            {'x': rightButtonPosition!.dx, 'y': rightButtonPosition!.dy},
            distance
          ];
          _DataArray!.add(row);
        });
      } else {
        setState(() {
          //calculate distance from center of active button
          double distance = pixelsToCenter(
              details.globalPosition.dx,
              details.globalPosition.dy,
              rightButtonPosition!.dx + rbox.size.width / 2,
              rightButtonPosition!.dy + rbox.size.height / 2);

          _totalDistance += distance;
          _meanDistance = _totalDistance / _amountPressed;

          print("DISTANCE TO CENTER:$distance");

          //Add Info to DataArray to be turned into csv
          ButtonType = "RightButton";
          List<dynamic> row = [
            createTimeStamp(),
            ButtonType,
            {'x': details.globalPosition.dx, 'y': details.globalPosition.dy},
            {'x': leftButtonPosition!.dx, 'y': leftButtonPosition!.dy},
            {'x': rightButtonPosition!.dx, 'y': rightButtonPosition!.dy},
            distance
          ];
          _DataArray!.add(row);
        });
      }
    }
  }

  void writeDataToCsv() async {
    String csv = const ListToCsvConverter().convert(_DataArray);
    String csv2 = const ListToCsvConverter().convert(_sensorDataArray);

    /// Write to a file
    final directory = await getApplicationDocumentsDirectory();
    final pathOfTheFileToWrite = directory.path + "/rhythm_test.csv";
    final pathOfTheFileToWrite2 = directory.path + "/rhythm_test_sensor.csv";
    File file = File(pathOfTheFileToWrite);
    File file2 = File(pathOfTheFileToWrite2);
    await file.writeAsString(csv);
    await file2.writeAsString(csv2);

    //Upload to Amplify
    Rhythm.rhythmCompleted = true;
    String timestamp = createTimeStamp();
    final user = await Amplify.Auth.getCurrentUser();
    String uid = user.userId;
    DataBaseService db = DataBaseService(uid: uid);
    db.uploadFile(file, "Rhythm Test" + timestamp, ".csv");
    db.uploadFile(file2, "Rhythm Test Sensor" + timestamp, ".csv");

    resetData();
    print("written to csv!");
    print(csv);
  }

  void initSensorSate() {
    _streamSubscriptions.add(
      motionSensors.gyroscope.listen(onGyroScopeEvent),
    );
    _streamSubscriptions.add(
      motionSensors.userAccelerometer.listen(onAccelerometerEvent),
    );
  }

  /**--- Funcions for Sensors---**/
  void onGyroScopeEvent(GyroscopeEvent event) {
    setState(() {
      _gyroscopeValues = <double>[event.x, event.y, event.z];
      updateSensorDataArray();
    });
  }

  void onAccelerometerEvent(UserAccelerometerEvent event) {
    setState(() {
      _userAccelerometerValues = <double>[event.x, event.y, event.z];
      updateSensorDataArray();
      print(_userAccelerometerValues);
    });
  }

  /**
   * calculates distance in pixels from where the user touched a button, to the center of the button
   *
   * @param touchx,touchY : offset for where user touched the button
   * @param centerX,centerY: offset for center of button
   */
  double pixelsToCenter(touchX, touchY, centerX, centerY) {
    return (touchX - centerX).abs() + (touchY - centerY).abs();
  }

  Widget buildRightButton() {
    return Container(
      key: rightKey,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
      child: GestureDetector(
        onTapDown: (TapDownDetails details) {
          setState(() {
            _onTapDown(details);
            if (_rightActivated) {
              _rightActivated = !(_rightActivated);
              _leftActivated = !(_leftActivated);
              _amountPressed += 1;
            }
          });
        },
        onTertiaryTapDown: (TapDownDetails details) {
          setState(() {
            _onTapDown(details);
            if (_rightActivated) {
              _rightActivated = !(_rightActivated);
              _leftActivated = !(_leftActivated);
              _amountPressed += 1;
            }
          });
        },
        child: CircleAvatar(
          backgroundColor:
              (_rightActivated && _gamesCommenced && !(_leftActivated))
                  ? Colors.red
                  : Colors.blue,
          radius: 45,
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 10,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLeftButton() {
    return Container(
      key: leftKey,
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
      child: GestureDetector(
        onTapDown: (TapDownDetails details) {
          setState(() {
            _onTapDown(details);
            if (_leftActivated) {
              _rightActivated = !(_rightActivated);
              _leftActivated = !(_leftActivated);
              _amountPressed += 1;
            }
          });
        },
        onTertiaryTapDown: (TapDownDetails details) {
          setState(() {
            _onTapDown(details);
            if (_leftActivated) {
              _rightActivated = !(_rightActivated);
              _leftActivated = !(_leftActivated);
              _amountPressed += 1;
            }
          });
        },
        child: CircleAvatar(
          backgroundColor:
              (_leftActivated && _gamesCommenced && !(_rightActivated))
                  ? Colors.red
                  : Colors.blue,
          radius: 45,
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 10,
            ),
          ),
        ),
      ),
    );
  }
}
