import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

import 'Question.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DateQuestion extends StatefulWidget with Question {
  String question;
  List<String> choices;
  int selected = -1;
  int questionNumber;

  DateQuestion(
      {required this.question,
      required this.questionNumber,
      required this.choices});

  @override
  _DateQuestion createState() => _DateQuestion();
}

class _DateQuestion extends State<DateQuestion> {
  String dropdownvalue = " ";
  DateTime selectedDate = DateTime(2000, 1, 1);

  @override
  Widget build(BuildContext context) {
    String Question = widget.question;
    int QuestionNumber = widget.questionNumber;
    List<String> choices = widget.choices;
    widget.answer = selectedDate.toString();

    _selectDate(BuildContext context) async {
      // setState(() {
      //   widget.answer = selectedDate.toString();
      //   print(widget.answer);
      // });
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate, // Refer step 1
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
      );
      if (picked != null && picked != selectedDate)
        setState(() {
          widget.answer = picked.toString();
          selectedDate = picked;
          print(widget.answer);
        });
    }

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
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    "选择日期",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    //backgroundColor: Colors.greenAccent,
                    primary: Colors.greenAccent,
                  )),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "${selectedDate.toLocal()}".split(' ')[0],
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}
