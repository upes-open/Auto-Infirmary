import 'package:flutter/material.dart';
import 'package:infirmary/Auth/Services/AuthService.dart';
import 'package:infirmary/Auth/SignIn.dart';

import '../HelperFunctions.dart';
import '../Theme.dart';


class Register extends StatefulWidget {

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  TextEditingController usernameEditingController = new TextEditingController();
  String gender = "null";
  String campus = "null";
  String usrnameMsg = null;
  int usrnameCount = 5;
  String emailVerify;

  //AuthService authService = new AuthService();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  SignUp() {
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: primaryColor,
      body: isLoading
          ? Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      )
          : SafeArea(
            child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Form(
                  key: formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: emailEditingController,
                          style: simpleTextStyle(),
                          validator: (val) {
                            return RegExp(r"^\d{9}$").hasMatch(val)
                                ? null
                                : "Enter SAP ID e.g. 5000XXXXX";
                          },
                          decoration:
                          textFieldInputDecoration("Name"),
                        ),
                        TextFormField(
                          controller: emailEditingController,
                          style: simpleTextStyle(),
                          validator: (val) {
                            return RegExp(r"^\d{9}$").hasMatch(val)
                                ? null
                                : "Enter SAP ID e.g. 5000XXXXX";
                          },
                          decoration:
                          textFieldInputDecoration("SAP ID"),
                        ),
                        TextFormField(
                          obscureText: true,
                          style: simpleTextStyle(),
                          decoration: textFieldInputDecoration("Password"),
                          controller: passwordEditingController,
                          validator: (val) {
                            return val.length < 6
                                ? "Enter Password 6+ characters"
                                : null;
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          style: simpleTextStyle(),
                          decoration:
                          textFieldInputDecoration("Confirm password"),
                          validator: (val) {
                            return val == passwordEditingController.text
                                ? null
                                : "Passwords are not same";
                          },
                        ),
                        TextFormField(
                          controller: emailEditingController,
                          style: simpleTextStyle(),
                          validator: (val) {
                            return RegExp(r"^\d{10}$").hasMatch(val)
                                ? null
                                : "Enter correct mobile Number";
                          },
                          decoration:
                          textFieldInputDecoration("Mobile Number"),
                        ),




                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                GestureDetector(
                  onTap: () async {
                      AuthService().signInWithGoogle(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [
                           Colors.black,
                            Colors.black
                          ],
                        )),
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  usrnameMsg == null ? "" : usrnameMsg,
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  emailVerify != null ? emailVerify : "",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: simpleTextStyle(),
                    ),
                    GestureDetector(
                      onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
                      },
                      child: Text(
                        "SignIn now",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),

              ],
            ),
        ),
      ),
          ),
    );
  }
}
