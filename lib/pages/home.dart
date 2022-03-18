import 'package:flutter/material.dart';
import 'package:parkinsons_app/pages/MedicineQuestion.dart';
import 'package:parkinsons_app/pages/SurveyTest/MDS-UPDRS.dart';
import 'package:parkinsons_app/pages/SurveyTest/SurveyMenu.dart';
import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/widgets/WideButton.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//the home page
class Home extends StatefulWidget {
  final AuthService _auth = AuthService();

  //create the home state
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //build the context in the home state
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              buildLogout(),
              Center(
                child: Text(
                  AppLocalizations.of(context)!.home_header,
                  // "Parkinson's Behavior App!",
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: screenSize.height,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    AppLocalizations.of(context)!.home_title,
                    // "Choose a test",
                    style: TextStyle(fontSize: 15.0)),

                Divider(height: 45.0,thickness: 4.0,color: Colors.blueGrey),
                Expanded(
                    child: ListView(
                  children: [


                    //build buttons for all the tests
                    WideButton(color: Colors.blue, buttonText: AppLocalizations.of(context)!.home_rhythm, onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineQuestion(routeNameOfNextWidget: '/RhythmIntro')));
                      //Navigator.pushNamed(context, '/rhythmIntro');
                    }),

                    WideButton(color: Colors.blue, buttonText: AppLocalizations.of(context)!.home_visual_memory, onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineQuestion(routeNameOfNextWidget: '/VisualMemoryTestMenu')));
                      //  Navigator.pushNamed(context, '/difficulty');
                    }),

                    WideButton(color: Colors.blue, buttonText: AppLocalizations.of(context)!.home_voice_recording, onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineQuestion(routeNameOfNextWidget: '/RecordMenu')));
                      //  Navigator.pushNamed(context, '/recordmenu');
                    }),

                    WideButton(color: Colors.blue, buttonText: AppLocalizations.of(context)!.home_walking, onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineQuestion(routeNameOfNextWidget: '/WalkingMenu')));
                      //   Navigator.pushNamed(context, '/walking');
                    }),

                    WideButton(color: Colors.blue, buttonText: AppLocalizations.of(context)!.home_auditory_memory, onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineQuestion(routeNameOfNextWidget: '/AuditoryMenu')));
                      //Navigator.pushNamed(context, '/auditorydifficulty');
                    }),

                    WideButton(color: Colors.blue, buttonText: AppLocalizations.of(context)!.home_drawing, onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineQuestion(routeNameOfNextWidget: '/DrawingMenu')));
                      //Navigator.pushNamed(context, '/clockdraw');
                    }),

                    WideButton(color: Colors.blue, buttonText: AppLocalizations.of(context)!.home_tremor, onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineQuestion(routeNameOfNextWidget: '/TremorTest')));
                      //Navigator.pushNamed(context, '/clockdraw');
                    }),

                    WideButton(color: Colors.blue, buttonText: AppLocalizations.of(context)!.home_survey, onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SurveyMenu()));
                      //Navigator.pushNamed(context, '/clockdraw');
                    }),

                  ],
                )),


                Divider(height: 40.0,thickness: 4.0,color: Colors.blueGrey,),
              ],)
          ),
        ),
        );
  }


  //build the logout button
  Widget buildLogout() {
    return FlatButton.icon(
      onPressed: () async {
        await widget._auth.signOut();
        Navigator.pushReplacementNamed(context, '/login');
      },
      icon: Icon(Icons.person),
      label: Text(
        AppLocalizations.of(context)!.home_logout,
        // 'logout',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
