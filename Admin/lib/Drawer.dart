import 'package:flutter/material.dart';
import 'package:infirmaryweb/AppBar.dart';

import 'main.dart';



Drawer appDrawer(BuildContext context){
  return Drawer(
    child: Scaffold(
      appBar: appBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: SafeArea(
          child: Column(
            children: [
             ],
          ),
        ),
      ),
    ),
  );
}


Widget createDrawerItem(
    {IconData icon,
      String text,
      GestureTapCallback onTap,
      BuildContext context}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text , style: TextStyle(color: Colors.white),),
        )
      ],
    ),
  );
}