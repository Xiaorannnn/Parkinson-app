import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:parkinsons_app/services/Util.dart';
//import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/services/database.dart';
import 'package:parkinsons_app/widgets/WideButton.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:sensors_plus/sensors_plus.dart';
import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:motion_sensors/motion_sensors.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:csv/csv.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:quiver/async.dart';

//build the straight walking menu
class StraightWalking extends StatefulWidget {
  // String medicineAnswer;
  // StraightWalking({required this.medicineAnswer});
  static bool straightWalkingCompleted = false;

  @override
  _StraightWalkingState createState() => _StraightWalkingState();
}

class _StraightWalkingState extends State<StraightWalking> {
  //set variables
  bool cancel = false;
  bool isRecording = false;
  bool isDone = false;
  int stepsTaken = 0;
  int maxSteps = 20;
  double counterOpacity = 0.0;
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

  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';

  AudioPlayer? audioPlayer;
  AudioCache? audioCache;

  AudioPlayer? audioPlayer1;
  AudioCache? audioCache1;

  AudioPlayer? audioPlayer2;
  AudioCache? audioCache2;

  AudioPlayer? audioPlayer3;
  AudioCache? audioCache3;

  late String localFilePath;

  Duration _duration = new Duration();
  Duration _position = new Duration();

  static int maxSeconds = 3;
  int masterIndex = 0;
  int seconds = maxSeconds;
  CountdownTimer? _timer = null;
  bool testStarted = false;
  bool _canShowButton = true;

  bool testCompleted = false;

  @override
  void initState() {
    super.initState();
    checkPermissions();
    initSensorSate();
    initPlatformState();
    initAudio();
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
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
                  onPressed: () {
                    if (testStarted) {
                      maxSeconds = 3;
                      masterIndex = 0;
                      Navigator.pop(context, true);
                      cancel = true;
                      // _timer!.cancel();
                      audioPlayer3!.dispose();
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

  //build the context
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
                "直线行走测试",
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
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: Text(
                        AppLocalizations.of(context)!.walking_test_instruction,
                        style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      )),
                  buildInstructions(screenSize),
                  if (_canShowButton) buildStartButton(),
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
                  // buildStartStopButton(),
                  // buildStepCounter()
                ],
              ),
            ))));
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
    stepsTaken = 0;
    counterOpacity = 0.0;
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
    if (isRecording) {
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

  //write the data to a csv file
  void writeDataToCsv() async {
    String csv = const ListToCsvConverter().convert(_sensorDataArray);

    /// Write to a file
    final directory = await getApplicationDocumentsDirectory();
    final pathOfTheFileToWrite = directory.path + "/walking_test.csv";
    File file = File(pathOfTheFileToWrite);
    await file.writeAsString(csv);

    //Upload to AWS Amplify
    StraightWalking.straightWalkingCompleted = true;
    String timestamp = createTimeStamp();
    final user = await Amplify.Auth.getCurrentUser();
    String uid = user.userId;
    DataBaseService db = DataBaseService(uid: uid);
    db.uploadFile(file, "Straight Walking Test" + timestamp, ".csv");
    db.updateStraightWalkingTest("", stepsTaken.toString());

    resetData();

    print("written to csv!");
    print(csv);
  }

  /**--- Funcions for Pedometer---**/
  void onStepCount(StepCount event) {
    _steps = event.steps.toString();
    setState(() {
      if (isRecording) {
        updateSensorDataArray();
        stepsTaken += 1;
      }
      // else {
      //   ScaffoldMessenger.of(context).showSnackBar(
      //       SnackBar(content: Text("干得好，你的行走数据已经被成功记录！")));
      //   writeDataToCsv();
      //   // audioCache!.play("RecordingFinished.mp3");
      // }
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError: $error');
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    print('onStepCountError: $error');
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);

    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    if (!mounted) return;
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

  void initAudio() {
    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
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
    });
  }

  void onMagnetometerEvent(MagnetometerEvent event) {
    setState(() {
      _magnetometerValues = <double>[event.x, event.y, event.z];
      updateSensorDataArray();
      print(_magnetometerValues);
    });
  }

  /**--- Funcions for building the UI---**/
  Widget buildInstructions(Size screenSize) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(color: Colors.black, width: 2.0)),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppLocalizations.of(context)!.walking_test_straight_text,
            // "1.Turn up your phone's volume so you can hear the instructions while you are walking\n\n"+
            // "2.Put your smartphone in your front pocket and  if you do not have pockets you can place the phone in your waist band of your pants\n\n"+
            // "3.Please stand up if you are sitting, please walk straight at least for 20 steps",
            style: TextStyle(fontSize: 15.0),
          ),
        ),
      ),
    );
  }

  void OnStartStopButtonPressed() {
    setState(() {
      if (isRecording) {
        // audioCache!.play('RecordingCanceled.mp3');
        resetData();
      } else {
        // audioCache!.play('RecordingStarted.mp3');
      }
      isRecording = !isRecording;
    });
  }

  void hideWidget() {
    setState(() {
      _canShowButton = false;
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
          audioPlayer3!.pause();
          _timer!.cancel();
        }
        seconds = maxSeconds - duration.elapsed.inSeconds;
      });
    });
    sub.onDone(() {
      if (cancel) {
        _timer!.cancel();
      } else if (masterIndex == 0) {
        maxSeconds = 45;
        masterIndex++;

        audioPlayer3 = AudioPlayer();
        audioCache3 = AudioCache(fixedPlayer: audioPlayer3);
        audioCache3!.play("beep.wav");

        // sleep(Duration(seconds:1));

        audioPlayer1 = AudioPlayer();
        audioCache1 = AudioCache(fixedPlayer: audioPlayer1);
        audioCache1!.play("startwalking.mp3");

        audioPlayer2 = AudioPlayer();
        audioCache2 = AudioCache(fixedPlayer: audioPlayer2);
        audioCache2!.play("45s.mp3");

        startCountDownTimer();
      } else {
        isRecording = false;
        audioCache!.play("stopwalking.mp3");
        testCompleted = true;
        writeDataToCsv();
        seconds = maxSeconds;
        testStarted = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("直线行走测试已完成！")));
        maxSeconds = 3;
      }
    });
  }

  Widget buildStartButton() {
    return WideButton(
        color: Colors.blue,
        buttonText: "点击以开始",
        onPressed: () {
          if (!testStarted) {
            cancel = false;
            initAudio();
            OnStartStopButtonPressed();
            hideWidget();
            testStarted = true;
            startCountDownTimer();
            audioCache!.play("bistart.mp3");
          }
        });
  }

  Widget buildStartStopButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: WideButton(
        color: isRecording ? Colors.red : Colors.blue,
        buttonText: isRecording
            ? AppLocalizations.of(context)!.walking_test_straight_button1
            : AppLocalizations.of(context)!.walking_test_straight_button2,
        // buttonText: isRecording ? "Press to Stop" : "Press to Start",
        onPressed: OnStartStopButtonPressed,
      ),
    );
  }

  Widget buildStepCounter() {
    return Opacity(
      opacity: isRecording ? 1.0 : 0.0,
      child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Text(
              AppLocalizations.of(context)!.walking_test_straight_step +
                  stepsTaken.toString(),
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold))),
    );
  }
}
