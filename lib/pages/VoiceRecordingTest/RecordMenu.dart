import 'package:flutter/material.dart';
import 'package:parkinsons_app/pages/RecordActivity.dart';
import 'package:parkinsons_app/services/Util.dart';
import 'package:parkinsons_app/widgets/WideButton.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class RecordMenu extends StatefulWidget {
  String medicineAnswer;

  RecordMenu({required this.medicineAnswer});

  @override
  _RecordMenuState createState() => _RecordMenuState();
}

class _RecordMenuState extends State<RecordMenu> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context)!.voice_header
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
                  color: Colors.blue,
                  buttonText: AppLocalizations.of(context)!.voice_vowel,
                  // "Pronounce Vowel",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecordActivity(
                                medicineAnswer: widget.medicineAnswer,
                                activityTitle: "Record Vowel Test",
                                instructionText:
                                    AppLocalizations.of(context)!.voice_vowel_instruction,
                                    // "Pronounce 'a' and hold for 5 seconds",
                                subInstructionsText: "")));
                    // '/recordbreath': (context) => RecordActivity(activityTitle: "Record Breath Test",instructionText:"Take a deep breath three times",subInstructionsText: "Inhale for four seconds each breath!"),
                    // '/recordsentence': (context) => RecordActivity(activityTitle:"Record Sentence Test",instructionText:"Read the following sentence:",subInstructionsText: "When the sunlight strikes raindrops in the air they act as a prism and form a rainbow. The rainbow is a division of white light into many beautiful colors."),
                  }),
              WideButton(
                  color: Colors.blue,
                  buttonText: AppLocalizations.of(context)!.voice_deep_breath,
                  // "Deep Breath",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecordActivity(
                                medicineAnswer: widget.medicineAnswer,
                                activityTitle: "Record Breath Test",
                                instructionText:
                                    AppLocalizations.of(context)!.voice_deep_breath_instruction,
                                    // "Take a deep breath three times",
                                subInstructionsText: AppLocalizations.of(context)!.voice_deep_breath_subinstruction
                                    // "Inhale for four seconds each breath"
                            )));
                  }),
              WideButton(
                  color: Colors.blue,
                  buttonText: AppLocalizations.of(context)!.voice_read,
                  // "Read Sentence",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecordActivity(
                                medicineAnswer: widget.medicineAnswer,
                                activityTitle: "Record Sentence Test",
                                instructionText: AppLocalizations.of(context)!.voice_read_instruction,
                                // "Read the following sentence",
                                subInstructionsText:
                                AppLocalizations.of(context)!.voice_read_subinstruction
                                    // "When the sunlight strikes raindrops in the air they act as a prism and form a rainbow. The rainbow is a division of white light into many beautiful colors."
                            )));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
