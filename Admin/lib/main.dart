import 'dart:html';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:infirmaryweb/AppBar.dart';
import 'package:infirmaryweb/Doctor_List.dart';
import 'package:infirmaryweb/Drawer.dart';
import 'package:infirmaryweb/Auth/Services/FirestoreService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //f1.collection("test").add({"name": "hiii"});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infirmary Web',
      theme: ThemeData(
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
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

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
  bool status = false;
  QuerySnapshot userStream;
  QuerySnapshot userStream2;
  QuerySnapshot userStream3;

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
    makeStream();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      drawer: appDrawer(context),
      appBar: appBar(),
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Column(
                children: [
                  Card(
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Status :' + (status ? 'OPEN' : 'CLOSE'),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 38),
                              ),
                            ],
                          ),
                          CustomSwitch(
                            activeColor: Colors.orange,
                            value: status,
                            onChanged: (value) {
                              setState(() {
                                status = value;
                              });
                              var f = userStream.docs[0].reference
                                  .set({"isOpen": status});
                              print(f);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  userStream2 != null
                      ? Card(
                          color: Colors.blue,
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text("Doctor's List")),
                              ListView.builder(
                                itemCount: userStream2.docs.length,
                                shrinkWrap: true,
                                itemBuilder: (context, count) {
                                  return Doctor_information(
                                      userStream2.docs[count].get("Name"),
                                      userStream2.docs[count].get("Number"),
                                      userStream2.docs[count].get("ImgUrl"),
                                      userStream2.docs[count].get("About"));
                                },
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  Container(
                    child: Column(children: [
                      StreamBuilder(
                        stream: Firestore.instance
                            .collection("Appointments")
                            .snapshots(),
                        builder: (c, s) {
                          var live_count = 0;
                          var hold_case = 0;
                          var resolve_case = 0;
                          int action;
                          for (var i in s.data.docs) {
                            action = i.data()['action'];
                            if (action == 1) {
                              live_count++;
                            } else if (action == 0) {
                              hold_case++;
                            } else {
                              resolve_case++;
                            }
                          }

                          return Card(
                            color: Colors.orange,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(15),
                                  child: Text("Cases Status"),
                                ),
                                Row(
                                  children: [
                                    Container(
                                        child: Text(
                                            "Live cases                     ")),
                                    Card(
                                      color: Colors.indigoAccent,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          "$live_count",
                                          style: TextStyle(fontSize: 40),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        child: Text(
                                            "Hold cases                    ")),
                                    Card(
                                      color: Colors.indigoAccent,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          "$hold_case",
                                          style: TextStyle(fontSize: 40),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                        child: Text(
                                            "Resolved cases              ")),
                                    Card(
                                      color: Colors.indigoAccent,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          "$resolve_case",
                                          style: TextStyle(fontSize: 40),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    ]),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Container Doctor_information(
    String name, String number, String photo, String introduction) {
  return Container(
    child: Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: CircleAvatar(
                  //   child: Image.network(photo)
                  ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(name + " :  "),
                    Text(introduction),
                  ],
                ),
                SizedBox(height: 5),
                Text(number)
              ],
            ),
          ],
        ),
        SizedBox(height: 20)
      ],
    ),
  );
}
