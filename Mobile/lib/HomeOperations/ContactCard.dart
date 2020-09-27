import 'package:flutter/material.dart';

import '../UrlLancher.dart';


Card contactCard( {String name , String line , String ImgURL , bool isAvailable , String number }){
  return Card(
    child: Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(ImgURL),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                Text(line, style: TextStyle(),),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Availability :', style: TextStyle(fontSize: 10),),
                    Icon(Icons.check_circle, size: 15, color: isAvailable ? Colors.green : Colors.red,)
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: (){
                launchURL('tel://'+number);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.phone, size: 50,),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}