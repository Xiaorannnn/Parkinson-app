import 'package:flutter/material.dart';

import 'Question.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HorizontalMultipleChoiceQuestion extends StatefulWidget with Question {
  //set variables
  String question;
  List<String> choices;
  int selected = -1;
  int questionNumber;
  //constructor function
  HorizontalMultipleChoiceQuestion(
      {required this.question,
        required this.questionNumber,
        required this.choices});


  @override
  _HorizontalMultipleChoiceQuestionState createState() => _HorizontalMultipleChoiceQuestionState();
}

//build the context
class _HorizontalMultipleChoiceQuestionState extends State<HorizontalMultipleChoiceQuestion> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.survey_question + widget.questionNumber.toString(),
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
          Row(
              children: List.generate(widget.choices.length, (index) {
                Flexible tile = Flexible(child:RadioListTile(
                    title: Text(widget.choices[index]),
                    value: index,
                    groupValue: widget.selected,
                    onChanged: (value) {
                      setState(() {
                        widget.selected = value as int;
                        widget.answer = widget.choices[index];
                        print(widget.answer);
                      });
                    }));
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
