import 'package:flutter/material.dart';
import 'package:parkinsons_app/pages/DrawingTest/clock.dart';
import 'package:parkinsons_app/pages/MedicineQuestion.dart';
import 'package:parkinsons_app/pages/SurveyTest/MDS-UPDRS.dart';
import 'package:parkinsons_app/pages/SurveyTest/SurveyMenu.dart';
import 'package:parkinsons_app/services/Util.dart';
import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/widgets/WideButton.dart';

import 'JoinCircles.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class DrawingMenu extends StatefulWidget {
  //connect to the amplify auth service
  final AuthService _auth = AuthService();
  //set basic variables
  String medicineAnswer;
  //constructor function
  DrawingMenu({required this.medicineAnswer});

  @override
  _DrawingMenuState createState() => _DrawingMenuState();
}

class _DrawingMenuState extends State<DrawingMenu> {
  //build the context
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Center(
              child: Text(
        AppLocalizations.of(context)!.drawing_menu_header,
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

                        WideButton(color: Colors.blue, buttonText: AppLocalizations.of(context)!.drawing_menu_clock, onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ClockDraw(medicineAnswer: widget.medicineAnswer,)));
                        }),

                        WideButton(color: Colors.blue, buttonText: AppLocalizations.of(context)!.drawing_menu_circles, onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => JoinCircles(medicineAnswer: widget.medicineAnswer,)));
                        }),
                      ],
                    )),


      ),
    );
  }

  Widget buildLogout() {
    return FlatButton.icon(
      onPressed: () async {
        await widget._auth.signOut();
        Navigator.pushReplacementNamed(context, '/login');
      },
      icon: Icon(Icons.person),
      label: Text(
        'logout',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
