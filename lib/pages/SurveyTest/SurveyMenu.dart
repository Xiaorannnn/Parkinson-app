import 'package:flutter/material.dart';
import 'package:parkinsons_app/pages/SurveyTest/MMSE.dart';
import 'package:parkinsons_app/pages/SurveyTest/ParticipantQuestion.dart';
import 'package:parkinsons_app/widgets/WideButton.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class SurveyMenu extends StatefulWidget {

  @override
  _SurveyMenuState createState() => _SurveyMenuState();
}

class _SurveyMenuState extends State<SurveyMenu> {


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context)!.survey_header
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
                  color: Colors.blue,
                  buttonText: AppLocalizations.of(context)!.survey_menu_choice1,
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => ParticipantQuestion(routeNameOfNextWidget: '/MDS-UPRDS',) ));
                  }),
              WideButton(
                  color: Colors.blue,
                  buttonText: AppLocalizations.of(context)!.survey_menu_choice2,
                  onPressed: () {

                    Navigator.push(context,MaterialPageRoute(builder: (context) => MMSE()));
                  }),
              WideButton(
                  color: Colors.blue,
                  buttonText: AppLocalizations.of(context)!.survey_menu_choice3,
                  onPressed: () {

                    Navigator.push(context,MaterialPageRoute(builder: (context) => ParticipantQuestion(routeNameOfNextWidget: '/DemoGraphicSurvey',) ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
