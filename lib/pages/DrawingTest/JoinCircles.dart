import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_painter/image_painter.dart';
//import 'package:parkinsons_app/pages/DrawingTest/clock.dart';
import 'package:parkinsons_app/services/Util.dart';
//import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/services/database.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:amplify_flutter/amplify.dart';

class JoinCircles extends StatefulWidget {
  // String medicineAnswer;
  // JoinCircles({required this.medicineAnswer});
  static bool joinCompleted = false;
  static bool elecTestCompleted = false;
  // static bool handTestCompleted = false;

  @override
  _JoinCirclesState createState() => _JoinCirclesState();
}

class _JoinCirclesState extends State<JoinCircles> {
  final _imageKey = GlobalKey<ImagePainterState>();
  final _key = GlobalKey<ScaffoldState>();
  bool testCompleted = false;

  bool elecTestCompleted = JoinCircles.elecTestCompleted;
  // bool handTestCompleted = JoinCircles.handTestCompleted;

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

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return WillPopScope(
        onWillPop: () async {
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.drawing_menu_circles
                // 'Join Circles'
                ),
          ),
          body: SafeArea(
            child: Stack(children: [
              ImagePainter.asset(
                "assets/squares_ciricles.png",
                scalable: true,
                initialPaintMode: PaintMode.freeStyle,
                key: _imageKey,
                colors: [Colors.red],
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                SizedBox(
                  height: screenSize.height * 0.1,
                ),
                Container(
                    padding: EdgeInsets.symmetric(
                        vertical: screenSize.height * 0.015),
                    child: Text(
                      AppLocalizations.of(context)!.drawing_join_instructions,
                      // "INSTRUCTIONS",
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    )),
                Container(
                    padding: EdgeInsets.symmetric(
                        vertical: screenSize.height * 0.025,
                        horizontal: screenSize.width * 0.025),
                    child: (elecTestCompleted)
                        ? Text(
                            "恭喜你完成测试！🎉",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.red,
                                fontFamily: "Helvetica"),
                          )
                        : Text(
                            AppLocalizations.of(context)!
                                .drawing_join_subinstructions,
                            // "Please Join the circles together to form a letter (ignore the squares) ",
                            style: TextStyle(fontSize: 15),
                          )),
              ]),
              Align(
                  // alignment: Alignment.bottomCenter,
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  buildSubmitButton(screenSize),
                  SizedBox(height: 15),
                  // buildUploadButton(screenSize),
                  SizedBox(height: 10),
                ],
              )
                  // buildSubmitButton(screenSize),
                  ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child:
              //   buildUploadButton(screenSize),
              // ),
            ]),
          ),
        ));
  }

  // Widget buildUploadButton(Size screenSize) {
  //   return Container(
  //     width: screenSize.width * 0.8,
  //     height: screenSize.height * 0.05,
  //     child: ElevatedButton(
  //       onPressed: () => onUploadPressed(screenSize),
  //       child: handTestCompleted ?
  //       Text(
  //           "上传A4绘画" + " ✅"
  //       ) :
  //       Text(
  //           "上传A4绘画"
  //       ),
  //       style: ButtonStyle(
  //           backgroundColor: MaterialStateProperty.all(handTestCompleted ? Colors.grey : Colors.blue),
  //           shape: MaterialStateProperty.all(RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(15)))),
  //     ),
  //   );
  // }

  Widget buildSubmitButton(Size screenSize) {
    return Container(
      margin: const EdgeInsets.all(5),
      width: screenSize.width * 0.8,
      height: screenSize.height * 0.05,
      child: ElevatedButton(
        onPressed: () => submitImage(),
        child: elecTestCompleted
            ? Text(AppLocalizations.of(context)!.drawing_submit + " ✅"
                // "Submit Drawing"
                )
            : Text(AppLocalizations.of(context)!.drawing_submit
                // "Submit Drawing"
                ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                elecTestCompleted ? Colors.grey : Colors.blue),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))),
      ),
    );
  }

  void onUploadPressed(Size screenSize) async {
    final storageStatus = await Permission.storage.request();

    if (storageStatus == PermissionStatus.granted) {
      ImagePicker picker = ImagePicker();
      XFile? image_raw = await picker.pickImage(source: ImageSource.gallery);
      File image = File(image_raw!.path);
      // setState(() {
      //   JoinCircles.handTestCompleted = true;
      //   handTestCompleted = true;
      // });

      //upload to AWS amplify
      final user = await Amplify.Auth.getCurrentUser();
      String uid = user.userId;
      DataBaseService db = DataBaseService(uid: uid);
      String timestamp = createTimeStamp();
      db.uploadFile(image, "Join Circles Test Camera " + timestamp, '.png');

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("A4绘画上传成功!")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Storage Permission not granted")));
    }
  }

  //a function to submit the image that the users have drawn
  void submitImage() async {
    final storageStatus = await Permission.storage.request();
    setState(() {
      JoinCircles.elecTestCompleted = true;
      elecTestCompleted = true;
    });
    final image = await _imageKey.currentState!.exportImage();
    final directory = (await getApplicationDocumentsDirectory()).path;
    await Directory('$directory/sample').create(recursive: true);
    final fullPath =
        '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.png';
    final imgFile = File('$fullPath');
    imgFile.writeAsBytes(image!);

    // upload to Amplify
    final user = await Amplify.Auth.getCurrentUser();
    String uid = user.userId;
    DataBaseService db = DataBaseService(uid: uid);
    db.updateJoinCirclesTest("");
    // db.updateJoinCirclesTest(widget.medicineAnswer);

    //upload to AWS amplify
    String timestamp = createTimeStamp();
    db.uploadFile(imgFile, "Join Circles Test " + timestamp, '.png');
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("电子绘画提交成功!")));
  }
}
