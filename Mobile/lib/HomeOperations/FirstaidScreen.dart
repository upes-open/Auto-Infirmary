import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infirmary/AppBar.dart';
import 'package:infirmary/HomeOperations/FirstaidDescription.dart';



class FirstAidScreen extends StatefulWidget {
  @override
  _FirstAidScreenState createState() => _FirstAidScreenState();
}
var obj = FirstAidDescription();

class _FirstAidScreenState extends State<FirstAidScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          itemCount: obj.headings.length,
          itemBuilder: (context, index){
            return card(index);
          },
        ),
      ),
    );
  }
}

Card card(int index){
  return Card(
    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(obj.headings[index], style: TextStyle(fontSize: 30),),
          Text(obj.description[index])
        ],
      ),
    ),
  );
}
