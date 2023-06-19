import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parkinsons_app/pages/WalkingTest/StraightWalking.dart';
//import 'package:parkinsons_app/services/Util.dart';
import 'package:parkinsons_app/widgets/WideButton.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'Turning.dart';

//build the menu for the walking test
class WalkingMenu extends StatefulWidget {
  // String medicineAnswer;
  // WalkingMenu({required this.medicineAnswer});

  @override
  _WalkingMenuState createState() => _WalkingMenuState();
}

class _WalkingMenuState extends State<WalkingMenu> {
  bool straightWalkingCompleted = StraightWalking.straightWalkingCompleted;
  bool turningCompleted = Turning.turningCompleted;

  FutureOr onGoBackStraightPressed(dynamic value) {
    setState(() {
      straightWalkingCompleted = StraightWalking.straightWalkingCompleted;
    });
  }

  FutureOr onGoBackTurningPressed(dynamic value) {
    setState(() {
      turningCompleted = Turning.turningCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: screenSize.height,
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 50.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            WideButton(
                color: straightWalkingCompleted ? Colors.grey : Colors.blue,
                buttonText: straightWalkingCompleted
                    ? AppLocalizations.of(context)!.walking_menu_straight + " ✅"
                    : AppLocalizations.of(context)!.walking_menu_straight,
                // buttonText: "Straight Walking Test",
                onPressed: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StraightWalking()))
                      .then(onGoBackStraightPressed);
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => StraightWalking(medicineAnswer: widget.medicineAnswer,) ));
                }),
            WideButton(
                color: turningCompleted ? Colors.grey : Colors.blue,
                buttonText: turningCompleted
                    ? AppLocalizations.of(context)!.walking_menu_turning + " ✅"
                    : AppLocalizations.of(context)!.walking_menu_turning,
                // buttonText: "Turning Walking Test",
                onPressed: () {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Turning()))
                      .then(onGoBackTurningPressed);
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => Turning(medcineAnswer: widget.medicineAnswer,) ));
                }),
          ]),
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      title: Text(
        AppLocalizations.of(context)!.walking_menu_header,
        // "Walking Test",
        style: TextStyle(fontSize: 15.0),
      ),
      centerTitle: true,
    );
  }
}
