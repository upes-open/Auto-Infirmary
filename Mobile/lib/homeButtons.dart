
import 'package:flutter/material.dart';
import 'package:infirmary/UrlLancher.dart';

import 'main.dart';




Container buttonPannel({IconData icon, String iconText , AssetImage iconImage, Color color=Colors.black , String traffic}){
  return Container(
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon != null ?
          Icon(icon, color: color, size: 80,): Image(image: iconImage, height: 80,width: 80,),
          SizedBox(height: 10,),
          traffic != null ? Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text(traffic, style: TextStyle(fontSize: 30),),
          ): Container(),
          Text(iconText)
        ],
      ),
    ),
  );
}

Container bottomPannel(){
  return Container(
    height: 50,
    decoration: BoxDecoration(
      color: Colors.orange
    ),
    child: Container()/*Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){
            },
            child: Icon(Icons.message),
          ),
          GestureDetector(
            onTap: (){

            },
            child: Icon(Icons.message),
          ),GestureDetector(
            onTap: (){
              launchURL('tel://8882237778');
            },
            child: CircleAvatar(
              radius: 24,
              backgroundColor: Colors.black,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.phone,),
                )),
          ),GestureDetector(
            onTap: (){

            },
            child: Icon(Icons.message),
          ),GestureDetector(
            onTap: (){

            },
            child: Icon(Icons.message),
          ),
        ],
    ),*/
  );
}

