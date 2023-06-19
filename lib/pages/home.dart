// import 'dart:html';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parkinsons_app/pages/DrawingTest/clock.dart';
import 'package:parkinsons_app/pages/InformationTest/Information.dart';
//import 'package:parkinsons_app/pages/MedicineQuestion.dart';
import 'package:parkinsons_app/pages/RecordActivity.dart';
import 'package:parkinsons_app/pages/RhythmTest/RhythmIntro.dart';
import 'package:parkinsons_app/pages/SurveyTest/MDS-UPDRS.dart';
import 'package:parkinsons_app/pages/SurveyTest/SurveyMenu.dart';
import 'package:parkinsons_app/pages/WalkingTest/StraightWalking.dart';
import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/services/database.dart';
import 'package:parkinsons_app/widgets/WideButton.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:parkinsons_app/services/Util.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

//import 'package:parkinsons_app/pages/InformationTest/Information.dart';
//import 'package:parkinsons_app/pages/RhythmTest/RhythmIntro.dart';
import 'package:parkinsons_app/pages/RhythmTest/rhythm.dart';
import 'package:parkinsons_app/pages/VisualMemoryTest/VisualMemoryTestMenu.dart';
import 'package:parkinsons_app/pages/VisualMemoryTest/memory.dart';
import 'package:parkinsons_app/pages/VoiceRecordingTest/RecordMenu.dart';
import 'package:parkinsons_app/pages/WalkingTest/WalkingMenu.dart';
import 'package:parkinsons_app/pages/AuditoryMemoryTest/AuditoryMenu.dart';
import 'package:parkinsons_app/pages/DrawingTest/DrawingMenu.dart';
import 'package:parkinsons_app/pages/TremorTest/TremorMenu.dart';
import 'package:parkinsons_app/pages/TremorTest/Tremor.dart';
import 'package:parkinsons_app/pages/TremorTest/PosturalTremor.dart';
import 'package:parkinsons_app/pages/WalkingTest/Turning.dart';
import 'package:parkinsons_app/pages/DrawingTest/JoinCircles.dart';
import 'package:parkinsons_app/pages/SurveyTest/MMSE.dart';
import 'package:parkinsons_app/pages/SurveyTest/DemoGraphicSurvey.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

//the home page
class Home extends StatefulWidget {
  final AuthService _auth = AuthService();

  //create the home state
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String username = "";

  bool infoCompleted = false;
  bool rhythmCompleted = false;
  bool visualMemoCompleted = false;
  bool voiceRecordCompleted = false;
  bool walkingCompleted = false;
  bool audioMemoCompleted = false;
  bool drawingCompleted = false;
  bool tremorCompleted = false;
  bool surveyCompleted = false;

  AudioPlayer? audioPlayer;
  AudioCache? audioCache;

  FutureOr onGoBackInfoPressed(dynamic value) {
    setState(() {
      infoCompleted = Information.infoCompleted;
    });
  }

  FutureOr onGoBackRhythm(dynamic value) {
    setState(() {
      rhythmCompleted = Rhythm.rhythmCompleted;
    });
  }

  FutureOr onGoBackVisualMemo(dynamic value) {
    setState(() {
      if (Memory.difficult1Completed &&
          Memory.difficult2Completed &&
          Memory.difficult3Completed &&
          Memory.difficult4Completed &&
          Memory.difficult5Completed) {
        visualMemoCompleted = true;
      }
    });
  }

  FutureOr onGoBackVoiceRecord(dynamic value) {
    setState(() {
      if (RecordActivity.breathTestCompleted &&
          RecordActivity.sentenceTestCompleted &&
          RecordActivity.vowelTestCompleted) {
        voiceRecordCompleted = true;
      }
    });
  }

  FutureOr onGoBackWalking(dynamic value) {
    setState(() {
      if (StraightWalking.straightWalkingCompleted &&
          Turning.turningCompleted) {
        walkingCompleted = true;
      }
    });
  }

  FutureOr onGoBackAuditory(dynamic value) {
    setState(() {
      if (RecordActivity.threeWordsCompleted &&
          RecordActivity.fourWordsCompleted &&
          RecordActivity.fiveWordsCompleted) {
        audioMemoCompleted = true;
      }
    });
  }

  FutureOr onGoBackDrawing(dynamic value) {
    setState(() {
      if (ClockDraw.clockCompleted && JoinCircles.joinCompleted) {
        drawingCompleted = true;
      }
    });
  }

  FutureOr onGoBackTremor(dynamic value) {
    setState(() {
      if (Tremor.tremorCompleted && PosturalTremor.posturalTremorCompleted)
        tremorCompleted = true;
    });
  }

  FutureOr onGoBackSurvey(dynamic value) {
    setState(() {
      if (MMSE.MMSECompleted &&
          DemoGraphicSurvey.demoCompleted &&
          MDSUPDRS.MDSUPDRSCompleted) {
        surveyCompleted = true;
      }
    });
  }

  String reminder() {
    String remind = "";

    if (rhythmCompleted == false) {
      remind = remind + "节奏测试、";
    }
    if (visualMemoCompleted == false) {
      remind = remind + "视觉记忆测试、";
    }
    if (voiceRecordCompleted == false) {
      remind = remind + "语音测试、";
    }
    if (walkingCompleted == false) {
      remind = remind + "步态测试、";
    }
    if (audioMemoCompleted == false) {
      remind = remind + "听觉记忆测试、";
    }
    if (drawingCompleted == false) {
      remind = remind + "绘画测试、";
    }
    if (tremorCompleted == false) {
      remind = remind + "震颤测试、";
    }
    if (surveyCompleted == false) {
      remind = remind + "调查";
    }
    if (remind != "") {
      remind = remind + "未完成! \n\n请选择继续测试,或提交并清空现有测试数据";
    }
    return remind;
  }

  void concludePressed() async {
    String timestamp = createTimeStamp();
    final user = await Amplify.Auth.getCurrentUser();
    String uid = user.userId;
    DataBaseService db = DataBaseService(uid: uid);
    db.updateSubmitTime(timestamp);

    audioPlayer = AudioPlayer();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioCache!.play("clapping.mp3");

    setState(() {
      infoCompleted = false;
      rhythmCompleted = false;
      visualMemoCompleted = false;
      voiceRecordCompleted = false;
      walkingCompleted = false;
      audioMemoCompleted = false;
      drawingCompleted = false;
      tremorCompleted = false;
      surveyCompleted = false;
      Information.infoCompleted = false;
      Rhythm.rhythmCompleted = false;
      Memory.difficult1Completed = false;
      Memory.difficult2Completed = false;
      Memory.difficult3Completed = false;
      Memory.difficult4Completed = false;
      Memory.difficult5Completed = false;
      RecordActivity.vowelTestCompleted = false;
      RecordActivity.sentenceTestCompleted = false;
      RecordActivity.breathTestCompleted = false;
      StraightWalking.straightWalkingCompleted = false;
      Turning.turningCompleted = false;
      RecordActivity.threeWordsCompleted = false;
      RecordActivity.fourWordsCompleted = false;
      RecordActivity.fiveWordsCompleted = false;
      ClockDraw.clockCompleted = false;
      ClockDraw.elecTestCompleted = false;
      ClockDraw.handTestCompleted = false;
      JoinCircles.joinCompleted = false;
      JoinCircles.elecTestCompleted = false;
      // JoinCircles.handTestCompleted = false;
      Tremor.tremorCompleted = false;
      PosturalTremor.posturalTremorCompleted = false;
      MMSE.MMSECompleted = false;
      DemoGraphicSurvey.demoCompleted = false;
      MDSUPDRS.MDSUPDRSCompleted = false;
    });
    Navigator.pop(context);
  }

  void getUserName() async {
    final user = await Amplify.Auth.getCurrentUser();
    username = user.username;
  }

  //build the context in the home state
  @override
  Widget build(BuildContext context) {
    var remind = reminder();
    // getUserName();

    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            buildLogout(),
            Center(
              child: Text(
                AppLocalizations.of(context)!.home_header,
                // "Parkinson's Behavior App!",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
            width: double.infinity,
            height: screenSize.height,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context)!.home_title,
                    // "Choose a test",
                    style: TextStyle(fontSize: 15.0)),
                Divider(height: 45.0, thickness: 4.0, color: Colors.blueGrey),
                Expanded(
                    child: ListView(
                  children: [
                    //build buttons for all the tests
                    WideButton(
                        color: infoCompleted ? Colors.grey : Colors.blue,
                        buttonText: infoCompleted
                            ? AppLocalizations.of(context)!.home_information +
                                " ✅"
                            : AppLocalizations.of(context)!.home_information,
                        onPressed: () {
                          if (!infoCompleted)
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Information()))
                                .then(onGoBackInfoPressed);
                        }),

                    WideButton(
                        color: rhythmCompleted ? Colors.grey : Colors.blue,
                        buttonText: rhythmCompleted
                            ? AppLocalizations.of(context)!.home_rhythm + " ✅"
                            : AppLocalizations.of(context)!.home_rhythm,
                        onPressed: () {
                          if (infoCompleted) {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RhythmIntro()))
                                .then(onGoBackRhythm);
                          }
                        }),

                    WideButton(
                        color: visualMemoCompleted ? Colors.grey : Colors.blue,
                        buttonText: visualMemoCompleted
                            ? AppLocalizations.of(context)!.home_visual_memory +
                                " ✅"
                            : AppLocalizations.of(context)!.home_visual_memory,
                        onPressed: () {
                          if (infoCompleted) {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            VisualMemoryTestMenu()))
                                .then(onGoBackVisualMemo);
                          }
                        }),

                    WideButton(
                        color: voiceRecordCompleted ? Colors.grey : Colors.blue,
                        buttonText: voiceRecordCompleted
                            ? AppLocalizations.of(context)!
                                    .home_voice_recording +
                                " ✅"
                            : AppLocalizations.of(context)!
                                .home_voice_recording,
                        onPressed: () {
                          if (infoCompleted) {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RecordMenu()))
                                .then(onGoBackVoiceRecord);
                          }
                        }),

                    WideButton(
                        color: walkingCompleted ? Colors.grey : Colors.blue,
                        buttonText: walkingCompleted
                            ? AppLocalizations.of(context)!.home_walking + " ✅"
                            : AppLocalizations.of(context)!.home_walking,
                        onPressed: () {
                          if (infoCompleted) {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WalkingMenu()))
                                .then(onGoBackWalking);
                          }
                        }),

                    WideButton(
                        color: audioMemoCompleted ? Colors.grey : Colors.blue,
                        buttonText: audioMemoCompleted
                            ? AppLocalizations.of(context)!
                                    .home_auditory_memory +
                                " ✅"
                            : AppLocalizations.of(context)!
                                .home_auditory_memory,
                        onPressed: () {
                          if (infoCompleted) {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AuditoryMenu()))
                                .then(onGoBackAuditory);
                          }
                        }),

                    WideButton(
                        color: drawingCompleted ? Colors.grey : Colors.blue,
                        buttonText: drawingCompleted
                            ? AppLocalizations.of(context)!.home_drawing + " ✅"
                            : AppLocalizations.of(context)!.home_drawing,
                        onPressed: () {
                          if (infoCompleted) {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DrawingMenu()))
                                .then(onGoBackDrawing);
                          }
                        }),

                    WideButton(
                        color: tremorCompleted ? Colors.grey : Colors.blue,
                        buttonText: tremorCompleted
                            ? AppLocalizations.of(context)!.home_tremor + " ✅"
                            : AppLocalizations.of(context)!.home_tremor,
                        onPressed: () {
                          if (infoCompleted) {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TremorMenu()))
                                .then(onGoBackTremor);
                          }
                        }),

                    WideButton(
                        color: surveyCompleted ? Colors.grey : Colors.blue,
                        buttonText: surveyCompleted
                            ? AppLocalizations.of(context)!.home_survey + " ✅"
                            : AppLocalizations.of(context)!.home_survey,
                        onPressed: () {
                          if (infoCompleted) {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SurveyMenu()))
                                .then(onGoBackSurvey);
                          }
                        }),

                    WideButton(
                        color: Colors.blue,
                        buttonText: AppLocalizations.of(context)!.home_conclude,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    content: (infoCompleted &&
                                            rhythmCompleted &&
                                            visualMemoCompleted &&
                                            voiceRecordCompleted &&
                                            walkingCompleted &&
                                            audioMemoCompleted &&
                                            drawingCompleted &&
                                            tremorCompleted &&
                                            surveyCompleted)
                                        ? Text("您已完成所有测试，请点击提交按钮")
                                        : Text(remind.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                    actions: [
                                      TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text("继续测试")),
                                      TextButton(
                                          onPressed: concludePressed,
                                          child: Text("提交"))
                                    ],
                                  ));
                        }),
                  ],
                )),
                Divider(
                  height: 40.0,
                  thickness: 4.0,
                  color: Colors.blueGrey,
                ),
              ],
            )),
      ),
    );
  }

  Future fetchUserAttributes() async {
    try {
      var res = await Amplify.Auth.fetchUserAttributes();
      res.forEach((element) {
        print('key: ${element.userAttributeKey}; value: ${element.value}');
      });
    } on AuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  //build the logout button
  Widget buildLogout() {
    getUserName();
    return TextButton.icon(
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text("您真的要退出登录吗？",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("否")),
                    TextButton(
                        onPressed: () async {
                          await widget._auth.signOut();
                          final prefs = await SharedPreferences.getInstance();
                          prefs.remove("username");
                          prefs.remove("password");
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/login', (route) => false);
                        },
                        child: Text("是"))
                  ],
                ));
      },
      icon: Icon(Icons.person),
      label: Text(
        username + " " + AppLocalizations.of(context)!.home_logout,
        // 'logout',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
