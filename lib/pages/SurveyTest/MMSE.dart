import 'package:flutter/material.dart';
import 'package:parkinsons_app/pages/SurveyTest/HorizontalMultipleChoiceQuestion.dart';
import 'package:parkinsons_app/pages/SurveyTest/MultipleChoiceQuestion.dart';
import 'package:parkinsons_app/services/Util.dart';
import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/services/database.dart';

import 'Question.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MMSE extends StatefulWidget {
  @override
  _MMSEState createState() => _MMSEState();
}

class _MMSEState extends State<MMSE> {
  List<String> questions = [
    "“现在的年份是多少？季节是什么？月份是多少？日期是几号？今天是周几？”",
    "“我们现在在哪里？在哪个省？哪个市？哪个区？哪所医院？第几层？”",
    "检查者清楚而缓慢地命名三个不相关的物体，然后指导员让患者说出所有三个物体的名字。患者的反应用于评分。如果可能的话，检查者重复它们直到患者掌握所有这些物体",
    "“我希望你从 100 倒数 7。” (93, 86, 79,72, 65, ...) \n替代：“向后拼写WORLD。” (D-L-R-O-W)",
    "“之前我告诉过你三样东西的名字。你能告诉我那些是什么吗?”",
    "向患者展示两个简单的物体，例如手表和铅笔，并让患者说出它们的名字。",
    "“重复这句话：‘没有如果、和、或但是。’”",
    "“拿右手拿纸，对折，放在地上。”\n（考官递给病人一张白纸。）",
    "“请阅读此内容并按照其说的去做。” （书面说明是“闭上眼睛”。）",
    "编造一个关于任何事情的句子。”\n（这句话必须包含一个名词和一个动词。）"
  ];
  // List<String> questions = [
  //   "“What is the year? Season? Date? Day? Month?”",
  //   "“Where are we now? State? County? Town/city? Hospital? Floor?”",
  //   "The examiner names three unrelated objects clearly and slowly, then the instructor asks the patient to name all three of them. The patient’sresponse is used for scoring. The examiner repeats them until patient learns all of them, if possible",
  //   "“I would like you to count backward from 100 by sevens.” (93, 86, 79,72, 65, …) \nAlternative: “Spell WORLD backwards.” (D-L-R-O-W)",
  //   "“Earlier I told you the names of three things. Can you tell me whatthose were?”",
  //   "Show the patient two simple objects, such as a wristwatch and a pencil, and ask the patient to name them.",
  //   "“Repeat the phrase: ‘No ifs, ands, or buts.’”",
  //   "“Take the paper in your right hand, fold it in half, and put it on the floor.”\n(The examiner gives the patient a piece of blank paper.)",
  //   "“Please read this and do what it says.” (Written instruction is “Closeyour eyes.”)",
  //   "Make up and write a sentence about anything.”\n(This sentence must contain a noun and a verb.)"
  // ];


  List<List<String>> choices = [
    ['0', '1', '2', '3', '4', '5'],
    ['0', '1', '2', '3', '4', '5'],
    ['0', '1', '2', '3'],
    ['0', '1', '2', '3', '4', '5'],
    ['0', '1', '2', '3'],
    ['0', '1', '2'],
    ['0', '1'],
    ['0', '1', '2', '3'],
    ['0', '1'],
    ['0', '1'],
  ];

  List<Widget> widget_array = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget_array = List.generate(questions.length, (index) {
      return MultipleChoiceQuestion(
          question: questions[index],
          questionNumber: index + 1,
          choices: choices[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("MMSE"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: screenSize.height,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: ListView(
              children: [
                buildInstructions(),
                    Column(
                  children: widget_array,
                ),
                buildSubmitButton(screenSize)
              ],
            ),
          ),
        ));
  }

  Widget buildInstructions() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          Text(
            AppLocalizations.of(context)!.survey_MMSE_instruction,
            // "Instructions: Score one point for each correct response within each question or activity.",
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          )
        ],
      ),
    );
  }

  void onSubmitPressed() async {
    List<String> answers = [];
    for (int i = 0; i < widget_array.length; i++) {
      Question question = widget_array[i] as Question;
      String answer = question.getAnswer();
      if (answer == "") {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Please answer all Questions")));
        return;
      }
      answers.add(answer);
    }
    String uid = AuthService().getCurrentUser().uid;
    String timestamp = createTimeStamp();
    Map<String, dynamic> map = {};
    for (int i = 0; i < answers.length; i++) {
      map["Question " + (i + 1).toString()] = answers[i];
    }
    await DataBaseService(uid: uid)
        .userCollection
        .doc(uid)
        .collection("MMSE")
        .doc(timestamp)
        .set(map);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("Submission recorded")));
  }

  Widget buildSubmitButton(Size screenSize) {
    return Container(
      width: screenSize.width * 0.8,
      height: screenSize.height * 0.05,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
        onPressed: onSubmitPressed,
        child: Text(AppLocalizations.of(context)!.survey_submit_answer),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))),
      ),
    );
  }
}
