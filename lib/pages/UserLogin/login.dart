//import 'dart:math';

// import 'package:firebase_core/firebase_core.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:parkinsons_app/services/auth.dart';
//import 'package:crypt/crypt.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//import 'utils/ToastUtil.dart';

// Amplify Flutter Packages
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:parkinsons_app/models/ModelProvider.dart';
import 'package:amplify_storage_s3/amplify_storage_s3.dart';

// Generated in previous step
import 'package:parkinsons_app/amplifyconfiguration.dart';
import 'package:shared_preferences/shared_preferences.dart';

//set basic variables
String email = "";
String password = "";
String error = "";
//connect to Amplify auth service
final AuthService _auth = AuthService();

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //initialize the Amplify configuration
  @override
  initState() {
    super.initState();
    _configLoading();
    _configureAmplify();
  }

  void _configLoading() async {
    EasyLoading.instance
      ..userInteractions = false
      ..dismissOnTap = false;
  }

  void _configureAmplify() async {
    // Add Pinpoint and Cognito Plugins

    AmplifyAnalyticsPinpoint analyticsPlugin = AmplifyAnalyticsPinpoint();
    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    AmplifyAPI apiPlugin = AmplifyAPI();
    AmplifyDataStore datastorePlugin =
        AmplifyDataStore(modelProvider: ModelProvider.instance);
    //connect to the Amplify plugin service
    await Amplify.addPlugins([
      authPlugin,
      analyticsPlugin,
      apiPlugin,
      datastorePlugin,
      AmplifyStorageS3()
    ]);
    //if fail to configure, print errors
    try {
      await Amplify.configure(amplifyconfig);
      await _checkIsLogin();
    } on AmplifyAlreadyConfiguredException {
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
    print("configure finished");
  }

  Future<void> _checkIsLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? _email = sharedPreferences.getString('username');
    String? _password = sharedPreferences.getString('password');
    if (_email != null && _password != null) {
      await EasyLoading.show(
        status: '正在登录中...',
        maskType: EasyLoadingMaskType.black,
      );
      await _auth.signInWithEmailAndPassword(_email, _password);
      Navigator.pushReplacementNamed(context, '/home');
      EasyLoading.dismiss();
    }
  }

  //build the context for the login page
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: screenSize.height,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.login_welcome,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Text("$error", style: TextStyle(color: Colors.red)),
                  SizedBox(height: 30),
                  buildEmail(context),
                  SizedBox(height: 20),
                  buildPassword(context),
                  buildLoginBtn(context, this),
                  // buildAnonLoginBtn(context),
                  buildSignUpBtn(context)
                ],
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: false);
  }
}

//build the email box
Widget buildEmail(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        AppLocalizations.of(context)!.login_email,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 1, offset: Offset(0, 2))
        ]),
        height: 60,
        child: TextFormField(
          // validator: (val) => val!.isEmpty ? "Enter a valid Email": null,
          validator: (val) => val!.isEmpty
              ? AppLocalizations.of(context)!.login_error_email
              : null,
          onChanged: (val) => email = val,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.accessibility,
                color: Colors.blue,
              ),
              hintText: AppLocalizations.of(context)!.login_email,
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

//build the password box
Widget buildPassword(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        AppLocalizations.of(context)!.login_password,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10),
      Container(
        alignment: Alignment.centerLeft,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 1, offset: Offset(0, 2))
        ]),
        height: 60,
        child: TextFormField(
          validator: (val) {
            if (val!.isEmpty) {
              // return "Please enter your password";
              return AppLocalizations.of(context)!.login_error_password;
            } else {
              return null;
            }
          },
          onChanged: (val) => password = val,
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.blue,
              ),
              hintText: AppLocalizations.of(context)!.login_password,
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

//build the login buttion
Widget buildLoginBtn(BuildContext context, _LoginState parent) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
        child: Text(
          AppLocalizations.of(context)!.login_login,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          await EasyLoading.show(
            status: '正在登录中...',
            maskType: EasyLoadingMaskType.black,
          );
          await _auth.signOut();
          dynamic result =
              await _auth.signInWithEmailAndPassword(email, password);

          if (result == null) {
            parent.setState(() {
              error = "登录信息有误";
              // error = " not sign in with your credentials";
              // error = AppLocalizations.of(context)!.login_failure;
              print("登录时发生错误");
              print("结果: ${result.toString()}");
            });
          } else {
            error = '';
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            await sharedPreferences.setString('username', email);
            await sharedPreferences.setString('password', password);
            EasyLoading.dismiss();
            Navigator.pushReplacementNamed(context, '/home');
          }
          EasyLoading.dismiss();
        },
        style: ElevatedButton.styleFrom(
          //backgroundColor: Colors.blue,
          primary: Colors.blue,
          elevation: 5,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        )),
  );
}

//build the signup button
Widget buildSignUpBtn(BuildContext context) {
  return Container(
    width: double.infinity,
    child: ElevatedButton(
        child: Text(
          AppLocalizations.of(context)!.login_signup,
          // 'Sign up',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/signup');
        },
        style: ElevatedButton.styleFrom(
          //backgroundColor: Colors.white54,
          primary: Colors.white54,
          elevation: 5,
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        )),
  );
}
