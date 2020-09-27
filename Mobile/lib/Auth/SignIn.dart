import 'package:flutter/material.dart';
import 'package:infirmary/Auth/Register.dart';
import 'package:infirmary/main.dart';

import '../HelperFunctions.dart';



class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailEditingController = new TextEditingController();
  TextEditingController passwordEditingController = new TextEditingController();
  String emailVerify = null;
  //AuthService authService = new AuthService();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  signIn() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });
    }
  }

    @override
    Widget build(BuildContext context) {
      return Container(
        child: Scaffold(
          backgroundColor: primaryColor,
          body: isLoading
              ? Container(
            child: Center(child: CircularProgressIndicator()),
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
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (val) {
                              return RegExp(
                                r"^\d{9}$")
                                .hasMatch(val)
                                ? null
                                : "Please Enter Correct Email";
                            },
                            style: simpleTextStyle(),
                            decoration: textFieldInputDecoration("SAP Email"),
                            controller: emailEditingController,
                          ),
                          TextFormField(
                            obscureText: true,
                            validator: (val) {
                              return val.length > 6
                                  ? null
                                  : "Enter Password 6+ characters";
                            },
                            style: simpleTextStyle(),
                            decoration: textFieldInputDecoration("Password"),
                            controller: passwordEditingController,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Text(
                                "Forgot Password?",
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    GestureDetector(
                      onTap: () {
                        signIn();
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
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),

                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have account? ",
                        ),
                        GestureDetector(
                          onTap: () {
                           Navigator.pushReplacement(context,
                               MaterialPageRoute(builder: (context) => Register()));
                          },
                          child: Text(
                            "Register now",
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
                    Text(emailVerify != null ? emailVerify : "",
                      style: TextStyle(color: Colors.red, fontSize: 15),),
                  ],
                ),
            ),
          ),
              ),
        ),
      );
    }
  }
