import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

import 'Question.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DropDownQuestion extends StatefulWidget with Question {
  String question;
  List<String> choices;
  int selected = -1;
  int questionNumber;

  DropDownQuestion(
      {required this.question,
      required this.questionNumber,
      required this.choices});

  @override
  _DropDownQuestion createState() => _DropDownQuestion();
}

class _DropDownQuestion extends State<DropDownQuestion> {
  String dropdownvalue = " ";

  @override
  Widget build(BuildContext context) {
    String Question = widget.question;
    int QuestionNumber = widget.questionNumber;
    List<String> choices = widget.choices;

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
          new DropdownButton<String>(
              value: dropdownvalue,
              items: choices.map((String choice) {
                return new DropdownMenuItem<String>(
                  value: choice,
                  child: new Text(choice),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  // widget.selected = newValue as int;
                  widget.answer = newValue!;
                  dropdownvalue = newValue;
                  print(widget.answer);
                });
              })
        ],
      ),
    );
  }
}
