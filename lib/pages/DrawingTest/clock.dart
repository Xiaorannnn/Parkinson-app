import 'dart:io';
import 'dart:ui';

import 'package:csv/csv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flustars/flustars.dart';
import 'package:parkinsons_app/services/Util.dart';
//import 'package:parkinsons_app/services/auth.dart';
import 'package:parkinsons_app/services/database.dart';
import 'package:permission_handler/permission_handler.dart';
//import 'package:quiver/time.dart';
import 'package:screenshot/screenshot.dart';
/*import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:flutter/cupertino.dart';*/
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:amplify_flutter/amplify.dart';

class ClockDraw extends StatefulWidget {
  // String medicineAnswer;
  // ClockDraw({required this.medicineAnswer});
  static bool clockCompleted = false;
  static bool elecTestCompleted = false;
  static bool handTestCompleted = false;

  @override
  _ClockDrawState createState() => _ClockDrawState();
}

class _ClockDrawState extends State<ClockDraw> {
  List<List<dynamic>>? _rawDataArray = [
    ["onPanDown", "onPanEnd", "submit"]
  ];
  List<List<dynamic>>? _featureDataArray = [
    [
      "strokes",
      "undo",
      "delete",
      "latency (ms)",
      "on_air_time (ms)",
      "on_surface_time (ms)"
    ]
  ];
  List<dynamic> onPenDownList = [];
  List<dynamic> onPenEndList = [];
  List<DrawingArea> points = [];

  double strokeWidth = 2.0;
  double finishOpacity = 0.0;
  bool finished = false;

  int numberOfDelete = 0;
  int numberOfUndo = 0;
  String onSurface = "";
  String onAir = "";
  int latency = 0;

  bool elecTestCompleted = ClockDraw.elecTestCompleted;
  bool handTestCompleted = ClockDraw.handTestCompleted;

  final controller = ScreenshotController();

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
            appBar: buildAppBar(screenSize),
            body: Stack(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 10),
                      buildSlider(screenSize),
                      SizedBox(height: 10),
                      buildInstructions(screenSize),
                      SizedBox(height: 10),
                      buildCanvas(screenSize),
                      SizedBox(height: 20),
                      buildSubmitButton(screenSize),
                      SizedBox(height: 15),
                      buildUploadButton(screenSize),
                    ],
                  ),
                )
              ],
            )));
  }

  PreferredSizeWidget buildAppBar(Size screenSize) {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () {
              if (points.isNotEmpty) {
                numberOfDelete++;
              }
              setState(() {
                points.clear();
              });
            },
            icon: Icon(Icons.delete)),
        IconButton(
            onPressed: () {
              setState(() {
                if (points.isNotEmpty) {
                  numberOfUndo++;
                  points.removeLast();
                }
                while (points.isNotEmpty)
                  if (points.removeLast().point != Offset.infinite) {
                    continue;
                  } else {
                    break;
                  }
              });
            },
            icon: Icon(Icons.undo))
      ],
      title: Text(
        AppLocalizations.of(context)!.drawing_menu_clock,
        // "Clock Drawing Test",
        style: TextStyle(fontSize: 15.0),
      ),
      centerTitle: true,
    );
  }

  Widget buildSlider(Size screenSize) {
    return Container(
      width: screenSize.width * 0.8,
      height: screenSize.height * 0.05,
      decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Row(
        children: [
          Expanded(
              child: Slider(
            min: 1.0,
            max: 7.0,
            value: strokeWidth,
            onChanged: (value) {
              setState(() {
                strokeWidth = value;
              });
            },
            inactiveColor: Colors.white,
            activeColor: Colors.blue,
          )),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  Widget buildInstructions(Size screenSize) {
    return Container(
        width: screenSize.width * 0.95,
        child: (elecTestCompleted && handTestCompleted)
            ? Text(
                "恭喜你完成测试！🎉",
                style: TextStyle(
                    fontSize: 20.0, color: Colors.red, fontFamily: "Helvetica"),
              )
            : Text(
                AppLocalizations.of(context)!.drawing_clock_instruction,
                // "1: Draw a clock with all the numbers and set the hands to 10 minutes after 11\n\n2:Press the submit button",
                style: TextStyle(fontSize: 13.0),
              ));
  }

  Widget buildCanvas(Size screenSize) {
    return Container(
      width: screenSize.width * 0.95,
      height: screenSize.height * 0.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          border: Border.all(width: 2.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 5.0,
                spreadRadius: 1.0)
          ]),
      child: GestureDetector(
        onPanDown: (details) {
          print("onPanDown = " + new DateTime.now().toString());
          onPenDownList.add(new DateTime.now().toString());
          setState(() {
            points.add(DrawingArea(
                point: details.localPosition,
                areaPaint: Paint()
                  ..strokeCap = StrokeCap.round
                  ..isAntiAlias = true
                  ..color = Colors.black
                  ..strokeWidth = strokeWidth));
          });
        },
        onPanUpdate: (details) {
          setState(() {
            points.add(DrawingArea(
                point: details.localPosition,
                areaPaint: Paint()
                  ..strokeCap = StrokeCap.round
                  ..isAntiAlias = true
                  ..color = Colors.black
                  ..strokeWidth = strokeWidth));
          });
        },
        onPanEnd: (details) {
          print("onPanEnd = " + new DateTime.now().toString());
          onPenEndList.add(new DateTime.now().toString());
          setState(() {
            points.add(DrawingArea(point: Offset.infinite, areaPaint: Paint()));
          });
        },
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          child: CustomPaint(
            painter: new MyCustomPainter(points: points),
          ),
        ),
      ),
    );
  }

  void onSubmitPressed(Size screenSize) async {
    final storageStatus = await Permission.storage.request();

    if (storageStatus == PermissionStatus.granted) {
      final imageBytes =
          await controller.captureFromWidget(buildCanvas(screenSize));
      final directory = await getApplicationDocumentsDirectory();
      final image = File('${directory.path}/clock.png');
      image.writeAsBytes(imageBytes);

      final user = await Amplify.Auth.getCurrentUser();

      String uid = user.userId;
      DataBaseService db = DataBaseService(uid: uid);
      db.updateClockDrawingTest("");

      setState(() {
        ClockDraw.elecTestCompleted = true;
        elecTestCompleted = true;
      });

      //upload to AWS amplify
      String timestamp = createTimeStamp();
      db.uploadFile(image, "Clock Drawing Test" + timestamp, '.png');
      writeRawDataToCsv(timestamp);
      writeFeatureDataToCsv(timestamp);
      resetData();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("电子绘画提交成功!")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Storage Permission not granted")));
    }
  }

  //write the data to a csv file
  void writeRawDataToCsv(String timestamp) async {
    for (int i = 0; i < onPenDownList.length; i++) {
      List<dynamic> element = [];
      element.add(onPenDownList[i]);
      element.add(onPenEndList[i]);
      element.add("");
      _rawDataArray!.add(element);
    }
    _rawDataArray!.add(["", "", timestamp]);
    String csv = const ListToCsvConverter().convert(_rawDataArray);

    /// Write to a file
    final directory = await getApplicationDocumentsDirectory();
    final pathOfTheFileToWrite =
        directory.path + "/clock_drawing_test_raw_data.csv";
    File file = File(pathOfTheFileToWrite);
    await file.writeAsString(csv);
    print(csv);
    // //Upload to AWS Amplify
    final user = await Amplify.Auth.getCurrentUser();
    String uid = user.userId;
    DataBaseService db = DataBaseService(uid: uid);
    db.uploadFile(file, "Clock Drawing Test" + timestamp, " Raw Data.csv");
    print("written to csv!");
  }

  void writeFeatureDataToCsv(String timestamp) async {
    print("feature list");
    List<dynamic> element = [];
    element.add(onPenEndList.length);
    element.add(numberOfUndo);
    element.add(numberOfDelete);
    for (int i = 0; i < onPenEndList.length; i++) {
      int? panDownTimeStamp = DateUtil.getDateMsByTimeStr(onPenDownList[i]);
      int? panEndTimeStamp = DateUtil.getDateMsByTimeStr(onPenEndList[i]);
      onSurface += (panEndTimeStamp! - panDownTimeStamp!).toString();
      if (i != onPenEndList.length - 1) {
        onSurface += ",";
      }
    }

    for (int i = 0; i < onPenEndList.length - 1; i++) {
      int? panEndTimeStamp = DateUtil.getDateMsByTimeStr(onPenEndList[i]);
      int? panDownTimeStamp = DateUtil.getDateMsByTimeStr(onPenDownList[i + 1]);
      latency += panDownTimeStamp! - panEndTimeStamp!;
      onAir += (panDownTimeStamp - panEndTimeStamp).toString() + ",";
    }

    int? panEndTimeStamp =
        DateUtil.getDateMsByTimeStr(onPenEndList[onPenEndList.length - 1]);
    int? submit = DateUtil.getDateMsByTimeStr(timestamp);
    latency += submit! - panEndTimeStamp!;
    onAir += (submit - panEndTimeStamp).toString();

    element.add(latency);
    element.add(onAir);
    element.add(onSurface);
    _featureDataArray!.add(element);
    String csv = const ListToCsvConverter().convert(_featureDataArray);

    /// Write to a file
    final directory = await getApplicationDocumentsDirectory();
    final pathOfTheFileToWrite =
        directory.path + "/clock_drawing_test_feature_data.csv";
    File file = File(pathOfTheFileToWrite);
    await file.writeAsString(csv);
    print(csv);
    // // //Upload to AWS Amplify
    final user = await Amplify.Auth.getCurrentUser();
    String uid = user.userId;
    DataBaseService db = DataBaseService(uid: uid);
    db.uploadFile(file, "Clock Drawing Test" + timestamp, " Feature Data.csv");
    print("written to csv!");
  }

  void resetData() {
    _rawDataArray = [
      ["onPanDown", "onPanEnd", "submit"]
    ];
    _featureDataArray = [
      [
        "strokes",
        "undo",
        "delete",
        "latency (ms)",
        "on_air_time (ms)",
        "on_surface_time (ms)"
      ]
    ];
    onPenDownList.clear();
    onPenEndList.clear();
    numberOfDelete = 0;
    numberOfUndo = 0;
    onSurface = "";
    onAir = "";
    latency = 0;
  }

  void onUploadPressed(Size screenSize) async {
    final storageStatus = await Permission.storage.request();

    if (storageStatus == PermissionStatus.granted) {
      ImagePicker picker = ImagePicker();
      XFile? image_raw = await picker.pickImage(source: ImageSource.gallery);
      File image = File(image_raw!.path);

      setState(() {
        ClockDraw.handTestCompleted = true;
        handTestCompleted = true;
      });

      //upload to AWS amplify
      final user = await Amplify.Auth.getCurrentUser();
      String uid = user.userId;
      DataBaseService db = DataBaseService(uid: uid);
      String timestamp = createTimeStamp();
      db.uploadFile(image, "Clock Drawing Test Camera" + timestamp, '.png');

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("A4绘画上传成功!")));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Storage Permission not granted")));
    }
  }

  Widget buildUploadButton(Size screenSize) {
    return Container(
      width: screenSize.width * 0.8,
      height: screenSize.height * 0.05,
      child: ElevatedButton(
        onPressed: () => onUploadPressed(screenSize),
        child: handTestCompleted ? Text("上传A4绘画" + " ✅") : Text("上传A4绘画"),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                handTestCompleted ? Colors.grey : Colors.blue),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))),
      ),
    );
  }

  Widget buildSubmitButton(Size screenSize) {
    return Container(
      width: screenSize.width * 0.8,
      height: screenSize.height * 0.05,
      child: ElevatedButton(
        onPressed: () => onSubmitPressed(screenSize),
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
}

class MyCustomPainter extends CustomPainter {
  List<DrawingArea> points;

  MyCustomPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Paint background = Paint();
    background.color = Colors.white;

    Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);

    // set paint properties
    Paint paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 2.0;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;

    //check if is a point or a line
    for (int i = 0; i < points.length - 1; i++) {
      //if line draw line
      if (points[i].point != Offset.infinite &&
          points[i + 1].point != Offset.infinite) {
        Paint paint = points[i].areaPaint;
        canvas.drawLine(points[i].point, points[i + 1].point, paint);
      }
      //if point draw a point
      else if (points[i].point != Offset.infinite &&
          points[i + 1].point == Offset.infinite) {
        Paint paint = points[i].areaPaint;
        canvas.drawPoints(PointMode.points, [points[i].point], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class DrawingArea {
  Offset point;
  Paint areaPaint;
  DrawingArea({required this.point, required this.areaPaint});

  Offset getPoint() {
    return this.point;
  }
}
