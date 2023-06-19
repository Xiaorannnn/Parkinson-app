import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:parkinsons_app/models/DemographicSurvey.dart';
//import 'package:parkinsons_app/models/MDSUPDRS.dart';
import 'package:parkinsons_app/pages/SurveyTest/MDS-UPDRS.dart' as mdsClass;
import 'package:parkinsons_app/pages/SurveyTest/MMSE.dart';
import 'package:parkinsons_app/pages/SurveyTest/ParticipantQuestion.dart';
import 'package:parkinsons_app/widgets/WideButton.dart';
import 'package:parkinsons_app/pages/SurveyTest/DemoGraphicSurvey.dart'
    as demoClass;

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SurveyMenu extends StatefulWidget {
  @override
  _SurveyMenuState createState() => _SurveyMenuState();
}

//build the survey menu
class _SurveyMenuState extends State<SurveyMenu> {
  bool MDSUPDRSCompleted = mdsClass.MDSUPDRS.MDSUPDRSCompleted;
  bool MMSECompleted = MMSE.MMSECompleted;
  bool DemoCompleted = demoClass.DemoGraphicSurvey.demoCompleted;

  FutureOr onGoBackMDSUPRDS(dynamic value) {
    setState(() {
      MDSUPDRSCompleted = mdsClass.MDSUPDRS.MDSUPDRSCompleted;
    });
  }

  FutureOr onGoBackMMSE(dynamic value) {
    setState(() {
      MMSECompleted = MMSE.MMSECompleted;
    });
  }

  FutureOr onGoBackDemo(dynamic value) {
    setState(() {
      DemoCompleted = demoClass.DemoGraphicSurvey.demoCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.survey_header
            // 'Surveys'
            ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: screenSize.height,
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WideButton(
                  color: MDSUPDRSCompleted ? Colors.grey : Colors.blue,
                  buttonText: AppLocalizations.of(context)!.survey_menu_choice1,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ParticipantQuestion(
                                  routeNameOfNextWidget: '/MDS-UPRDS',
                                ))).then(onGoBackMDSUPRDS);
                  }),
              WideButton(
                  color: MMSECompleted ? Colors.grey : Colors.blue,
                  buttonText: AppLocalizations.of(context)!.survey_menu_choice2,
                  onPressed: () {
                    Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MMSE()))
                        .then(onGoBackMMSE);
                  }),
              WideButton(
                  color: DemoCompleted ? Colors.grey : Colors.blue,
                  buttonText: AppLocalizations.of(context)!.survey_menu_choice3,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ParticipantQuestion(
                                  routeNameOfNextWidget: '/DemoGraphicSurvey',
                                ))).then(onGoBackDemo);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
