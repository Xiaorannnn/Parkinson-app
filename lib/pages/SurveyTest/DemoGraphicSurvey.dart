import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parkinsons_app/pages/SurveyTest/MultipleChoiceQuestion.dart';
import 'package:parkinsons_app/pages/SurveyTest/NumberInputQuestion.dart';
import 'package:parkinsons_app/pages/SurveyTest/Question.dart';
import 'package:parkinsons_app/pages/SurveyTest/SelectMultipleQuestion.dart';
import 'package:parkinsons_app/pages/SurveyTest/StringInputQuestion.dart';
import 'package:parkinsons_app/services/Util.dart';
import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/services/database.dart';
import 'package:parkinsons_app/services/database.dart';


import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:amplify_flutter/amplify.dart';


class DemoGraphicSurvey extends StatefulWidget {
  //set variables
  String participantAnswer;

  //constructor function
  DemoGraphicSurvey({required this.participantAnswer});

  @override
  _DemoGraphicSurveyState createState() => _DemoGraphicSurveyState();
}

class _DemoGraphicSurveyState extends State<DemoGraphicSurvey> {

  // List<String> questions = [
  //   "How old are you?",
  //   "What is your sex?",
  //   "Which race do you identify with?",
  //   "What is the highest level of education that you have completed?",
  //   "What is your current employment status?",
  //   "What is your current marital status?",
  //   "Are you a spouse, partner or care-partner of someone who has Parkinson disease?",
  //   "Are you a spouse, partner or care-partner of someone who has Alzheimer's  disease?",
  //   "Have you ever participated in a research study or clinical trial on Parkinson disease or Alzheimer's disease before?",
  //   "How easy is it for you to use your smartphone?",
  //   "Do you ever use your smartphone to look for health or medical information online?",
  //   "Do you use the Internet or email at home?",
  //   "Do you ever use the Internet to look for health or medical information online?",
  //   "Do you ever use your smartphone to participate in a video call or video chat?",
  //   "Have you been diagnosed by a medical professional with Parkinson disease?",
  //   "In what year did your movement symptoms begin?",
  //   "In what year were you diagnosed with Parkinson disease?",
  //   "In what year did you begin taking Parkinson disease medication? Type in 0 if you have not started to take Parkinson medication.",
  //   "What kind of health care provider currently cares for your Parkinson disease?",
  //   "Have you ever had Deep Brain Stimulation?",
  //   "Have you ever had any surgery for Parkinson disease, other than DBS?",
  //   "Have you been diagnosed by a medical professional with Alzheimer's disease?",
  //   "In what year did your cognitive-related symptoms begin?",
  //   "In what year were you diagnosed with Alzheimer's disease?",
  //   "In what year did you begin taking Alzheimer's disease medication? Type in 0 if you have not started to take Alzheimer's medication.",
  //   "What kind of health care provider currently cares for your Alzheimer's disease?",
  //   "Have you ever smoked?",
  //   "How many years have you smoked?",
  //   "On average, how many packs did you smoke each day?",
  //   "When is the last time you smoked (put today’s date if you are still smoking)?",
  //   "Has a doctor ever told you that you have any of the following conditions? Please check all that apply. ",
  // ];

  //the choices that users would answer
  List<String> questions = [
    "你几岁了?",
    "你的性别是?",
    "你的种族是?",
    "你的最高学历是?",
    "你目前的工作状态是?",
    "你目前的婚姻状况是?",
    "你是帕金森氏症患者的配偶、伴侣或照顾伴侣吗?",
    "你是老年痴呆症患者的配偶、伴侣或关怀伴侣吗?",
    "您曾经参与过帕金森病或阿尔茨海默病的研究或临床试验吗?",
    "使用智能手机对你来说容易吗?",
    "你曾经用你的智能手机在网上寻找健康或医疗信息吗?",
    "你在家使用互联网或电子邮件吗?",
    "你曾经使用互联网在网上寻找健康或医疗信息吗?",
    "你是否曾使用智能手机参与视频通话或视频聊天?",
    "你是否被医学专家诊断为帕金森病?",
    "你的运动障碍是从哪一年开始的?",
    "哪一年你被诊断患有帕金森症?",
    "你是哪一年开始服用帕金森病药物的?如果你还没有开始服用帕金森药物，请输入0。",
    "什么样的医疗保健提供者目前照顾你的帕金森病?",
    "您接受过脑深层刺激手术吗吗?",
    "除了脑起搏器之外，你是否做过帕金森病的手术?",
    "你是否被医学专家诊断患有阿尔茨海默氏症?",
    "你的认知相关症状是从哪一年开始的?",
    "你在哪一年被诊断出患有阿尔茨海默氏症?",
    "你是从哪一年开始服用老年痴呆症药物的?如果你还没有开始服用治疗阿尔茨海默病的药物，请输入0。",
    "目前有哪些医疗机构在治疗你的阿尔茨海默病?",
    "你抽过烟吗?",
    "你抽烟多少年了?",
    "你平均每天抽几包烟?",
    "你最近一次吸烟是什么时候(如果你还在吸烟，写上今天的日期)?",
    "有医生告诉过你你有以下情况吗?请选择所有符合要求的。"
  ];

  List<List<String>> choices_array = [
  //   ["integer"],
  //   ["Female", "Male", "Prefer not to answer"],
  //   [
  //     "",
  //     "Black or African",
  //     "Latino/Hispanic",
  //     "Native American",
  //     "Pacific Islander",
  //     "Middle Eastern",
  //     "Caribbean",
  //     "South Asian",
  //     "East Asian",
  //     "White or Caucasian",
  //     "Mixed"
  //   ],
  //   [
  //     "A homemaker",
  //     "A student",
  //     "Employment for wages",
  //     "Out of work",
  //     "Retired",
  //     "Self-employed",
  //     "Unable to work"
  //   ],
  //   [
  //     "2-year college degree",
  //     "4-year college degree",
  //     "Doctoral Degree",
  //     "High School Diploma/GED",
  //     "Master's Degree",
  //     "Some college",
  //     "Some graduate school",
  //     "Some high school"
  //   ],
  //   [
  //     "Divorced",
  //     "Married or domestic partnership",
  //     "Other",
  //     "Separated",
  //     "Single, never married",
  //     "Widowed"
  //   ],
  //   ["true", "false"],
  //   ["true", "false"],
  //   ["true", "false"],
  //   [
  //     "Difficult",
  //     "Easy",
  //     "Neither easy nor difficult",
  //     "Very Difficult",
  //     "Very easy"
  //   ],
  //   ["true", "false", "Not sure"],
  //   ["true", "false"],
  //   ["true", "false"],
  //   ["true", "false"],
  //   ["true", "false"],
  //   ["integer"],
  //   ["integer"],
  //   ["integer"],
  //   [
  //     "Don't know",
  //     "General Neurologist (non-Parkinson Disease specialist)",
  //     "Nurse Practitioner or Physician's Assistant",
  //     "Other",
  //     "Parkinson Disease/Movement Disorder Specialist",
  //     "Primary Care Doctor"
  //   ],
  //   ["true", "false"],
  //   ["true", "false"],
  //   ["true", "false"],
  //   ["integer"],
  //   ["integer"],
  //   ["integer"],
  //   [
  //     "Don't know",
  //     "General Neurologist (non-Parkinson Disease specialist)",
  //     "Nurse Practitioner or Physician's Assistant",
  //     "Other",
  //     "Parkinson Disease/Movement Disorder Specialist",
  //     "Primary Care Doctor"
  //   ],
  //   ["true", "false"],
  //   ["integer"],
  //   ["1", "2", "3", "4", "5"],
  //   ["integer"],
  //   [
  //     "",
  //     "Acute Myocardial Infarction/Heart Attack",
  //     "Alzheimer Disease or Alzheimer dementia",
  //     "Atrial Fibrillation",
  //     "Anxiety",
  //     "Cataract",
  //     "Kidney Disease",
  //     "Chronic Obstructive Pulmonary Disease or Asthma",
  //     "Heart Failure/Congestive Heart Failure",
  //     "Diabetes or Pre­diabetes or High Blood Sugar",
  //     "Glaucoma",
  //     "Hip/Pelvic Fracture",
  //     "Ischemic Heart Disease",
  //     "Depression",
  //     "Osteoporosis",
  //     "Rheumatoid Arthritis",
  //     "Dementia",
  //     "Stroke/Transient Ischemic Attack",
  //     "Breast Cancer",
  //     "Colorectal Cancer",
  //     "Prostate Cancer",
  //     "Lung Cancer",
  //     "Endometrial/Uterine Cancer",
  //     "Any other kind of cancer OR tumor",
  //     "Head Injury with Loss of Consciousness/Concussion",
  //     "Urinary Tract infections",
  //     "Obstructive Sleep Apnea",
  //     "Schizophrenia or Bipolar Disorder",
  //     "Peripheral Vascular Disease"
  //   ],
  // ];

    //answers patients would choose
    ["integer"],
    ["女性", "男性", "不想回答"],
    ["string"],
    [
      "2年制大学学位",
      "4年制大学学位",
      "博士学位",
      "高中",
      "硕士",
      "学院",
      "研究生院",
      "技校"
    ],
    [
      "家庭主妇",
      "学生",
      "就业工人",
      "失业",
      "退休",
      "个体经营",
      "无就业能力"
    ],
    [
      "离婚",
      "已婚或同居伙伴关系",
      "其他",
      "分居",
      "单身，从未结婚",
      "丧偶"
    ],
    ["是", "否"],
    ["是", "否"],
    ["是", "否"],
    [
      "困难",
      "简单",
      "中等",
      "非常困难",
      "非常简单"
    ],
    ["是", "否", "不确定"],
    ["是", "否"],
    ["是", "否"],
    ["是", "否"],
    ["是", "否"],
    ["integer"],
    ["integer"],
    ["integer"],
    [
      "不知道",
      "普通神经科医师(非帕金森病专家)",
      "执业护士或医生助理",
      "其他",
      "帕金森病/运动障碍专家",
      "主治医生"
    ],
    ["是", "否"],
    ["是", "否"],
    ["是", "否"],
    ["integer"],
    ["integer"],
    ["integer"],
    [
      "不知道",
      "普通神经科医师(非帕金森病专家)",
      "执业护士或医生助理",
      "其他",
      "帕金森病/运动障碍专家",
      "主治医生"
    ],
    ["是", "否"],
    ["integer"],
    ["1", "2", "3", "4", "5"],
    ["integer"],
    [
      "",
      "急性心肌梗死/心脏病发作",
      "阿尔茨海默病或阿尔茨海默痴呆",
      "心房颤动",
      "焦虑",
      "白内障",
      "肾脏疾病",
      "慢性阻塞性肺病或哮喘",
      "心力衰竭/充血性心力衰竭",
      "糖尿病或糖尿病前期或高血糖",
      "青光眼",
      "臀部/骨盆骨折",
      "局部缺血性心脏病",
      "沮丧",
      "骨质疏松症",
      "类风湿性关节炎",
      "痴呆",
      "中风/短暂性脑缺血发作",
      "乳腺癌",
      "结肠直肠癌",
      "前列腺癌",
      "肺癌",
      "子宫内膜和子宫癌症",
      "任何其他类型的癌症或肿瘤",
      "头部受伤，意识丧失/脑震荡",
      "尿路感染",
      "阻塞性睡眠呼吸暂停",
      "精神分裂症或双相情感障碍",
      "周围性血管疾病"
    ],
  ];

  List<Widget> widget_array = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget_array = List.generate(questions.length, (index) {
      if (choices_array[index][0] == 'string'){
        StringInputQuestion question = StringInputQuestion(question: questions[index], questionNumber: index +1);
        return question;
      } else if (choices_array[index][0] == "integer") {
        NumberInputQuestion question = NumberInputQuestion(question: questions[index], questionNumber: index + 1);
        return question;
      } else if (choices_array[index][0] == "") {
        choices_array[index].removeAt(0);
        SelectMultipleQuestion question = SelectMultipleQuestion(
            question: questions[index],
            questionNumber: index + 1,
            choices: choices_array[index]);
        return question;
      } else {
        MultipleChoiceQuestion question = MultipleChoiceQuestion(
            question: questions[index],
            questionNumber: index + 1,
            choices: choices_array[index]);
        return question;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.survey_demo_header),
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
                buildSubmitButton(screenSize, context)
              ],
            ),
          ),
        ));
  }

  //submission entrance
  void onSubmitPressed() async {
    List<String> answers = [];
    for (int i = 0; i < widget_array.length; i++) {
      Question question = widget_array[i] as Question;
      String answer = question.getAnswer();
      if (answer == "") {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("请完成所有测试后提交！")));
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
    map["Survey Participant"] = widget.participantAnswer;
    //upload data to the database
    DataBaseService db = DataBaseService(uid: uid);
    db.updateDemographicSurvey(answers, widget.participantAnswer);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("提交已记录")));
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
