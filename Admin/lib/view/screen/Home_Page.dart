
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infirmaryweb/Auth/Services/FirestoreService.dart';
import 'package:infirmaryweb/view/screen/AppBar.dart';
import 'package:infirmaryweb/view/screen/Drawer.dart';
import 'package:infirmaryweb/view/screen/HomePage/left_portion.dart';
import 'package:infirmaryweb/view/screen/HomePage/middle_portion.dart';
import 'package:infirmaryweb/view/screen/HomePage/right_portion.dart';

List <String> doctor_list=List<String>();
  QuerySnapshot userStream;
  QuerySnapshot userStream2;
  QuerySnapshot userStream3;

BuildContext b;
bool status = false;
var traffic=5;
var n;


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  makeStream() async {
    QuerySnapshot temp;
    QuerySnapshot temp2;
    QuerySnapshot temp3;
    await DatabaseMethods().getStream('InfirmaryInfo').then((snapshots) {
      temp = snapshots;
    });

    await DatabaseMethods().getStream('EmergencyContact').then((snapshots) {
      temp2 = snapshots;
    });

    await DatabaseMethods().getStream('Appointments').then((snapshots) {
      temp3 = snapshots;
    });

    setState(() {
      if (temp != null) userStream = temp;
      if (temp2 != null) userStream2 = temp2;
      if (temp3 != null) userStream3 = temp3;
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
       b=context;
    });
    
    makeStream();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: appDrawer(context),
      appBar: appBar(context),
      body: Container(
        decoration: BoxDecoration(),
        child:  SingleChildScrollView(
          child: Center(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: page_view(MediaQuery.of(context).size.width*0.25,MediaQuery.of(context).size.width*0.01),
                )
              ),
           ),
        )
      )
    );
  }
}
List<Widget>  page_view(width, text_size){
  return MediaQuery.of(b).size.width>700 || MediaQuery.of(b).size.height>500?<Widget>[

   left_part(),
   middle_part(media: MediaQuery.of(b).size) ,
   right_part(width,text_size),
  
  ]:[Container(
    child: Text("AUTO-INFIRMARY"),
  )];
}

