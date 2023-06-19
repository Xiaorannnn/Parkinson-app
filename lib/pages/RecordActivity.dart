import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:parkinsons_app/services/SoundRecorder.dart';
import 'package:parkinsons_app/services/Util.dart';
//import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/services/database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:quiver/async.dart';
import 'package:record_mp3/record_mp3.dart';
//import 'package:audioplayers/audioplayers.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:amplify_flutter/amplify.dart';

CountdownTimer? _timer = null;

// ignore: must_be_immutable
class RecordActivity extends StatefulWidget {
  //set variables
  // String medicineAnswer;
  String activityTitle;
  String instructionText;
  String subInstructionsText;

  static bool vowelTestCompleted = false;
  static bool breathTestCompleted = false;
  static bool sentenceTestCompleted = false;
  static bool threeWordsCompleted = false;
  static bool fourWordsCompleted = false;
  static bool fiveWordsCompleted = false;

  RecordActivity(
      {required this.activityTitle,
      required this.instructionText,
      required this.subInstructionsText});

  // RecordActivity(
  //     {required this.medicineAnswer,required this.activityTitle,required this.instructionText, required this.subInstructionsText});

  @override
  _RecordActivityState createState() => _RecordActivityState();
}

class _RecordActivityState extends State<RecordActivity> {
  final recorder = SoundRecorder();
  bool isRecording = false;
  bool isComplete = false;
  bool isProcessing = false;
  double timeOpacity = 0.0;
  double waitOpacity = 0.0;
  int _countDownCurrent = 5;

  bool firstBreath = false;
  bool secondBreath = false;
  bool thirdBreath = false;

  late String recordFilePath;

  @override
  void initState() {
    // TODO: implement initState
    //recorder.init();
    super.initState();
    checkPermission();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //recorder.dispose();
    super.dispose();
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
              title: Text(AppLocalizations.of(context)!.voice_record_header
                  // "Follow the instructions below!"
                  ),
              centerTitle: true,
            ),
            body: SafeArea(
                child: Container(
              width: double.infinity,
              height: screenSize.height,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(widget.instructionText,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30)),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: screenSize.height * 0.025),
                        child: Text(widget.subInstructionsText,
                            style: widget.activityTitle == "Record Breath Test"
                                ? TextStyle(fontSize: 20)
                                : TextStyle(fontSize: 23))),
                    ((isComplete && !isRecording)
                        ? buildCompletionButtons()
                        : buildRecordButtonTotal()),
                    SizedBox(height: screenSize.height * 0.025),
                    Opacity(
                      opacity: isRecording ? 1.0 : 0.0,
                      child: Text(
                          AppLocalizations.of(context)!.voice_record_recording,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Colors.red)),
                    ),
                    if (widget.activityTitle == "Record Vowel Test")
                      Opacity(
                          opacity: timeOpacity,
                          child: Container(
                              padding:
                                  EdgeInsets.all(screenSize.height * 0.025),
                              child: Text(
                                AppLocalizations.of(context)!.memory_time +
                                    "$_countDownCurrent",
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.black,
                                    fontFamily: "Helvetica"),
                              ))),
                    if (_countDownCurrent == 0 &&
                        widget.activityTitle == "Record Vowel Test")
                      Text(
                        "恭喜完成!请点击停止录音按钮",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.red,
                            fontFamily: "Helvetica"),
                      ),
                    if (firstBreath &&
                        secondBreath &&
                        thirdBreath &&
                        widget.activityTitle == "Record Breath Test")
                      Text(
                        "恭喜完成!请点击停止录音按钮",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.red,
                            fontFamily: "Helvetica"),
                      ),
                    Opacity(
                        opacity: waitOpacity,
                        child: Container(
                            padding: EdgeInsets.all(screenSize.height * 0.025),
                            child: Text(
                              "处理语音中...",
                              style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.red,
                                  fontFamily: "Helvetica"),
                            ))),
                  ]),
            ))));
  }

  /**--- Function for Recording Audio---**/
  Future<bool> checkPermission() async {
    if (!await Permission.microphone.isGranted) {
      PermissionStatus status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        return false;
      }
    }
    return true;
  }

  int i = 0;

  Future<String> getFilePath() async {
    Directory storageDirectory = await getApplicationDocumentsDirectory();
    String sdPath = storageDirectory.path + "/record";
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return sdPath + "/test.mp3";
  }

  void startRecord() async {
    bool hasPermission = await checkPermission();
    if (hasPermission) {
      recordFilePath = await getFilePath();
      RecordMp3.instance.start(recordFilePath, (type) {
        setState(() {});
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Permission for microphone not granted")));
    }
    setState(() {});
  }

  void stopRecord() {
    bool s = RecordMp3.instance.stop();
    if (s) {
      setState(() {});
    }
  }

  /**--- Functions for building UI---**/
  void onSubmitPressed() async {
    final user = await Amplify.Auth.getCurrentUser();
    String uid = user.userId;
    if (recordFilePath != null && File(recordFilePath).existsSync()) {
      //AudioPlayer audioPlayer = AudioPlayer();
      //audioPlayer.play(recordFilePath, isLocal: true);
      File file = File(recordFilePath);
      DataBaseService db = DataBaseService(uid: uid);
      String timestamp = createTimeStamp();
      //upload to AWS amplify
      db.uploadFile(file, widget.activityTitle + timestamp, ".mp3");
      if (widget.activityTitle == "Record Vowel Test") {
        db.updateRecordVowelTest("");
        RecordActivity.vowelTestCompleted = true;
        Navigator.of(context).pop();

        // db.updateRecordVowelTest(widget.medicineAnswer);
      } else if (widget.activityTitle == "Record Breath Test") {
        db.updateRecordBreathTest("");
        RecordActivity.breathTestCompleted = true;
        Navigator.of(context).pop();

        // db.updateRecordBreathTest(widget.medicineAnswer);
      } else if (widget.activityTitle == "Record Sentence Test") {
        db.updateRecordSentenceTest("");
        RecordActivity.sentenceTestCompleted = true;
        Navigator.of(context).pop();

        // db.updateRecordSentenceTest(widget.medicineAnswer);
      } else if (widget.activityTitle == "Auditory Memory Three Words") {
        db.updateAuditoryMemoryThreeWords("");
        RecordActivity.threeWordsCompleted = true;
        int count = 0;
        Navigator.popUntil(context, (route) {
          return count++ == 2;
        });
        // db.updateAuditoryMemoryThreeWords(widget.medicineAnswer);
      } else if (widget.activityTitle == "Auditory Memory Four Words") {
        db.updateAuditoryMemoryFourWords("");
        RecordActivity.fourWordsCompleted = true;
        int count = 0;
        Navigator.popUntil(context, (route) {
          return count++ == 2;
        });
        // db.updateAuditoryMemoryFourWords(widget.medicineAnswer);
      } else {
        db.updateAuditoryMemoryFiveWords("");
        RecordActivity.fiveWordsCompleted = true;
        int count = 0;
        Navigator.popUntil(context, (route) {
          return count++ == 2;
        });
        // db.updateAuditoryMemoryFiveWords(widget.medicineAnswer);
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(AppLocalizations.of(context)!.voice_record_submitted
              // "Recording Submitted!"
              )));
    }
  }

  /**Builds Submit Button Widget**/
  Widget buildSubmitButton() {
    return ElevatedButton(
      onPressed: () => onSubmitPressed(),
      child: Text(AppLocalizations.of(context)!.voice_record_submit
          // "Submit Recording"
          ),
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(25)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blueAccent)))),
    );
  }

  void onRetryPressed() {
    setState(() {
      isRecording = false;
      isComplete = false;
    });
  }

  /**Builds Retry Button Widget**/
  Widget buildRetyButton() {
    return ElevatedButton(
      onPressed: () => onRetryPressed(),
      child: Text(AppLocalizations.of(context)!.voice_record_retry
          // "Retry Recording"
          ),
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(30)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blueAccent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blueAccent)))),
    );
  }

  Widget buildCompletionButtons() {
    return Column(
      children: [
        SizedBox(
          height: 20.0,
        ),
        buildRetyButton(),
        SizedBox(
          height: 20.0,
        ),
        buildSubmitButton()
      ],
    );
  }

  void onRecordPressed() async {
    print("IS RECORDING" + isRecording.toString());
    setState(() {
      if (isRecording) {
        stopRecord();
        timeOpacity = 0.0;
        _countDownCurrent = 5;
        isComplete = true;
        isRecording = false;
        firstBreath = false;
        secondBreath = false;
        thirdBreath = false;

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(AppLocalizations.of(context)!.voice_record_complete
                // "Your recording is complete!"
                )));
      } else if (isRecording == false && isProcessing == false) {
        _countDownCurrent = 5;
        isRecording = true;
        isComplete = false;
        isProcessing = true;
        startRecord();
        timeOpacity = 1.0;
        _timer = new CountdownTimer(
          new Duration(seconds: 5),
          new Duration(seconds: 1),
        );
        var sub = _timer!.listen(null);
        sub.onData((duration) {
          if (isRecording == false) {
            setState(() {
              waitOpacity = 1.0;
            });
          }
          setState(() {
            _countDownCurrent = 5 - duration.elapsed.inSeconds;
          });
        });
        sub.onDone(() {
          if (_countDownCurrent == 0) {
            setState(() {
              waitOpacity = 0.0;
              isProcessing = false;
            });
          }
        });
      }
    });
  }

  Widget buildFirstBlankButton() {
    return ElevatedButton(
        onPressed: () => {
              setState(() {
                firstBreath = true;
              })
            },
        child: Text("第一次深呼吸"),
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(
                firstBreath ? Colors.grey : Colors.blue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)))));
  }

  Widget buildSecondBlankButton() {
    return ElevatedButton(
        onPressed: () => {
              setState(() {
                secondBreath = true;
              })
            },
        child: Text("第二次深呼吸"),
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(
                secondBreath ? Colors.grey : Colors.blue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)))));
  }

  Widget buildThirdBlankButton() {
    return ElevatedButton(
        onPressed: () => {
              setState(() {
                thirdBreath = true;
              })
            },
        child: Text("第三次深呼吸"),
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(
                thirdBreath ? Colors.grey : Colors.blue),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.blue)))));
  }

  Widget buildRecordButtonTotal() {
    if (widget.activityTitle == "Record Breath Test" && isRecording) {
      return Column(
        children: [
          buildFirstBlankButton(),
          SizedBox(
            height: 20.0,
          ),
          buildSecondBlankButton(),
          SizedBox(
            height: 20.0,
          ),
          buildThirdBlankButton(),
          SizedBox(
            height: 20.0,
          ),
          buildRecordButton()
        ],
      );
    } else {
      return buildRecordButton();
    }
  }

  /** builds record Button Widget**/
  Widget buildRecordButton() {
    return ElevatedButton(
      onPressed: () async => onRecordPressed(),
      child: Text(isRecording
          ? AppLocalizations.of(context)!.voice_record_stop
          : AppLocalizations.of(context)!.voice_record_start),
      // child: Text(isRecording ? "Stop Recording" : "Start Recording"),
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(25)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          backgroundColor: MaterialStateProperty.all<Color>(
              isRecording ? Colors.red : Colors.blue),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.blue)))),
    );
  }
}
