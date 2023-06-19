import 'dart:async';

import 'package:flutter/material.dart';
import 'package:parkinsons_app/pages/VisualMemoryTest/memory.dart';
//import 'package:parkinsons_app/services/Util.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:parkinsons_app/widgets/WideButton.dart';

//build a class for visual memory test meno
class VisualMemoryTestMenu extends StatefulWidget {
  //variables and constructor function
  // String medicineAnswer;
  // VisualMemoryTestMenu({required this.medicineAnswer});

  @override
  _VisualMemoryTestMenuState createState() => _VisualMemoryTestMenuState();
}

class _VisualMemoryTestMenuState extends State<VisualMemoryTestMenu> {
  bool difficult1Completed = Memory.difficult1Completed;
  bool difficult2Completed = Memory.difficult2Completed;
  bool difficult3Completed = Memory.difficult3Completed;
  bool difficult4Completed = Memory.difficult4Completed;
  bool difficult5Completed = Memory.difficult5Completed;

  FutureOr onGoBackD1(dynamic value) {
    setState(() {
      difficult1Completed = Memory.difficult1Completed;
    });
  }

  FutureOr onGoBackD2(dynamic value) {
    setState(() {
      difficult2Completed = Memory.difficult2Completed;
    });
  }

  FutureOr onGoBackD3(dynamic value) {
    setState(() {
      difficult3Completed = Memory.difficult3Completed;
    });
  }

  FutureOr onGoBackD4(dynamic value) {
    setState(() {
      difficult4Completed = Memory.difficult4Completed;
    });
  }

  FutureOr onGoBackD5(dynamic value) {
    setState(() {
      difficult5Completed = Memory.difficult5Completed;
    });
  }

  //build the context for visual memory test
  @override
  Widget build(BuildContext context) {
    // initS();
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.memory_menu_header,
            style: TextStyle(fontSize: 15.0),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Container(
                width: double.infinity,
                height: screenSize.height,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text(
                      //   AppLocalizations.of(context)!.memory_menu,
                      //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      // ),
                      SizedBox(height: 5),
                      buildDifficultyBtn(context),
                      // buildDifficultyBtn(context, 2),
                      // buildDifficultyBtn(context, 3),
                      // buildDifficultyBtn(context, 4),
                      // buildDifficultyBtn(context, 5)
                    ]))));
  }

  //build the difficulty box
  Widget buildDifficultyBtn(BuildContext context) {
    // initS();
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        width: double.infinity,
        // height: screenSize.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            WideButton(
              buttonText: difficult1Completed
                  ? AppLocalizations.of(context)!.memory_menu_d +
                      "1 ( 2 x 2 " +
                      AppLocalizations.of(context)!.memory_menu_grid +
                      ")" +
                      " ✅"
                  : AppLocalizations.of(context)!.memory_menu_d +
                      "1 ( 2 x 2 " +
                      AppLocalizations.of(context)!.memory_menu_grid +
                      ")",
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) => Memory(gridDimension: 2)))
                    .then(onGoBackD1);
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Memory(medicineAnswer: widget.medicineAnswer, gridDimension: difficulty+1))  );
              },
              color: difficult1Completed ? Colors.grey : Colors.blue,
            ),
            WideButton(
              buttonText: difficult2Completed
                  ? AppLocalizations.of(context)!.memory_menu_d +
                      "2 ( 3 x 3 " +
                      AppLocalizations.of(context)!.memory_menu_grid +
                      ")" +
                      " ✅"
                  : AppLocalizations.of(context)!.memory_menu_d +
                      "2 ( 3 x 3 " +
                      AppLocalizations.of(context)!.memory_menu_grid +
                      ")",
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) => Memory(gridDimension: 3)))
                    .then(onGoBackD2);
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Memory(medicineAnswer: widget.medicineAnswer, gridDimension: difficulty+1))  );
              },
              color: difficult2Completed ? Colors.grey : Colors.blue,
            ),
            WideButton(
              buttonText: difficult3Completed
                  ? AppLocalizations.of(context)!.memory_menu_d +
                      "3 ( 4 x 4 " +
                      AppLocalizations.of(context)!.memory_menu_grid +
                      ")" +
                      " ✅"
                  : AppLocalizations.of(context)!.memory_menu_d +
                      "3 ( 4 x 4 " +
                      AppLocalizations.of(context)!.memory_menu_grid +
                      ")",
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) => Memory(gridDimension: 4)))
                    .then(onGoBackD3);
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Memory(medicineAnswer: widget.medicineAnswer, gridDimension: difficulty+1))  );
              },
              color: difficult3Completed ? Colors.grey : Colors.blue,
            ),
            WideButton(
              buttonText: difficult4Completed
                  ? AppLocalizations.of(context)!.memory_menu_d +
                      "4 ( 5 x 5 " +
                      AppLocalizations.of(context)!.memory_menu_grid +
                      ")" +
                      " ✅"
                  : AppLocalizations.of(context)!.memory_menu_d +
                      "4 ( 5 x 5 " +
                      AppLocalizations.of(context)!.memory_menu_grid +
                      ")",
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) => Memory(gridDimension: 5)))
                    .then(onGoBackD4);
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Memory(medicineAnswer: widget.medicineAnswer, gridDimension: difficulty+1))  );
              },
              color: difficult4Completed ? Colors.grey : Colors.blue,
            ),
            WideButton(
              buttonText: difficult5Completed
                  ? AppLocalizations.of(context)!.memory_menu_d +
                      "5 ( 6 x 6 " +
                      AppLocalizations.of(context)!.memory_menu_grid +
                      ")" +
                      " ✅"
                  : AppLocalizations.of(context)!.memory_menu_d +
                      "5 ( 6 x 6 " +
                      AppLocalizations.of(context)!.memory_menu_grid +
                      ")",
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (context) => Memory(gridDimension: 6)))
                    .then(onGoBackD5);
                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Memory(medicineAnswer: widget.medicineAnswer, gridDimension: difficulty+1))  );
              },
              color: difficult5Completed ? Colors.grey : Colors.blue,
            ),
          ],
        )

        // RaisedButton(
        //   elevation: 5,
        //   child: Text(
        //     AppLocalizations.of(context)!.memory_menu_d + difficulty.toString() +
        //         " (" + (difficulty + 1).toString() + "x" + (difficulty +1).toString() +
        //         AppLocalizations.of(context)!.memory_menu_grid + ")",
        //     style: TextStyle(color: Colors.white),
        //   ),
        //   onPressed: () {
        //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Memory(gridDimension: difficulty+1))  );
        //     // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Memory(medicineAnswer: widget.medicineAnswer, gridDimension: difficulty+1))  );
        //   },
        //   padding: EdgeInsets.all(15),
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(15),
        //   ),
        //   color: Colors.blue,
        // ),
        );
  }
}
