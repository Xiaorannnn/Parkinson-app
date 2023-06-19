import 'package:flutter/material.dart';
import 'package:parkinsons_app/pages/InformationTest/Information.dart';
//import 'package:parkinsons_app/pages/AuditoryMemoryTest/AuditorMemory.dart';
import 'package:parkinsons_app/pages/AuditoryMemoryTest/AuditoryMenu.dart';
import 'package:parkinsons_app/pages/DrawingTest/DrawingMenu.dart';
//import 'package:parkinsons_app/pages/RecordActivity.dart';
import 'package:parkinsons_app/pages/SurveyTest/DemoGraphicSurvey.dart';
import 'package:parkinsons_app/pages/SurveyTest/MDS-UPDRS.dart';
//import 'package:parkinsons_app/pages/SurveyTest/ParticipantQuestion.dart';
import 'package:parkinsons_app/pages/TremorTest/Tremor.dart';
import 'package:parkinsons_app/pages/VoiceRecordingTest/RecordMenu.dart';
import 'package:parkinsons_app/pages/RhythmTest/RhythmIntro.dart';
import 'package:parkinsons_app/pages/VisualMemoryTest/VisualMemoryTestMenu.dart';
//import 'package:parkinsons_app/pages/DrawingTest/clock.dart';
import 'package:parkinsons_app/pages/WalkingTest/WalkingMenu.dart';
import 'package:parkinsons_app/pages/home.dart';
//import 'package:parkinsons_app/pages/VisualMemoryTest/memory.dart';
//import 'package:parkinsons_app/pages/RhythmTest/rhythm.dart';
import 'package:parkinsons_app/pages/UserLogin/login.dart';
import 'package:parkinsons_app/pages/UserLogin/signup.dart';
//import 'package:parkinsons_app/pages/WalkingTest/StraightWalking.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
/*import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';
import 'package:parkinsons_app/amplifyconfiguration.dart';*/
import 'package:flutter_easyloading/flutter_easyloading.dart';

//main function
void main() async {
  //initialize the app
  WidgetsFlutterBinding.ensureInitialized();
  //start the app
  runApp(MyApp());
}

//structure of the app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localeResolutionCallback: (
          Locale? locale,
          Iterable<Locale> supportedLocales,
        ) {
          return locale;
        },
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        //language modes: Chinese and English
        supportedLocales: [
          Locale('zh', 'CN'),
          Locale('en', ''),
        ],
        initialRoute: '/login',
        builder: EasyLoading.init(),
        onGenerateRoute: _getRoute,
        routes: {
          //create three main pages: login, signup and home
          '/login': (context) => Login(),
          '/signup': (context) => SignUp(),
          '/home': (context) => Home(),
        });
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return new MaterialPageRoute(
      settings: settings,
      builder: (context) => builder,
    );
  }

  //leading to different tests
  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name == '/Information') {
      // FooRoute constructor expects SomeObject
      Map<dynamic, dynamic> arguments = settings.arguments as Map;
      return _buildRoute(settings, new Information());
    }

    if (settings.name == '/MDS-UPRDS') {
      // FooRoute constructor expects SomeObject
      Map<dynamic, dynamic> arguments = settings.arguments as Map;
      return _buildRoute(settings,
          new MDSUPDRS(participantAnswer: arguments['participantAnswer']));
    }

    if (settings.name == '/DemoGraphicSurvey') {
      // FooRoute constructor expects SomeObject
      Map<dynamic, dynamic> arguments = settings.arguments as Map;
      return _buildRoute(
          settings,
          new DemoGraphicSurvey(
              participantAnswer: arguments['participantAnswer']));
    }

    if (settings.name == '/RhythmIntro') {
      // FooRoute constructor expects SomeObject
      Map<dynamic, dynamic> arguments = settings.arguments as Map;
      return _buildRoute(settings, new RhythmIntro());

      // return _buildRoute(settings, new RhythmIntro(medicineAnswer: arguments['medicineAnswer']));
    }

    if (settings.name == '/VisualMemoryTestMenu') {
      // FooRoute constructor expects SomeObject
      Map<dynamic, dynamic> arguments = settings.arguments as Map;
      return _buildRoute(settings, new VisualMemoryTestMenu());
      // return _buildRoute(settings, new VisualMemoryTestMenu(medicineAnswer: arguments['medicineAnswer']));
    }

    if (settings.name == '/RecordMenu') {
      // FooRoute constructor expects SomeObject
      Map<dynamic, dynamic> arguments = settings.arguments as Map;
      return _buildRoute(settings, new RecordMenu());
      // return _buildRoute(settings, new RecordMenu(medicineAnswer: arguments['medicineAnswer']));
    }

    if (settings.name == '/WalkingMenu') {
      // FooRoute constructor expects SomeObject
      Map<dynamic, dynamic> arguments = settings.arguments as Map;
      return _buildRoute(settings, new WalkingMenu());
      // return _buildRoute(settings, new WalkingMenu(medicineAnswer: arguments['medicineAnswer']));
    }

    if (settings.name == '/AuditoryMenu') {
      // FooRoute constructor expects SomeObject
      Map<dynamic, dynamic> arguments = settings.arguments as Map;
      return _buildRoute(settings, new AuditoryMenu());
      // return _buildRoute(settings, new AuditoryMenu(medicineAnswer: arguments['medicineAnswer']));
    }

    if (settings.name == '/DrawingMenu') {
      // FooRoute constructor expects SomeObject
      Map<dynamic, dynamic> arguments = settings.arguments as Map;
      return _buildRoute(settings, new DrawingMenu());
      // return _buildRoute(settings, new DrawingMenu(medicineAnswer: arguments['medicineAnswer']));
    }

    if (settings.name == '/TremorTest') {
      // FooRoute constructor expects SomeObject
      Map<dynamic, dynamic> arguments = settings.arguments as Map;
      return _buildRoute(settings, new Tremor());
      // return _buildRoute(settings, new Tremor(medicineAnswer: arguments['medicineAnswer']));
    }

    return null;
  }
}
