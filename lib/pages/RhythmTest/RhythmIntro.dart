//import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';
import 'package:parkinsons_app/pages/RhythmTest/rhythm.dart';
//import 'package:parkinsons_app/services/Util.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RhythmIntro extends StatelessWidget {
  //set variables
  // String medicineAnswer;
  //the constructor function
  // RhythmIntro({required this.medicineAnswer});

  //build context for rhythm introduction
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("说明"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              // width: double.infinity,
              // height: screenSize.height,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Column(
                children: [
                  buildInstructions(screenSize, context),
                  buildImage(screenSize),
                  buildNextButton(context, screenSize)
                ],
              )),
        ),
      ),
    );
  }

  //build the instructions
  Widget buildInstructions(Size screenSize, context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      // Text(
      //   AppLocalizations.of(context)!.rhythm_intro_title,
      //   // "INSTRUCTIONS",
      //   style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
      // ),
      SizedBox(height: screenSize.height * 0.02),
      Text(
        AppLocalizations.of(context)!.rhythm_intro_text1,
        // "Rest your phone on a flat surface. Then use two fingers on the same hand to tap the buttons that appear. Keep tapping for 20 seconds",
        style: TextStyle(fontSize: 15),
      ),
      SizedBox(height: screenSize.height * 0.05),
      Text(
        AppLocalizations.of(context)!.rhythm_intro_text2,
        // "Tap Next to begin the test",
        style: TextStyle(fontSize: 15),
      )
    ]);
  }

  //create an image
  Widget buildImage(Size screenSize) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.05),
      child: Image.asset(
        "assets/HandImage.png",
        width: screenSize.width * 0.8,
        height: screenSize.height * 0.5,
        fit: BoxFit.fitWidth,
      ),
    );
  }

  //create a next button for users to continue
  Widget buildNextButton(BuildContext context, Size screenSize) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.white,
            padding: EdgeInsets.symmetric(
              vertical: screenSize.height * 0.025,
              horizontal: screenSize.width * 0.2,
            ),
            side: BorderSide(color: Colors.red)),
        child: Text(
            // "Next Step",
            AppLocalizations.of(context)!.rhythm_intro_next,
            style: TextStyle(fontSize: 15, color: Colors.red)),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Rhythm()));
          // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Rhythm(medicineAnswer: medicineAnswer,)));
        });
  }
}
