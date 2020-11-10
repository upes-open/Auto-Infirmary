import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:infirmaryweb/AppBar.dart';
import 'package:infirmaryweb/Drawer.dart';

void main() {
  runApp(MyApp());
  
  WidgetsFlutterBinding.ensureInitialized();

 Firebase.initializeApp();

 
 
}

class MyApp extends StatelessWidget {
  
 
 //f1.collection("test").add({"name": "hiii"});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var f1=FirebaseFirestore.instance;
    f1.collection("test").add({"name": "noorie"});
    
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

  @override
  Widget build(BuildContext context) {
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
              width: MediaQuery.of(context).size.width*0.25,
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
                              Text('Status :' + (status ? 'OPEN' : 'CLOSE'), style: TextStyle(color: Colors.white , fontSize: 38),),
                            ],
                          ),
                          CustomSwitch(
                            activeColor: Colors.orange,
                            value: status,
                            onChanged: (value) {
                              print("VALUE : $value");
                              setState(() {
                                status = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
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
