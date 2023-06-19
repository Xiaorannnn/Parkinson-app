import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Question.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//build a class for number input questions
class NumberInputQuestion extends StatefulWidget with Question {
  //set variables
  String question;
  int questionNumber;
  //constructor function
  NumberInputQuestion({required this.question,required this.questionNumber});

  @override
  _NumberInputQuestionState createState() => _NumberInputQuestionState();
}

class _NumberInputQuestionState extends State<NumberInputQuestion> {
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
              AppLocalizations.of(context)!.survey_question + QuestionNumber.toString(),
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Container(
                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5),
                child: Text(
                  Question,
                  style: TextStyle(fontSize: 15),
                )),

            TextField(
              decoration: new InputDecoration(labelText: AppLocalizations.of(context)!.survey_number),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              onChanged: (value){widget.answer = value as String; },// Only numbers can be entered ,
            ),
          ],
        ));
  }
}
