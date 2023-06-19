import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parkinsons_app/pages/SurveyTest/SurveyMenu.dart';
import 'package:parkinsons_app/services/Util.dart';
import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/services/database.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:amplify_flutter/amplify.dart';

//build the class for MDSUPDRS test
class MDSUPDRS extends StatefulWidget {
  String participantAnswer;
  MDSUPDRS({required this.participantAnswer});

  static bool MDSUPDRSCompleted = false;

  @override
  _MDSUPDRSState createState() => _MDSUPDRSState();
}

class _MDSUPDRSState extends State<MDSUPDRS> {

  List<String> questions = [
    "今天你的健康状况是好是坏(0表示你能想象到的最糟糕的健康状况，100表示你能想象到的最好的健康状况)?",
    "在过去的一周中，你有多少次做以下运动超过15分钟?剧烈运动(心跳加快)",
    "在过去的一周中，你有多少次做以下运动超过15分钟?适度运动(不累)",
    "在过去的一周中，你有多少次做以下运动超过15分钟?最少的工作",
    "在过去一周的闲暇时间里，你多久做一次能让你出汗(心跳加快)的有规律的活动?",
    "在过去的一周中，你是否有记忆问题、跟不上对话、注意力不集中、思维不清晰，或者在家里或镇上找路的问题?",
    "在过去的一周里，你是否感到情绪低落、悲伤、绝望或无法享受事物?",
    "在过去的一周中，你是否感到紧张、担心或紧张?",
    "在过去的一周里，你是否对活动或与人在一起感到漠不关心?",
    "在过去的一周中，你是否有晚上难以入睡或整晚无法入睡的问题?想想早上醒来后你有多放松。",
    "在过去的一周中，你是否在白天难以保持清醒?",
    "在过去的一周中，你的讲话有问题吗?",
    "在过去的一周里，你是否经常在处理食物和使用餐具时遇到麻烦?例如，你用手拿食物或使用叉子、刀子、勺子、筷子时有困难吗?",
    "在过去的一周中，你是否经常出现穿衣问题?例如，你是否反应迟钝，或者在扣扣子、拉拉链、穿或脱衣服或珠宝方面需要帮助?",
    "在过去的一周里，你是否经常行动迟缓，或者在洗漱、洗澡、刮胡子、刷牙、梳头发或其他个人卫生方面需要帮助?",
    "在过去的一周里，人们读你的笔迹时有困难吗?",
    "在过去的一周中，你是否经常在你的爱好或其他你喜欢做的事情上遇到困难?",
    "在过去的一周里，你在床上翻身时有困难吗?",
    "在过去的一周里，你是否经常感到身体摇晃或颤抖?",
    "在过去的一周里，你是否经常有平衡和行走方面的问题?",
    "在过去的一周里，在你平常走路的时候，你会突然停下来或者像你的脚粘在地板上一样僵住吗?"
  ];

  List<int>numInputSelected = [];

  List<int> selected = [];
  List<int> answers = [];



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < 21; i++) {
      selected.add(0);
      answers.add(-1);
    }
    answers[0] = 0;
  }

  Future<bool?> showWarning(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("您确定想要退出吗？"),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text("取消")
          ),
          ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text("确认")
          )
        ],
      ));

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery
        .of(context)
        .size;
    return WillPopScope(
        onWillPop: () async {
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        },

    child: Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.survey_menu_choice1,
          // "Survey",
          style: TextStyle(fontSize: 15.0),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            //buildInstructions(),
            buildSliderQuestion(screenSize,0,context),
            // buildNumInputQuestion(1,context),
            // buildNumInputQuestion(2,context),
            // buildNumInputQuestion(3,context),
            buildDropDownQuestion1(1, context),
            buildDropDownQuestion2(2, context),
            buildDropDownQuestion3(3, context),
            buildGELTQuestion(4,context),
            buildMDSQuestion(5,context),
            buildMDSQuestion(6,context),
            buildMDSQuestion(7,context),
            buildMDSQuestion(8,context),
            buildMDSQuestion(9,context),
            buildMDSQuestion(10,context),
            buildMDSQuestion(11,context),
            buildMDSQuestion(12,context),
            buildMDSQuestion(13,context),
            buildMDSQuestion(14,context),
            buildMDSQuestion(15,context),
            buildMDSQuestion(16,context),
            buildMDSQuestion(17,context),
            buildMDSQuestion(18,context),
            buildMDSQuestion(19,context),
            buildMDSQuestion(20,context),
            buildSubmitButton(screenSize,context)
          ],
        ),
      ),
    )
    );
  }

  Widget buildInstructions() {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          Text("谢谢！",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
          Text(
              "请仔细如实回答所有问题并点击提交按钮！")
        ],
      ),
    );
  }

  Widget buildSliderQuestion(Size screenSize,int index,BuildContext context) {


    String Question = questions[index];
    int QuestionNumber = index + 1;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        children: [
          Divider(
            thickness: 2.0,
          ),
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
          Container(
            width: screenSize.width * 0.7,
            height: screenSize.height * 0.05,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Row(
              children: [
                Expanded(child: Slider(
                  min: 0.0,
                  max: 100.0,
                  value: answers[index].toDouble(),
                  onChanged: (value){
                    setState(() {
                      answers[index] = value.toInt();
                    });
                  },
                  inactiveColor: Colors.white,
                  activeColor: Colors.blue,)),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    child:Text(answers[index].toString()))
              ],
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }

  int dropdownvalue1 = 1;
  Widget buildDropDownQuestion1(int index, BuildContext context) {
    String Question = questions[index];
    int QuestionNumber = index + 1;
    List<int> choices = [0,1,2,3,4,5,6,
      7,8,9,10,11,12,13,14,15,16,17,18,19,20,];
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
          new DropdownButton<int>(
              value: dropdownvalue1,
              items: choices.map((int choice) {
                return new DropdownMenuItem<int>(
                  value: choice,
                  child: new Text(choice.toString()),
                );
              }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  answers[index] = newValue!.toInt();
                  dropdownvalue1 = newValue;
                  print(answers[index]);
                });
              }
          )
        ],
      ),
    );
  }

  int dropdownvalue2 = 1;
  Widget buildDropDownQuestion2(int index, BuildContext context) {
    String Question = questions[index];
    int QuestionNumber = index + 1;
    List<int> choices = [0,1,2,3,4,5,6,
      7,8,9,10,11,12,13,14,15,16,17,18,19,20,];
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
          new DropdownButton<int>(
              value: dropdownvalue2,
              items: choices.map((int choice) {
                return new DropdownMenuItem<int>(
                  value: choice,
                  child: new Text(choice.toString()),
                );
              }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  answers[index] = newValue!.toInt();
                  dropdownvalue2 = newValue;
                  print(answers[index]);
                });
              }
          )
        ],
      ),
    );
  }

  int dropdownvalue3 = 1;
  Widget buildDropDownQuestion3(int index, BuildContext context) {
    String Question = questions[index];
    int QuestionNumber = index + 1;
    List<int> choices = [0,1,2,3,4,5,6,
      7,8,9,10,11,12,13,14,15,16,17,18,19,20,];
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
          new DropdownButton<int>(
              value: dropdownvalue3,
              items: choices.map((int choice) {
                return new DropdownMenuItem<int>(
                  value: choice,
                  child: new Text(choice.toString()),
                );
              }).toList(),
              onChanged: (int? newValue) {
                setState(() {
                  answers[index] = newValue!.toInt();
                  dropdownvalue3 = newValue;
                  print(answers[index]);
                });
              }
          )
        ],
      ),
    );
  }



  Widget buildNumInputQuestion(int index, BuildContext context) {
    String Question = questions[index];
    int QuestionNumber = index + 1;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
              onChanged: (value){answers[index] = int.parse(value); },// Only numbers can be entered ,
    ),
          ],
        ));

    }

  Widget buildGELTQuestion(int index, BuildContext context) {

    String Question = questions[index];
    int QuestionNumber = index + 1;

    //choices that the user can pick
    String choice1 = AppLocalizations.of(context)!.survey_MDS_often;
    String choice2 = AppLocalizations.of(context)!.survey_MDS_sometimes;
    String choice3 = AppLocalizations.of(context)!.survey_MDS_never;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
          Divider(
            thickness: 2.0,
          ),
          RadioListTile(
              title: Text(choice1),
              value: 1,
              groupValue: selected[index],
              onChanged: (value) {
                setState(() {
                  selected[index] = value as int;
                  answers[index] = value - 1;
                });
              }),
          RadioListTile(
              title: Text(choice2),
              value: 2,
              groupValue: selected[index],
              onChanged: (value) {
                setState(() {
                  selected[index] = value as int;
                  answers[index] = value;
                });
              }),
          RadioListTile(
              title: Text(choice3),
              value: 3,
              groupValue: selected[index],
              onChanged: (value) {
                setState(() {
                  selected[index] = value as int;
                  answers[index] = value;
                });
              }),
          Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
  Widget buildMDSQuestion(int index, BuildContext context) {

    String Question = questions[index];
    int QuestionNumber = index + 1;

    //choices that the user can pick
    String choice1 = AppLocalizations.of(context)!.survey_MDS_normal;
    String choice2 = AppLocalizations.of(context)!.survey_MDS_slight;
    String choice3 = AppLocalizations.of(context)!.survey_MDS_mild;
    String choice4 = AppLocalizations.of(context)!.survey_MDS_moderate;
    String choice5 = AppLocalizations.of(context)!.survey_MDS_severe;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
          Divider(
            thickness: 2.0,
          ),
          RadioListTile(
              title: Text(choice1),
              value: 1,
              groupValue: selected[index],
              onChanged: (value) {
                setState(() {
                  selected[index] = value as int;
                  answers[index] = value - 1;
                });
              }),
          RadioListTile(
              title: Text(choice2),
              value: 2,
              groupValue: selected[index],
              onChanged: (value) {
                setState(() {
                  selected[index] = value as int;
                  answers[index] = value-1;
                });
              }),
          RadioListTile(
              title: Text(choice3),
              value: 3,
              groupValue: selected[index],
              onChanged: (value) {
                setState(() {
                  selected[index] = value as int;
                  answers[index] = value-1;
                });
              }),
          RadioListTile(
              title: Text(choice4),
              value: 4,
              groupValue: selected[index],
              onChanged: (value) {
                setState(() {
                  selected[index] = value as int;
                  answers[index] = value-1;
                });
              }),
          RadioListTile(
              title: Text(choice5),
              value: 5,
              groupValue: selected[index],
              onChanged: (value) {
                setState(() {
                  selected[index] = value as int;
                  answers[index] = value;
                });
              }),
          Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }

 void onSubmitPressed() async {
    final user = await Amplify.Auth.getCurrentUser();
    String uid = user.userId;
    String timestamp = createTimeStamp();
    Map<String,dynamic> map= {};
    for(int i = 0;i < answers.length ; i++){
      if(answers[i] == -1){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("请回答所有问题！")));
        return;
      }
      map["Question "+(i+1).toString()] = answers[i];
    }
    map["Survey Participant"] = widget.participantAnswer;
    DataBaseService db = DataBaseService(uid: uid);
    db.updateMDSUPDRS(answers, widget.participantAnswer);
    MDSUPDRS.MDSUPDRSCompleted = true;

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("提交已被记录")));
    int count = 0;
    Navigator.popUntil(context, (route) {return count++ == 2;});
 }


  Widget buildSubmitButton(Size screenSize, context) {
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


