import 'package:flutter/material.dart';
//import 'package:parkinsons_app/pages/SurveyTest/HorizontalMultipleChoiceQuestion.dart';
import 'package:parkinsons_app/pages/SurveyTest/MultipleChoiceQuestion.dart';
import 'package:parkinsons_app/services/Util.dart';
//import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/services/database.dart';
import 'Question.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:amplify_flutter/amplify.dart';

//build a class for the mmse test
class MMSE extends StatefulWidget {
  static bool MMSECompleted = false;

  @override
  _MMSEState createState() => _MMSEState();
}

class _MMSEState extends State<MMSE> {
  //the choices
  List<String> questions = [
    "现在是（星期几）（几号）（几月）（什么季节）（哪一年）？",
    "现在我们在哪里：（省市）（区或县）（街道或乡）（什么地方）（第几层楼）？",
    "现在我要说三样东西的名称，在我讲完以后，请您重复说一遍。（请仔细说清楚，每样东西一秒钟）。\"皮球\"\"国旗\"\"树木\" 请您把这三样东西说一遍（以第一次的答案记分）",
    "请您算一算100减7，然后从所得的数目再减去7，如此一直计算下去，请您将每减一个7后的答案告诉我，直到我说停为止。（若某一答案错误，但下一答案正确，只记一次错误）",
    "现在请您说出刚才我让您记住的三样东西？ \"皮球\"，\"国旗\"，\"树木\"",
    "向患者展示两个简单的物体，例如手表和铅笔，并让患者说出它们的名字。",
    "现在我要说一句话，请您跟着我清楚的重复一遍。 \"四十四只石狮子\"",
    "我给您一张纸请您按我说的去做，现在开始：\"用右手拿着这张纸，用两只手将它对折起来，放在您的大腿上\"。（不要重复说明，也不要示范）",
    "请您念一念这句话，并且按它的意思去做。闭上你的眼睛",
    "编造一个关于任何事情的句子。\n（这句话必须包含一个名词和一个动词。）"
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

  //basic variables
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
        onWillPop: () async {
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        },
        child: Scaffold(
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
            )));
  }

  //build the instructions for the MMSE test
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
    MMSE.MMSECompleted = true;
    db.updateMMSE(answers);
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
        child: Text(AppLocalizations.of(context)!.survey_submit_answer),
        style: ButtonStyle(
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))),
      ),
    );
  }
}
