import 'dart:async';

import 'package:flutter/material.dart';
/*import 'package:parkinsons_app/pages/MedicineQuestion.dart';
import 'package:parkinsons_app/pages/SurveyTest/MDS-UPDRS.dart';
import 'package:parkinsons_app/pages/SurveyTest/SurveyMenu.dart';
import 'package:parkinsons_app/services/Util.dart';*/
import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/widgets/WideButton.dart';

import 'package:parkinsons_app/pages/TremorTest/PosturalTremor.dart';
import 'package:parkinsons_app/pages/TremorTest/Tremor.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TremorMenu extends StatefulWidget {
  final AuthService _auth = AuthService();

  // String medicineAnswer;
  // DrawingMenu({required this.medicineAnswer});

  @override
  _TremorMenuState createState() => _TremorMenuState();
}

class _TremorMenuState extends State<TremorMenu> {
  bool staticTremorCompleted = Tremor.tremorCompleted;
  bool posturalTremorCompleted = PosturalTremor.posturalTremorCompleted;

  FutureOr onGoBackStaticPressed(dynamic value) {
    setState(() {
      staticTremorCompleted = Tremor.tremorCompleted;
    });
  }

  FutureOr onGoBackPosturalPressed(dynamic value) {
    setState(() {
      posturalTremorCompleted = PosturalTremor.posturalTremorCompleted;
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
                AppLocalizations.of(context)!.tremor_header,
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
                    color: staticTremorCompleted ? Colors.grey : Colors.blue,
                    buttonText:
                        staticTremorCompleted ? "静止性震颤" + " ✅" : "静止性震颤",
                    onPressed: () {
                      Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Tremor()))
                          .then(onGoBackStaticPressed);
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ClockDraw(medicineAnswer: widget.medicineAnswer,)));
                    }),
                WideButton(
                    color: posturalTremorCompleted ? Colors.grey : Colors.blue,
                    buttonText:
                        posturalTremorCompleted ? "姿势性震颤" + " ✅" : "姿势性震颤",
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PosturalTremor()))
                          .then(onGoBackPosturalPressed);
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ClockDraw(medicineAnswer: widget.medicineAnswer,)));
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
