import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parkinsons_app/pages/AuditoryMemoryTest/AuditorMemory.dart';
import 'package:parkinsons_app/pages/RecordActivity.dart';
//import 'package:parkinsons_app/services/Util.dart';
import 'package:parkinsons_app/widgets/WideButton.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuditoryMenu extends StatefulWidget {
  // String medicineAnswer;
  // AuditoryMenu({required this.medicineAnswer});

  @override
  _AuditoryMenuState createState() => _AuditoryMenuState();
}

class _AuditoryMenuState extends State<AuditoryMenu> {
  bool threeWordsCompleted = RecordActivity.threeWordsCompleted;
  bool fourWordsCompleted = RecordActivity.fourWordsCompleted;
  bool fiveWordsCompleted = RecordActivity.fiveWordsCompleted;

  FutureOr onGoBackThree(dynamic value) {
    // print(RecordActivity.threeWordsCompleted);
    setState(() {
      threeWordsCompleted = RecordActivity.threeWordsCompleted;
    });
  }

  FutureOr onGoBackFour(dynamic value) {
    // print(RecordActivity.fourWordsCompleted);
    setState(() {
      fourWordsCompleted = RecordActivity.fourWordsCompleted;
    });
  }

  FutureOr onGoBackFive(dynamic value) {
    setState(() {
      fiveWordsCompleted = RecordActivity.fiveWordsCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(threeWordsCompleted = RecordActivity.threeWordsCompleted);
    setState(() {
      threeWordsCompleted = RecordActivity.threeWordsCompleted;
      fourWordsCompleted = RecordActivity.fourWordsCompleted;
      fiveWordsCompleted = RecordActivity.fiveWordsCompleted;
    });

    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.auditory_header,
          style: TextStyle(fontSize: 15.0),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: screenSize.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WideButton(
                  color: threeWordsCompleted ? Colors.grey : Colors.blue,
                  buttonText: threeWordsCompleted
                      ? AppLocalizations.of(context)!.auditory_menu_choice1 +
                          " ✅"
                      : AppLocalizations.of(context)!.auditory_menu_choice1,
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuditoryMemory(
                                    mp3Path: "three_words.mp3",
                                    activityTitle:
                                        "Auditory Memory Three Words")))
                        .then(onGoBackThree);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => AuditoryMemory(medicineAnswer: widget.medicineAnswer , mp3Path:"three_words.mp3" ,activityTitle: "Auditory Memory Three Words")));
                  }),
              WideButton(
                  color: fourWordsCompleted ? Colors.grey : Colors.blue,
                  buttonText: fourWordsCompleted
                      ? AppLocalizations.of(context)!.auditory_menu_choice2 +
                          " ✅"
                      : AppLocalizations.of(context)!.auditory_menu_choice2,
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuditoryMemory(
                                    mp3Path: "four_words.mp3",
                                    activityTitle:
                                        "Auditory Memory Four Words")))
                        .then(onGoBackFour);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => AuditoryMemory(medicineAnswer: widget.medicineAnswer , mp3Path:"four_words.mp3" ,activityTitle: "Auditory Memory Four Words")));
                  }),
              WideButton(
                  color: fiveWordsCompleted ? Colors.grey : Colors.blue,
                  buttonText: fiveWordsCompleted
                      ? AppLocalizations.of(context)!.auditory_menu_choice3 +
                          " ✅"
                      : AppLocalizations.of(context)!.auditory_menu_choice3,
                  onPressed: () {
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AuditoryMemory(
                                    mp3Path: "five_words.mp3",
                                    activityTitle:
                                        "Auditory Memory Five Words")))
                        .then(onGoBackFive);
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => AuditoryMemory(medicineAnswer: widget.medicineAnswer , mp3Path:"five_words.mp3" ,activityTitle: "Auditory Memory Five Words")));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
