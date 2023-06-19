//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
/*import 'package:parkinsons_app/pages/RhythmTest/RhythmIntro.dart';
import 'package:parkinsons_app/pages/RhythmTest/rhythm.dart';
import 'package:parkinsons_app/services/Util.dart';
import 'package:parkinsons_app/services/auth.dart';*/

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//a class for medicine questions
class MedicineQuestion extends StatefulWidget {
  //set the variables
  String routeNameOfNextWidget;

  MedicineQuestion({required this.routeNameOfNextWidget});

  @override
  _MedicineQuestionState createState() => _MedicineQuestionState();
}

class _MedicineQuestionState extends State<MedicineQuestion> {
  int selectedRadio = 0;
  String medicineAnswer = "";

  @override
  void initState() {
    // TODO: implement initState
    String lastMedicineAnswer = "";
    super.initState();
  }

  //build the interface
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          width: double.infinity,
          height: screenSize.height,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: screenSize.height * 0.025),
                buildInstructions(screenSize),
                SizedBox(height: screenSize.height * 0.025),
                Divider(
                  thickness: 2.0,
                ),
                buildQuestions(),
                Divider(
                  thickness: 2.0,
                ),
                SizedBox(height: screenSize.height * 0.025),
                buildNextButton(context, screenSize)
              ],
            ),
          ),
        )),
      ),
    );
  }

  //build the instructions for medicine questions
  Widget buildInstructions(Size screenSize) {
    return Column(
      children: [
        SizedBox(
          height: screenSize.height * 0.025,
        ),
        Text(
          // "We would like to understand how your performance on this activity could be affected by the timing of your medication.",
          AppLocalizations.of(context)!.medicine_title,
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(
          height: screenSize.height * 0.025,
        ),
        Text(
          AppLocalizations.of(context)!.medicine_question,
          // "When are you preforming this activity?",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget buildQuestions() {
    //choices that the user can pick
    String choice1 = AppLocalizations.of(context)!.medicine_choice1;
    String choice2 = AppLocalizations.of(context)!.medicine_choice2;
    String choice3 = AppLocalizations.of(context)!.medicine_choice3;
    String choice4 = AppLocalizations.of(context)!.medicine_choice4;

    return Column(
      children: [
        RadioListTile(
            title: Text(choice1),
            value: 1,
            groupValue: selectedRadio,
            onChanged: (value) {
              setState(() {
                medicineAnswer = choice1;
                selectedRadio = value as int;
              });
            }),
        RadioListTile(
            title: Text(choice2),
            value: 2,
            groupValue: selectedRadio,
            onChanged: (value) {
              setState(() {
                medicineAnswer = choice2;
                selectedRadio = value as int;
              });
            }),
        RadioListTile(
            title: Text(choice3),
            value: 3,
            groupValue: selectedRadio,
            onChanged: (value) {
              setState(() {
                medicineAnswer = choice3;
                selectedRadio = value as int;
              });
            }),
        RadioListTile(
            title: Text(choice4),
            value: 4,
            groupValue: selectedRadio,
            onChanged: (value) {
              setState(() {
                medicineAnswer = choice4;
                selectedRadio = value as int;
              });
            }),
      ],
    );
  }

  //build buttion
  Widget buildNextButton(BuildContext context, Size screenSize) {
    return ElevatedButton(
        //settings of the buttion
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.025,
              horizontal: screenSize.width * 0.2,
            ),
            side: BorderSide(color: Colors.red)),
        child: Text(AppLocalizations.of(context)!.medicine_next,
            style: TextStyle(fontSize: 15, color: Colors.red)),
        onPressed: handleNextPressed);
  }

  void handleNextPressed() {
    if (medicineAnswer != "") {
      Navigator.of(context).pushReplacementNamed(widget.routeNameOfNextWidget,
          arguments: {'medicineAnswer': medicineAnswer});
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("请回答上述问题"),
      ));
    }
  }
}
