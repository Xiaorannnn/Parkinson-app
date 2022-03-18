import 'dart:async';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:motion_sensors/motion_sensors.dart';
import 'package:parkinsons_app/services/Util.dart';
import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/services/database.dart';
import 'package:parkinsons_app/widgets/WideButton.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quiver/async.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:amplify_flutter/amplify.dart';


class Tremor extends StatefulWidget {
  String medicineAnswer;
  Tremor({required this.medicineAnswer});

  @override
  _TremorState createState() => _TremorState();
}

//build the tremor test
class _TremorState extends State<Tremor> {
  //set variables
  static const maxSeconds = 30;
  int seconds = maxSeconds;
  CountdownTimer? _timer = null;
  bool testStarted = false;
  bool _canShowButton = true;

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
    initSensorSate();
  }

  void hideWidget() {
    setState(() {
      _canShowButton = false;
    });
  }

  //build the context for tremor test
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(),
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
              if (_canShowButton)
                buildStartButton(),
              SizedBox(
                height: screenSize.height * 0.025,
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
            ],
          ),
        ),
      ),
    );
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
    String timestamp = createTimeStamp();
    final user = await Amplify.Auth.getCurrentUser();
    String uid = user.userId;
    DataBaseService db = DataBaseService(uid: uid);
    await db.uploadFile(file, "Tremor Test" + timestamp, ".csv");
    db.updateTremorTest(widget.medicineAnswer);
    // db.updateGeneric("Tremor Test", widget.medicineAnswer);
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
      title: Text(
          AppLocalizations.of(context)!.tremor_header
          // "Tremor Test"
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
                AppLocalizations.of(context)!.tremor_subinstructions,
                // "Please sit down with your feet resting flat on the floor, and hold the phone still with your right hand in your lap for 30 seconds",
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
        seconds = maxSeconds - duration.elapsed.inSeconds;
      });
    });
    sub.onDone(() {
      writeDataToCsv();
      seconds = maxSeconds;
      testStarted = false;
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("震颤测试已完成！")));
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

  Widget buildStartButton() {
    return WideButton(
        color: Colors.blue,
        buttonText: AppLocalizations.of(context)!.tremor_start,
        // buttonText: "Start test",
        onPressed: () {
          if (!testStarted) {
            hideWidget();
            testStarted = true;
            startCountDownTimer();
          }
        });
  }
}
