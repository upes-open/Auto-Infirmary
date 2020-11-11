import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infirmaryweb/Auth/Services/FirestoreService.dart';

class Doctor_List extends StatefulWidget {
  @override
  _Doctor_ListState createState() => _Doctor_ListState();

  
}

class _Doctor_ListState extends State<Doctor_List> {
  QuerySnapshot temp;
     QuerySnapshot userStream;

  makeStream()async{
    
    await DatabaseMethods().getStream('EmergencyContacts').then((snapshots) {
      temp = snapshots;
     // print(temp);
    });
    setState(() {
      if(temp != null)
        userStream = temp;
    });
  }
  @override
  Widget build(BuildContext context) {
   return  userStream != null ? ListView.builder(
              itemCount: userStream.documents.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Text("Hii");
                //int action =  userStream.documents[index].data['action'];
                //print(action);
                //return appointmentCard(SAP: userStream.documents[index].data['SAP'], desc: userStream.documents[index].data['description'], action: action, timeStamp:  action>0? userStream.documents[index].data['timeAllotted'].toString() : null);
              },
            ): Text("Nothing");
           /*child: Doctor_information(userStream.docs[count].get("Name"),
            userStream.docs[count].get("Number") 
            ,userStream.docs[count].get("ImgUrl"),
             userStream.docs[count].get("About")),*/
        
      
        }

    
  
  }
Card Doctor_information(String name, int number,String photo,String introduction){

child: Container(
  child: Column(
  children: [Row(children: [

    CircleAvatar(
      child: Image.network(photo)
    ),
    Text(name)

  ],
  )
  ]
),);
}