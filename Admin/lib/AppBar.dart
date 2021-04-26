import 'package:flutter/material.dart';



AppBar appBar(){
  return AppBar(
    title: Center(child: Text('INFIRMARY WEB',
    style: TextStyle(color: Colors.yellow[600]),
    )),
    
    
   flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Colors.cyan[500],
           Colors.black
        ]
        ))
    ),
  );
}