import 'dart:async';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:motion_sensors/motion_sensors.dart';
import 'package:parkinsons_app/services/Util.dart';
//import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/services/database.dart';
import 'package:parkinsons_app/widgets/WideButton.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:quiver/async.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:amplify_flutter/amplify.dart';

class Tremor extends StatefulWidget {
  // String medicineAnswer;
  // Tremor({required this.medicineAnswer});
  static bool tremorCompleted = false;

  @override
  _TremorState createState() => _TremorState();
}

//build the tremor test
class _TremorState extends State<Tremor> {
  //set variables
  // static const maxSeconds = 30;
  bool cancel = false;
  int maxSeconds = 3;
  int masterIndex = 0;

  int seconds = 3;
  CountdownTimer? _timer = null;
  bool testStarted = false;
  bool halfTest = false;
  bool _canShowButton = true;

  bool testCompleted = false;

  AudioPlayer? audioPlayer;
  AudioCache? audioCache;

  AudioPlayer? audioPlayer1;
  AudioCache? audioCache1;

  AudioPlayer? audioPlayer2;
  AudioCache? audioCache2;

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkPermissions();
    // initSensorSate();
  }

  void hideWidget() {
    setState(() {
      _canShowButton = false;
    });
  }

  void initAudio() {
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
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
                      audioPlayer1!.dispose();
                      audioPlayer2!.dispose();
                      audioPlayer!.dispose();
                    } else {
                      Navigator.pop(context, true);
                    }
                  },
                  child: Text("确认"))
            ],
          ));

  //build the context for tremor test
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    BuildContext pageContext = context;
    return WillPopScope(
        onWillPop: () async {
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "静止性震颤测试",
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
                  Image.asset('assets/static_tremor.png',
                      fit: BoxFit.fitHeight, height: 250),
                  if (_canShowButton) buildStartButton(),
                  SizedBox(
                    height: screenSize.height * 0.0025,
                  ),
                  if (testStarted)
                    Text(
                      AppLocalizations.of(context)!.tremor_still,
                      // "Keep Still!",
                      style: TextStyle(fontSize: 20),
                    ),
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

  //function that write data to a csv file
  void writeDataToCsv() async {
    String csv = const ListToCsvConverter().convert(_sensorDataArray);

    /// Write to a file
    final directory = await getApplicationDocumentsDirectory();
    final pathOfTheFileToWrite = directory.path + "/tremor_test.csv";
    File file = File(pathOfTheFileToWrite);
    await file.writeAsString(csv);

    //Upload to amplify
    Tremor.tremorCompleted = true;
    String timestamp = createTimeStamp();
    final user = await Amplify.Auth.getCurrentUser();
    String uid = user.userId;
    DataBaseService db = DataBaseService(uid: uid);
    await db.uploadFile(file, "Static Tremor Test" + timestamp, ".csv");
    db.updateTremorTest("");
    // db.updateTremorTest(widget.medicineAnswer);
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

  Widget buildInstructions(Size screenSize) {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: Text(
              AppLocalizations.of(context)!.tremor_instructions,
              // "Instructions",
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
                // AppLocalizations.of(context)!.tremor_static_subinstructions,
                "请坐下来，双手置于扶手上（而不是腿上），双足舒适的放在地上，右手握住手机，保持不动10秒",
                style: TextStyle(fontSize: 15.0),
              ),
            ),
          ),
        ),
      ],
    );
  }

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
          audioPlayer2!.pause();
          _timer!.cancel();
        }
        seconds = maxSeconds - duration.elapsed.inSeconds;
      });
    });
    sub.onDone(() {
      if (cancel) {
        _timer!.cancel();
      } else if (masterIndex == 0) {
        audioPlayer1 = AudioPlayer();
        audioCache1 = AudioCache(fixedPlayer: audioPlayer1);
        audioCache1!.play("starttest.mp3");

        audioPlayer2 = AudioPlayer();
        audioCache2 = AudioCache(fixedPlayer: audioPlayer2);
        audioCache2!.play("10s.mp3");

        maxSeconds = 10;
        masterIndex++;
        startCountDownTimer();
      } else {
        audioCache!.play('testcompleted.mp3');
        setState(() {
          testCompleted = true;
        });

        writeDataToCsv();
        seconds = maxSeconds;
        testStarted = false;
        cancelStream();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("震颤测试已完成！")));
        maxSeconds = 3;
      }
    });
  }

  void cancelStream() {
    _streamSubscriptions.forEach((subscription) {
      subscription.cancel();
    });
  }

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

  // void countdownerplayer () async {
  //   await audioCache!.play('countdown.mp3');
  //   await audioCache!.play('321.mp3');
  // }

  Widget buildStartButton() {
    return WideButton(
        color: Colors.blue,
        buttonText: AppLocalizations.of(context)!.tremor_start,
        // buttonText: "Start test",
        onPressed: () {
          if (!testStarted) {
            cancel = false;
            initAudio();
            // countdownerplayer();
            audioCache!.play('321.mp3');
            hideWidget();
            testStarted = true;
            initSensorSate();
            startCountDownTimer();
          }
        });
  }
}
