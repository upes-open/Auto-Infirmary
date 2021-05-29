import 'dart:html';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:infirmaryweb/AppBar.dart';
import 'package:infirmaryweb/Auth/Services/login.dart';
import 'package:infirmaryweb/Change_Info.dart';
import 'package:infirmaryweb/Drawer.dart';
import 'package:infirmaryweb/Auth/Services/FirestoreService.dart';
import 'package:infirmaryweb/HomePage/left_portion.dart';
import 'package:infirmaryweb/Home_Page.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      
      title: 'Infirmary Web',
      theme: ThemeData(
        

        primaryColor: Colors.cyan,
        

        
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        
        fontFamily: "RussoOne-Regular",
        textTheme: TextTheme(

          headline2: TextStyle(fontWeight: FontWeight.normal,color: Colors.yellow),
          headline1: TextStyle(fontWeight: FontWeight.normal,color: Colors.yellow[700]),
          bodyText1: TextStyle(fontWeight: FontWeight.normal,color: Colors.black),
          bodyText2: TextStyle(fontWeight: FontWeight.normal,color: Colors.blue[900]),


        )

      ),
    
      routes: {
        "/":(context)=> login(),
        "dashboard":(context)=> MyHomePage(),
        "Change_Info":(context)=> Change_Info()
      }
    );
  }
}


/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:infirmaryweb/pages/main_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(title: TextStyle(color: Colors.black)),
        //fontFamily: GoogleFonts.montserrat().fontFamily,
      ),
      home: MainPage(),
    );
  }
}*/