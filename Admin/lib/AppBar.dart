import 'package:flutter/material.dart';



AppBar appBar(BuildContext context){
  return AppBar(
    actions: [FlatButton(onPressed: ()=>Navigator.pop(context), child: Text("Logout"))],
    title: Center(child: Text('INFIRMARY WEB',
    style: TextStyle(color: Colors.white),
    )),
    
    
   flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Colors.orange[300],
           Colors.green
        ]
        ))
    ),
  );
}
