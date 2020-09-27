import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:infirmary/Auth/Services/AuthService.dart';
import 'package:infirmary/SplashScreen.dart';
import 'package:infirmary/homeScreen.dart';

FirebaseUser user;
void main() {
    runApp(SplashScreenApp());
}

Color primaryColor = Colors.orange;

class SplashScreenApp extends StatelessWidget {
  // This widget is the root of your application.

  void getUser()async{
    if(FirebaseAuth.instance.currentUser() != null){
      user =  await FirebaseAuth.instance.currentUser();
    }else{
      user = null;
    }

  }

  @override
  Widget build(BuildContext context) {
   getUser();
    return MaterialApp(
        home: SplashScreen(),
        routes: {
              '/main': (context) => SplashScreenApp(),
        },
        theme: ThemeData(
            // primaryColor: Color(0XFF212845),
            //scaffoldBackgroundColor: Color(0XFF212845),
            primarySwatch: primaryColor,
            buttonColor: Color.fromRGBO(160, 204, 57, 2),
            textTheme: TextTheme(
                button: TextStyle(
              color: Color.fromRGBO(160, 204, 57, 2), // This is not working.
              //fontSize: 30.0,
            ))));
  }
}

