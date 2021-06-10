import 'package:flutter/material.dart';

Container Doctor_information(
    String name, String number, String photo, String introduction, BuildContext context, var text_size) {
  return Container(
    child: Column(
      children: [
       Row(
            children: [
              Container(

                margin: EdgeInsets.only(right: 30, left: 20, bottom: 5, top:10),
               child: CircleAvatar(
           radius: 30*MediaQuery.of(context).size.width/1700,
           backgroundImage: NetworkImage(photo)
             ),
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
         Row(
             children: [
               Text(name + " :  ",
                 style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(fontSize: text_size))
                 ),
             MediaQuery.of(context).size.width>1200?Text(introduction,
                 style: Theme.of(context).textTheme.bodyText2.merge(TextStyle(fontSize: text_size))
               ):Container(),
             ],
           ),
         SizedBox(height: 5),
         Container(
           padding: EdgeInsets.all(1),
           margin: EdgeInsets.all(1),
           child: Expanded(
           child: SingleChildScrollView(
           scrollDirection: Axis.horizontal,
          child: Text(number,
               style: Theme.of(context).textTheme.bodyText2.merge(TextStyle(fontSize: text_size))
             ),
         ),
           ),
         )
                ],
              ),
            ],
          ),
        SizedBox(height: 20)
      ],
    ),
  );
}



