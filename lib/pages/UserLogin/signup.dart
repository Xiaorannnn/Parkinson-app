import 'package:flutter/material.dart';
import 'package:parkinsons_app/services/auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//set basic variables
String username = "";
String email = "";
String password = "";
String error = "";
//connect to Amplify auth service
final AuthService _auth = AuthService();
final _formKey = GlobalKey<FormState>();

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

//build the signup page
class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.signup_header,
            // "Sign Up!",
            style: TextStyle(fontSize: 15.0),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              width: double.infinity,
              height: screenSize.height,
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      // "Sign Up",
                      AppLocalizations.of(context)!.signup_title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(height: 10),
                    Text(
                      // "Please Enter all Credentials",
                      AppLocalizations.of(context)!.signup_title_2,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    SizedBox(height: 35),
                    buildName(context),
                    SizedBox(height: 20),
                    buildEmail(context),
                    SizedBox(height: 20),
                    buildPassword(context),
                    Text("$error", style: TextStyle(color: Colors.red)),
                    buildSignUpBtn(context, this)
                  ],
                ),
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: false);
  }
}

//build the name box for typing users' names
Widget buildName(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        // "Name",
        AppLocalizations.of(context)!.signup_name,
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
          validator: (val) => val!.isEmpty ? " 输入名字" : null,
          onChanged: (val) {
            username = val;
          },
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.accessibility,
                color: Colors.blue,
              ),
              hintText: AppLocalizations.of(context)!.signup_name,
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

//build the name box for typing users' emails
Widget buildEmail(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        AppLocalizations.of(context)!.signup_email,
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
          onChanged: (val) {
            email = val;
          },
          keyboardType: TextInputType.text,
          style: TextStyle(color: Colors.black87),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.blue,
              ),
              hintText: AppLocalizations.of(context)!.signup_email,
              hintStyle: TextStyle(color: Colors.black38)),
        ),
      )
    ],
  );
}

//build the name box for typing users' passwords
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
          validator: (val) => val!.length < 6 ? "密码至少需要六位" : null,
          onChanged: (val) {
            password = val;
          },
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

//build the sign up buttion
Widget buildSignUpBtn(BuildContext context, _SignUpState parent) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: double.infinity,
    child: ElevatedButton(
        child: Text(
          AppLocalizations.of(context)!.signup_header,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          //Navigator.pop(context);
          if (_formKey.currentState!.validate()) {
            dynamic result =
                await _auth.registerWithEmailAndPassword(username, password,email);
            if (result == true) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("注册成功!")));
              Future.delayed(const Duration(seconds: 2));
              Navigator.pop(context);
            } else {
              parent.setState(() {
                // error = "Couldn't sign up with credentials";
                error = "";
              });
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("注册时发生错误")));
            }
          }
        },
        style: ElevatedButton.styleFrom(
            //backgroundColor: Colors.blue,
            primary: Colors.blue,
            padding: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ))),
  );
}
