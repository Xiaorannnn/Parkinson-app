// import 'package:firebase_auth/firebase_auth.dart';
//import 'package:flutter/cupertino.dart';
import 'package:parkinsons_app/models/UserModel.dart';
import 'package:parkinsons_app/services/database.dart';

import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
//import 'package:flutter/material.dart';
//import 'package:parkinsons_app/amplifyconfiguration.dart';

//create a class called authservice to handle all authentication related activities
class AuthService {
  UserModel? _userModelFromAmplify(String? identityId) {
    if (identityId != null) {
      return UserModel(uid: identityId);
    }
    return null;
  }

  //sign in with anon Amplify
  Future signInAnon() async {
    try {
      AuthSession result = await Amplify.Auth.fetchAuthSession(
          options: CognitoSessionOptions(getAWSCredentials: true));
      String identityId = (result as CognitoAuthSession).identityId!;
      return _userModelFromAmplify(identityId);
    } on AuthException catch (e) {
      print(e.message);
      return null;
    }
  }

//sign in with username and password Amplify
  Future signInWithEmailAndPassword(String username, String password) async {
    try {
      //sign in
      SignInResult result =
          await Amplify.Auth.signIn(username: username, password: password);
      final user = await Amplify.Auth.getCurrentUser();
      //remember device
      await Amplify.Auth.rememberDevice();
      print('Remember device succeeded');

      //fetch device for testing use
      final devices = await Amplify.Auth.fetchDevices();
      for (var device in devices) {
        print('Device: $device');
      }

      //update to database
      String uid = user.userId;
      print("uid: " + uid);
      await DataBaseService(uid: uid).updateUserData(username, password, uid);
      return _userModelFromAmplify(uid);
    } on AuthException catch (e) {
      print(e.message);
    }
  }

//register with email and password Amplify
  Future registerWithEmailAndPassword(String name, String password) async {
    try {
      SignUpResult result = await Amplify.Auth.signUp(
        username: name,
        password: password,
      );
      return result.isSignUpComplete;
    } on AuthException catch (e) {
      print("EXCEPTION BBBBB ${e.message}");
      return null;
    }
  }

//sign out
  Future signOut() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  getCurrentUser() {
    final user = Amplify.Auth.getCurrentUser();
    return user;
  }
}
