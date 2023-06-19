import 'dart:async';
// import 'dart:html';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
//import 'package:parkinsons_app/pages/VisualMemoryTest/VisualMemoryTestMenu.dart';
import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/services/database.dart';
import 'package:parkinsons_app/widgets/TileModel.dart';
import 'package:quiver/async.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:amplify_flutter/amplify.dart';

//set basic variables
CountdownTimer? _timer = null;
List<TileModel> pairs = <TileModel>[];
bool selected = false;
bool gameStarted = false;
bool preGameStarted = false;

String correctImagePath = ""; //path to what the user will have to remember
int difficulty = 0; //index of difficulty

//create a memory class
class Memory extends StatefulWidget {
  // String medicineAnswer;
  int gridDimension;

  static bool difficult1Completed = false;
  static bool difficult2Completed = false;
  static bool difficult3Completed = false;
  static bool difficult4Completed = false;
  static bool difficult5Completed = false;

  Memory({required this.gridDimension});
  // Memory({required this.medicineAnswer,required this.gridDimension});

  @override
  _MemoryState createState() => _MemoryState();
}

class _MemoryState extends State<Memory> {
  List<int> activeIndexes = []; // holds indexes of tiles with images in them
  List<TileModel> visiblePairs = []; //holds whats actually visible to user
  int maxActive = 8; //how many tiles will be active
  double correctShapeOpactity =
      0.0; //controls weather the correct shape shows at top
  double youWonOpacity = 1.0;
  double timeOpacity = 0.0;
  double _countDownOpacity = 0.0;
  String instruction = '请点击开始按钮!';
  /* to display time left*/
  int _countDownStart = 30;
  int _countDownCurrent = 0;

  int timeLeftCurrent = 30;
  int timeLeftMax = 30;
  late CountdownTimer sub;
  int score = 0;

  FutureOr onGoBackMemory(dynamic value) {
    setState(() {
      int gd = widget.gridDimension;
      if (gd == 2) {
        Memory.difficult1Completed = true;
      } else if (gd == 3) {
        Memory.difficult2Completed = true;
      } else if (gd == 4) {
        Memory.difficult3Completed = true;
      } else if (gd == 5) {
        Memory.difficult4Completed = true;
      } else if (gd == 6) {
        Memory.difficult5Completed = true;
      }
      print("#####");
      print(Memory.difficult1Completed);
      print(Memory.difficult2Completed);
      print(Memory.difficult3Completed);
      print(Memory.difficult4Completed);
      print(Memory.difficult5Completed);
    });
  }

  AuthService _authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pairs = getPairs(widget.gridDimension);
    pairs.shuffle();
    visiblePairs = getQuestions(widget.gridDimension);
    // selected = true;
    Random random = Random();
    correctImagePath = "assets/green_triangle.png";
    difficulty = 0;

    // selected = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    gameStarted = false;
  }

  //build the context for memory menu
  @override
  Widget build(BuildContext context) {
    List<String> startButtonString = [
      AppLocalizations.of(context)!.memory_start,
      AppLocalizations.of(context)!.memory_nextstage,
      AppLocalizations.of(context)!.memory_end
    ];

    final Size size = MediaQuery.of(context).size;

    Widget getWidget() {
      if (gameStarted) {
        return Text("${startButtonString[difficulty]}");
      } else {
        return Text("${startButtonString[difficulty]}");
      }
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

    return WillPopScope(
        onWillPop: () async {
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        },
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.memory_header,
                // "Visual Memory Test!",
                style: TextStyle(fontSize: 15.0),
              ),
              centerTitle: true,
            ),
            body: SafeArea(
              child: Container(
                  height: size.height,
                  color: Colors.white,
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Opacity(
                                  opacity: correctShapeOpactity,
                                  child: Text(
                                    AppLocalizations.of(context)!.memory_title,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Helvetica",
                                        color: Colors.black),
                                  ),
                                ),
                                Opacity(
                                  opacity: correctShapeOpactity,
                                  child: Image.asset(
                                    correctImagePath,
                                    height: size.width * 0.10,
                                    width: size.width * 0.10,
                                  ),
                                )
                              ]),
                          Opacity(
                            opacity: youWonOpacity,
                            child: Text(
                              instruction,
                              style: TextStyle(
                                  fontSize: size.width * 0.05,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Helvetica",
                                  color: Colors.black),
                            ),
                          ),
                          Opacity(
                              opacity: timeOpacity,
                              child: Container(
                                  padding: EdgeInsets.all(size.height * 0.025),
                                  child: Text(
                                    AppLocalizations.of(context)!.memory_time +
                                        "$_countDownCurrent",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.black,
                                        fontFamily: "Helvetica"),
                                  ))),
                          Container(
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 4.0, color: Colors.blue)),
                            child: SizedBox(
                              height: size.width * 0.9,
                              width: size.width * 0.9,
                              child: GridView(
                                shrinkWrap: true,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 0.0,
                                        crossAxisCount: widget.gridDimension),
                                children:
                                    List.generate(visiblePairs.length, (index) {
                                  return Tile(
                                    imageAssetPath:
                                        visiblePairs[index].getImageAssetPath(),
                                    index: index,
                                    parent: this,
                                  );
                                }),
                              ),
                            ),
                          ),
                          Text(
                            AppLocalizations.of(context)!.memory_tries +
                                "$score",
                            style: TextStyle(
                                fontSize: size.width * 0.05,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Helvetica",
                                color: Colors.black),
                          ),
                          Container(
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Visibility(
                                  visible: !preGameStarted,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (!gameStarted) {
                                        if (difficulty < 1) {
                                          setState(() {
                                            preGameStarted = true;
                                            // gameStarted = true;
                                            correctShapeOpactity = 1.0;
                                            youWonOpacity = 0.0;
                                            pairs =
                                                getPairs(widget.gridDimension);
                                            pairs.shuffle();
                                            visiblePairs = pairs;
                                            selected = true;
                                            Random random = Random();
                                            correctImagePath =
                                                "assets/green_triangle.png";
                                            _countDownCurrent = 5;
                                            timeOpacity = 1.0;
                                            _timer = new CountdownTimer(
                                              new Duration(seconds: 5),
                                              new Duration(seconds: 1),
                                            );
                                            var sub = _timer!.listen(null);
                                            sub.onData((duration) {
                                              setState(() {
                                                _countDownCurrent = 5 -
                                                    duration.elapsed.inSeconds;
                                              });
                                            });
                                            sub.onDone(() {
                                              if (_countDownCurrent == 0) {
                                                setState(() {
                                                  gameStarted = true;
                                                  AppLocalizations.of(context)!
                                                      .memory_find;
                                                  // instructionText = "Find where the shape is: ";
                                                  visiblePairs = getQuestions(
                                                      widget.gridDimension);
                                                  correctShapeOpactity = 0.0;
                                                  youWonOpacity = 1.0;
                                                  instruction = '请找到你刚才看到的图形！';
                                                  score = 0;
                                                  startCountDownTimer();
                                                });
                                              }
                                            });
                                            selected = false;
                                          });
                                        } else {
                                          Navigator.pop(context);
                                          // if (widget.gridDimension < 6) {
                                          //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Memory(gridDimension: widget.gridDimension+1))).then(onGoBackMemory);
                                          //   // Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Memory(medicineAnswer: widget.medicineAnswer, gridDimension: widget.gridDimension+1)));
                                          // } else {
                                          //   Navigator.pop(context);
                                          // }
                                        }
                                      }
                                    },
                                    child: Text(
                                        "${startButtonString[difficulty]}"),
                                  ),
                                ),
                              ],
                            )),
                          ),
                        ]),
                  )),
            )));
  }

  //build counting down timer
  void startCountDownTimer() async {
    final user = await Amplify.Auth.getCurrentUser();
    String uid = user.userId;
    _countDownOpacity = 1.0;
    _countDownCurrent = 30;
    _timer = new CountdownTimer(
      new Duration(seconds: _countDownStart),
      new Duration(seconds: 1),
    );

    var sub = _timer!.listen(null);
    sub.onData((duration) {
      setState(() {
        _countDownCurrent = _countDownStart - duration.elapsed.inSeconds;
      });
    });
    sub.onDone(() {
      if (_countDownCurrent == 0) {
        // DataBaseService(uid: uid).updateUserMemoryGame(score, widget.gridDimension - 1, false, widget.medicineAnswer);
        DataBaseService(uid: uid)
            .updateUserMemoryGame(score, widget.gridDimension - 1, false, "");
      }
      gameStarted = false;
      preGameStarted = false;
    });
  }
}

//build the title
class Tile extends StatefulWidget {
  String imageAssetPath;
  int index;
  _MemoryState parent;

  Tile(
      {required this.imageAssetPath,
      required this.index,
      required this.parent});

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!selected && gameStarted) {
          setState(() {
            widget.parent.setState(() {
              if (pairs[widget.index].getisSelected() == false) {
                widget.parent.score++;
              }
            });
            pairs[widget.index].setisSelected(true);
            print(checkForWin());
          });
        }
      },
      child: Container(
          decoration: BoxDecoration(border: Border.all()),
          margin: EdgeInsets.all(0.0),
          child: Transform.scale(
              scale: 0.75,
              child: Image.asset(pairs[widget.index].getisSelected()
                  ? pairs[widget.index].getImageAssetPath()
                  : widget.imageAssetPath))),
    );
  }

  Future<bool> checkForWin() async {
    for (var i = 0; i < pairs.length; i++) {
      if (pairs[i].getImageAssetPath() == correctImagePath &&
          pairs[i].getisSelected() == false) {
        return false;
      }
    }

    int gd = widget.parent.widget.gridDimension;

    if (gd == 2) {
      Memory.difficult1Completed = true;
    } else if (gd == 3) {
      Memory.difficult2Completed = true;
    } else if (gd == 4) {
      Memory.difficult3Completed = true;
    } else if (gd == 5) {
      Memory.difficult4Completed = true;
    } else if (gd == 6) {
      Memory.difficult5Completed = true;
    }

    widget.parent.instruction = '做得好，下一阶段！';
    widget.parent.youWonOpacity = 1.0;
    if (difficulty < 1) {
      difficulty++;
      print(widget.parent.widget.gridDimension);
    } else {
      difficulty = 0;
    }
    if (widget.parent.widget.gridDimension == 6) {
      difficulty = 2;
    }

    selected = false;
    gameStarted = false;
    _timer!.cancel();

    final user = await Amplify.Auth.getCurrentUser();
    String uid = user.userId;
    DataBaseService(uid: uid).updateUserMemoryGame(
        widget.parent.score, widget.parent.widget.gridDimension - 1, true, "");
    // DataBaseService(uid: uid)
    //     .updateUserMemoryGame(widget.parent.score,
    //     widget.parent.widget.gridDimension - 1, true,
    //     widget.parent.widget.medicineAnswer);
    return true;
  }
}

List<TileModel> getPairs(int gridDimension) {
  List<TileModel> pairs = [];

  for (var i = 0; i < gridDimension * gridDimension; i++) {
    if (i < difficulty + 1) {
      TileModel tileModel = new TileModel(
          imageAssetPath: "assets/green_triangle.png", isSelected: false);
      pairs.add(tileModel);
    } else {
      TileModel tileModel = new TileModel(
          imageAssetPath: "assets/transparent.jpg", isSelected: false);
      pairs.add(tileModel);
    }
  }

  return pairs;
}

List<TileModel> getQuestions(int gridDimension) {
  List<TileModel> pairs = [];

  for (var i = 0; i < gridDimension * gridDimension; i++) {
    TileModel tileModel =
        new TileModel(imageAssetPath: "assets/question.png", isSelected: false);
    pairs.add(tileModel);
  }

  return pairs;
}
