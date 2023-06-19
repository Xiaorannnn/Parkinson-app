import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parkinsons_app/pages/DrawingTest/clock.dart';
/*import 'package:parkinsons_app/pages/MedicineQuestion.dart';
import 'package:parkinsons_app/pages/SurveyTest/MDS-UPDRS.dart';
import 'package:parkinsons_app/pages/SurveyTest/SurveyMenu.dart';
import 'package:parkinsons_app/services/Util.dart';*/
import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/widgets/WideButton.dart';

import 'JoinCircles.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DrawingMenu extends StatefulWidget {
  final AuthService _auth = AuthService();
  // String medicineAnswer;
  // DrawingMenu({required this.medicineAnswer});

  @override
  _DrawingMenuState createState() => _DrawingMenuState();
}

class _DrawingMenuState extends State<DrawingMenu> {
  bool clockCompleted = ClockDraw.clockCompleted;
  bool joinCompleted = JoinCircles.joinCompleted;

  FutureOr onGoBackClockPressed(dynamic value) {
    setState(() {
      if (ClockDraw.elecTestCompleted && ClockDraw.handTestCompleted) {
        ClockDraw.clockCompleted = true;
        clockCompleted = true;
      }
    });
  }

  FutureOr onGoBackJoinPressed(dynamic value) {
    setState(() {
      if (JoinCircles.elecTestCompleted) {
        JoinCircles.joinCompleted = true;
        joinCompleted = true;
      }
    });
  }

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
                style: TextStyle(fontSize: 20.0),
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
                WideButton(
                    color: clockCompleted ? Colors.grey : Colors.blue,
                    buttonText: clockCompleted
                        ? AppLocalizations.of(context)!.drawing_menu_clock +
                            " ✅"
                        : AppLocalizations.of(context)!.drawing_menu_clock,
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ClockDraw()))
                          .then(onGoBackClockPressed);
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ClockDraw(medicineAnswer: widget.medicineAnswer,)));
                    }),
                WideButton(
                    color: joinCompleted ? Colors.grey : Colors.blue,
                    buttonText: joinCompleted
                        ? AppLocalizations.of(context)!.drawing_menu_circles +
                            " ✅"
                        : AppLocalizations.of(context)!.drawing_menu_circles,
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => JoinCircles()))
                          .then(onGoBackJoinPressed);
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => JoinCircles(medicineAnswer: widget.medicineAnswer,)));
                    }),
              ],
            )),
      ),
    );
  }

  Widget buildLogout() {
    return TextButton.icon(
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
