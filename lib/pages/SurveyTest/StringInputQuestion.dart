import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

import 'Question.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//build a class for number input questions
class StringInputQuestion extends StatefulWidget with Question {
  //set variables
  String question;
  int questionNumber;
  //constructor function
  StringInputQuestion({required this.question, required this.questionNumber});

  @override
  _StringInputQuestionState createState() => _StringInputQuestionState();
}

class _StringInputQuestionState extends State<StringInputQuestion> {
  //build the context
  @override
  Widget build(BuildContext context) {
    String Question = widget.question;
    int QuestionNumber = widget.questionNumber;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.survey_question +
                  QuestionNumber.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5),
                child: Text(
                  Question,
                  style: TextStyle(fontSize: 15),
                )),
            TextField(
              decoration: new InputDecoration(
                  labelText: AppLocalizations.of(context)!.survey_string),
              keyboardType: TextInputType.text,
              onChanged: (value) {
                widget.answer = value as String;
              }, // Only numbers can be entered ,
            ),
          ],
        ));
  }
}
