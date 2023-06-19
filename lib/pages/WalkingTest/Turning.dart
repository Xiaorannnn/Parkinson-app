import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:parkinsons_app/services/Util.dart';
//import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/services/database.dart';
import 'package:parkinsons_app/widgets/WideButton.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:sensors_plus/sensors_plus.dart';
//import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:motion_sensors/motion_sensors.dart';
import 'package:csv/csv.dart';
import 'package:quiver/async.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:amplify_flutter/amplify.dart';

//build menu for the turning test
class Turning extends StatefulWidget {
  // String medcineAnswer;
  // Turning({required this.medcineAnswer});
  static bool turningCompleted = false;

  @override
  _TurningState createState() => _TurningState();
}

class _TurningState extends State<Turning> {
  int maxSeconds = 3;
  int seconds = 3;

  CountdownTimer? _timer = null;
  bool testStarted = false;
  bool cancel = false;

  List<List<dynamic>>? _sensorDataArray = [
    [
      "TimeStamp",
      "Acc_x",
      "Acc_y",
      "Acc_z",
      "Gyro_x",
      "Gyro_y",
      "Gyro_z",
      "Magnetic_x",
      "Magnetic_y",
      "Magnetic_z"
    ]
  ]; //this array of arrays will be converted into a csv
  List<double>? _userAccelerometerValues;
  List<double>? _gyroscopeValues;
  List<double>? _magnetometerValues;
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];
  List<String> instructionsMP3 = ['turnaround.mp3', 'standstill_30.mp3'];
  List<int> waitTimes = [5, 30];
  int masterIndex = 0;

  AudioPlayer? audioPlayer;
  AudioCache? audioCache;

  AudioPlayer? audioPlayer1;
  AudioCache? audioCache1;

  bool testCompleted = false;

  //counting down the time
  void startCountDownTimer() {
    _timer = new CountdownTimer(
      new Duration(seconds: maxSeconds),
      new Duration(seconds: 1),
    );

    // ignore: cancel_subscriptions
    var sub = _timer!.listen(null);
    sub.onData((duration) {
      setState(() {
        if (cancel) {
          audioPlayer!.pause();
          audioPlayer1!.pause();

          _timer!.cancel();
        }
        seconds = maxSeconds - duration.elapsed.inSeconds;
      });
    });
    sub.onDone(() {
      if (cancel) {
        _timer!.cancel();
      } else if (masterIndex < waitTimes.length) {
        audioCache!.play(instructionsMP3[masterIndex]);
        if (masterIndex == 1) {
          audioPlayer1 = AudioPlayer();
          audioCache1 = AudioCache(fixedPlayer: audioPlayer1);
          audioCache1!.play("30s.mp3");
        }
        maxSeconds = waitTimes[masterIndex];
        masterIndex++;
        startCountDownTimer();
      } else {
        cancelStream();
        testCompleted = true;
        audioCache!.play('testcompleted.mp3');
        // audioCache!.play('recording_finished.mp3');
        writeDataToCsv();
        seconds = maxSeconds;
        testStarted = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("转向测试已完成!")));
        masterIndex = 0;
      }
    });
  }

  void initAudio() {
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkPermissions();
    // initSensorSate();
    // initAudio();
  }

  void cancelStream() {
    _streamSubscriptions.forEach((subscription) {
      subscription.cancel();
    });
    _timer!.cancel();
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
                  onPressed: () {
                    if (testStarted) {
                      maxSeconds = 3;
                      masterIndex = 0;
                      Navigator.pop(context, true);
                      cancel = true;
                      // _timer!.cancel();
                      audioPlayer1!.dispose();
                      audioPlayer!.dispose();
                    } else {
                      Navigator.pop(context, true);
                    }
                  },
                  child: Text("确认"))
            ],
          ));

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async {
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "转弯测试",
              style: TextStyle(fontSize: 15.0),
              // "Tremor Test"
            ),
            centerTitle: true,
          ),
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: screenSize.height,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                children: [
                  buildInstructions(screenSize),
                  SizedBox(
                    height: screenSize.height * 0.025,
                  ),
                  if (!testStarted) buildStartButton(),
                  SizedBox(
                    height: screenSize.height * 0.025,
                  ),
                  if (testStarted) buildTime(),
                  if (testCompleted)
                    Text(
                      "恭喜你完成测试！🎉",
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.red,
                          fontFamily: "Helvetica"),
                    )
                ],
              ),
            ),
          ),
        ));
  }

  Future<bool> checkPermissions() async {
    final activityStatus = await Permission.activityRecognition.request();
    final storageStatus = await Permission.storage.request();
    if (activityStatus != PermissionStatus.granted &&
        storageStatus != PermissionStatus.granted) {
      throw Exception("Permission denied");
    }
    return true;
  }

  void resetData() {
    //set all member variables to initial state
    _sensorDataArray = [
      [
        "TimeStamp",
        "Acc_x",
        "Acc_y",
        "Acc_z",
        "Gyro_x",
        "Gyro_y",
        "Gyro_z",
        "Magnetic_x",
        "Magnetic_y",
        "Magnetic_z"
      ]
    ]; //this array of arrays will be converted into a csv
  }

  void updateSensorDataArray() {
    if (testStarted) {
      List<dynamic> row = [
        createTimeStamp(),
        _userAccelerometerValues![0],
        _userAccelerometerValues![1],
        _userAccelerometerValues![2],
        _gyroscopeValues![0],
        _gyroscopeValues![1],
        _gyroscopeValues![2],
        _magnetometerValues![0],
        _magnetometerValues![1],
        _magnetometerValues![2]
      ];
      _sensorDataArray!.add(row);
    }
  }

  void writeDataToCsv() async {
    String csv = const ListToCsvConverter().convert(_sensorDataArray);

    /// Write to a file
    final directory = await getApplicationDocumentsDirectory();
    final pathOfTheFileToWrite = directory.path + "/tremor_test.csv";
    File file = File(pathOfTheFileToWrite);
    await file.writeAsString(csv);
    String timestamp = createTimeStamp();

    //upload to amplify
    Turning.turningCompleted = true;
    final user = await Amplify.Auth.getCurrentUser();
    String uid = user.userId;
    DataBaseService db = DataBaseService(uid: uid);
    db.uploadFile(file, "Turning Test" + timestamp, ".csv");
    db.updateTurningTest("");
    // db.updateTurningTest(widget.medcineAnswer);
    resetData();
  }

  void initSensorSate() {
    _streamSubscriptions.add(
      motionSensors.gyroscope.listen(onGyroScopeEvent),
    );
    _streamSubscriptions.add(
      motionSensors.userAccelerometer.listen(onAccelerometerEvent),
    );
    _streamSubscriptions.add(
      motionSensors.magnetometer.listen(onMagnetometerEvent),
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

  void onMagnetometerEvent(MagnetometerEvent event) {
    setState(() {
      _magnetometerValues = <double>[event.x, event.y, event.z];
      updateSensorDataArray();
    });
  }

  /**--- Funcions for building UI---**/
  PreferredSizeWidget buildAppBar() {
    return AppBar(
      title: Text(AppLocalizations.of(context)!.walking_menu_turning
          // "Turning Test"
          ),
      centerTitle: true,
    );
  }

  Widget buildInstructions(Size screenSize) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Text(
              AppLocalizations.of(context)!.walking_test_instruction,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline),
            )),
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.black, width: 2.0)),
          child: SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context)!.walking_test_turning_text,
                // "1.Turn up your phone's volume so you can hear the instructions while you are walking\n\n"+
                // "2.Put your smartphone in your front pocket if you do not have pockets you can place the phone in the waist band of your pants\n\n"+
                // "3.Please stand up if you are sitting, please turn around and stand still for 30 seconds",
                style: TextStyle(fontSize: 15.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

  //build the time box
  Widget buildTime() {
    return SizedBox(
      width: 100,
      height: 100,
      child: Stack(fit: StackFit.expand, children: [
        CircularProgressIndicator(
          value: 1 - seconds / maxSeconds,
          valueColor: AlwaysStoppedAnimation(Colors.grey),
          strokeWidth: 12,
          backgroundColor: Colors.greenAccent,
        ),
        Center(
          child: Text(
            '$seconds',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 50),
          ),
        ),
      ]),
    );
  }

  Widget buildStartButton() {
    return WideButton(
        color: Colors.blue,
        buttonText: testStarted
            ? AppLocalizations.of(context)!.walking_test_turning_stop
            : AppLocalizations.of(context)!.walking_test_turning_start,
        onPressed: () {
          if (!testStarted) {
            cancel = false;
            testStarted = true;
            initSensorSate();
            initAudio();
            startCountDownTimer();
          }
        });
  }
}
