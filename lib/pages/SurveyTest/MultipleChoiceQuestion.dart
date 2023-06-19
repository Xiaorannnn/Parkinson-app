import "package:flutter/material.dart";
import 'package:parkinsons_app/pages/SurveyTest/Question.dart';
//import 'package:parkinsons_app/pages/VisualMemoryTest/memory.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//build the class for multiple choice questions
class MultipleChoiceQuestion extends StatefulWidget with Question {
  //set basic variables
  String question;
  List<String> choices;
  int selected = -1;
  int questionNumber;

  //constructor function
  MultipleChoiceQuestion(
      {required this.question,
      required this.questionNumber,
      required this.choices});

  @override
  _MultipleChoiceQuestionState createState() => _MultipleChoiceQuestionState();
}

//build the context
class _MultipleChoiceQuestionState extends State<MultipleChoiceQuestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.survey_question +
                widget.questionNumber.toString(),
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 5),
              child: Text(
                widget.question,
                style: TextStyle(fontSize: 15),
              )),
          Divider(
            thickness: 2.0,
          ),
          Column(
              children: List.generate(widget.choices.length, (index) {
            RadioListTile<int> tile = RadioListTile(
                title: Text(widget.choices[index]),
                value: index,
                groupValue: widget.selected,
                onChanged: (value) {
                  setState(() {
                    widget.selected = value as int;
                    widget.answer = widget.choices[index];
                    print(widget.answer);
                  });
                });
            return tile;
          })),
          Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}
