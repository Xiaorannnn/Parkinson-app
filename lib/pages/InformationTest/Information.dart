import 'package:flutter/material.dart';
//import 'package:parkinsons_app/pages/SurveyTest/HorizontalMultipleChoiceQuestion.dart';
import 'package:parkinsons_app/pages/SurveyTest/MultipleChoiceQuestion.dart';
import 'package:parkinsons_app/pages/SurveyTest/NumberInputQuestion.dart';
import 'package:parkinsons_app/pages/SurveyTest/SelectMultipleQuestion.dart';
import 'package:parkinsons_app/pages/SurveyTest/StringInputQuestion.dart';
import 'package:parkinsons_app/services/Util.dart';
//import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/services/database.dart';
import 'package:parkinsons_app/pages/SurveyTest/Question.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:amplify_flutter/amplify.dart';

//build a class for the patients' information collection
class Information extends StatefulWidget {
  static bool infoCompleted = false;

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  //the choices
  List<String> questions = [
    // "您的姓名是？",
    "您的编号是？",
    "您的年龄是？",
    "您的性别是？",
    "您的主诉病症是什么？",
    "您在何时开始本次测试？",
    "您服用哪些治疗神经系统疾病的药物？（若不服用请填\"无\"",
    "您服用治疗神经系统疾病的药物的频率是？"
  ];

  //basic variables
  List<List<String>> choices = [
    // ["string"],
    ["string"],
    ["integer"],
    ["女性", "男性", "不想回答"],
    ["帕金森", "阿兹海默", "帕金森伴随认知障碍或失智并发症", "无", "其他"],
    ["服用帕金森药物之前", "服用帕金森药物之后", "另一个时间", "我不服用帕金森药物"],
    ["string"],
    //7
    [
      "不服药",
      "三日一次",
      "两日一次",
      "每日一次",
      "每日两次",
      "每日三次",
      "每日四次",
      "每日五次",
      "每日六次",
      "每日六次以上",
      "随机时间",
      "其他"
    ]
    // ["string"]
  ];

  List<Widget> widget_array = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget_array = List.generate(questions.length, (index) {
      if (choices[index][0] == "string") {
        StringInputQuestion question = StringInputQuestion(
            question: questions[index], questionNumber: index + 1);
        return question;
      } else if (choices[index][0] == "integer") {
        NumberInputQuestion question = NumberInputQuestion(
            question: questions[index], questionNumber: index + 1);
        return question;
      } else if (choices[index][0] == "") {
        choices[index].removeAt(0);
        SelectMultipleQuestion question = SelectMultipleQuestion(
            question: questions[index],
            questionNumber: index + 1,
            choices: choices[index]);
        return question;
      } else {
        MultipleChoiceQuestion question = MultipleChoiceQuestion(
            question: questions[index],
            questionNumber: index + 1,
            choices: choices[index]);
        return question;
      }
    });
  }

  Future<bool?> showWarning(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("您确定想要退出吗？"),
            actions: [
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text("取消")),
              ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text("确认"))
            ],
          ));

  //build the text
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      child: Scaffold(
          appBar: AppBar(
            title: Text("基本信息填写"),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Container(
              width: double.infinity,
              height: screenSize.height,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: ListView(
                children: [
                  Column(
                    children: widget_array,
                  ),
                  buildSubmitButton(screenSize)
                ],
              ),
            ),
          )),
      onWillPop: () async {
        final shouldPop = await showWarning(context);
        return shouldPop ?? false;
      },
    );
  }

  void onSubmitPressed() async {
    Information.infoCompleted = true;

    List<String> answers = [];
    for (int i = 0; i < widget_array.length; i++) {
      Question question = widget_array[i] as Question;
      String answer = question.getAnswer();
      if (answer == "") {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("请回答所有问题！")));
        return;
      }
      answers.add(answer);
    }
    final user = await Amplify.Auth.getCurrentUser();
    String uid = user.userId;
    String timestamp = createTimeStamp();
    Map<String, dynamic> map = {};
    for (int i = 0; i < answers.length; i++) {
      map["Question " + (i + 1).toString()] = answers[i];
    }

    DataBaseService db = DataBaseService(uid: uid);
    db.updateInformation(answers);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("记录已提交！")));
    Navigator.pop(context);
  }

  Widget buildSubmitButton(Size screenSize) {
    return Container(
      width: screenSize.width * 0.8,
      height: screenSize.height * 0.05,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
        onPressed: onSubmitPressed,
        child: Text(AppLocalizations.of(context)!.information_submit),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))),
      ),
    );
  }
}
