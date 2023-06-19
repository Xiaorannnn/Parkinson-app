import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parkinsons_app/pages/RecordActivity.dart';
//import 'package:parkinsons_app/services/Util.dart';
import 'package:parkinsons_app/widgets/WideButton.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RecordMenu extends StatefulWidget {
  //set variables
  // String medicineAnswer;
  //constructor function
  // RecordMenu({required this.medicineAnswer});

  @override
  _RecordMenuState createState() => _RecordMenuState();
}

class _RecordMenuState extends State<RecordMenu> {
  bool vowelTestCompleted = RecordActivity.vowelTestCompleted;
  bool breathTestCompleted = RecordActivity.breathTestCompleted;
  bool sentenceTestCompleted = RecordActivity.sentenceTestCompleted;

  FutureOr onGoBackVowelPressed(dynamic value) {
    setState(() {
      vowelTestCompleted = RecordActivity.vowelTestCompleted;
    });
  }

  FutureOr onGoBackBreathPressed(dynamic value) {
    setState(() {
      breathTestCompleted = RecordActivity.breathTestCompleted;
    });
  }

  FutureOr onGoBackSentencePressed(dynamic value) {
    setState(() {
      sentenceTestCompleted = RecordActivity.sentenceTestCompleted;
    });
  }

  //build the context
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.voice_header
            // 'Voice Record Test'
            ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: screenSize.height,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WideButton(
                  color: vowelTestCompleted ? Colors.grey : Colors.blue,
                  buttonText: vowelTestCompleted
                      ? AppLocalizations.of(context)!.voice_vowel + " ✅"
                      : AppLocalizations.of(context)!.voice_vowel,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecordActivity(
                                activityTitle: "Record Vowel Test",
                                instructionText: AppLocalizations.of(context)!
                                    .voice_vowel_instruction,
                                subInstructionsText:
                                    ""))).then(onGoBackVowelPressed);
                    // builder: (context) => RecordActivity(
                    //     medicineAnswer: widget.medicineAnswer,
                    //     activityTitle: "Record Vowel Test",
                    //     instructionText:
                    //         AppLocalizations.of(context)!.voice_vowel_instruction,
                    //     subInstructionsText: "")));
                  }),
              WideButton(
                  color: breathTestCompleted ? Colors.grey : Colors.blue,
                  buttonText: breathTestCompleted
                      ? AppLocalizations.of(context)!.voice_deep_breath + " ✅"
                      : AppLocalizations.of(context)!.voice_deep_breath,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecordActivity(
                                activityTitle: "Record Breath Test",
                                instructionText: AppLocalizations.of(context)!
                                    .voice_deep_breath_instruction,
                                subInstructionsText:
                                    AppLocalizations.of(context)!
                                        .voice_deep_breath_subinstruction)
                            // builder: (context) => RecordActivity(
                            //     medicineAnswer: widget.medicineAnswer,
                            //     activityTitle: "Record Breath Test",
                            //     instructionText:
                            //         AppLocalizations.of(context)!.voice_deep_breath_instruction,
                            //         // "Take a deep breath three times",
                            //     subInstructionsText: AppLocalizations.of(context)!.voice_deep_breath_subinstruction
                            //         // "Inhale for four seconds each breath"
                            // )
                            )).then(onGoBackBreathPressed);
                  }),
              WideButton(
                  color: sentenceTestCompleted ? Colors.grey : Colors.blue,
                  buttonText: sentenceTestCompleted
                      ? AppLocalizations.of(context)!.voice_read + " ✅"
                      : AppLocalizations.of(context)!.voice_read,
                  // "Read Sentence",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecordActivity(
                                activityTitle: "Record Sentence Test",
                                instructionText: AppLocalizations.of(context)!
                                    .voice_read_instruction,
                                // "Read the following sentence",
                                subInstructionsText:
                                    AppLocalizations.of(context)!
                                        .voice_read_subinstruction
                                // "When the sunlight strikes raindrops in the air they act as a prism and form a rainbow. The rainbow is a division of white light into many beautiful colors."
                                )
                            // builder: (context) => RecordActivity(
                            //     medicineAnswer: widget.medicineAnswer,
                            //     activityTitle: "Record Sentence Test",
                            //     instructionText: AppLocalizations.of(context)!.voice_read_instruction,
                            //     // "Read the following sentence",
                            //     subInstructionsText:
                            //     AppLocalizations.of(context)!.voice_read_subinstruction
                            //         // "When the sunlight strikes raindrops in the air they act as a prism and form a rainbow. The rainbow is a division of white light into many beautiful colors."
                            // )
                            )).then(onGoBackSentencePressed);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
