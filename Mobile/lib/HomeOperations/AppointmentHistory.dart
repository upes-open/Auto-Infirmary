import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infirmary/AppBar.dart';
import 'package:infirmary/Auth/Services/FirestoreService.dart';

import 'ContactCard.dart';

class AppointmentHistory extends StatefulWidget {
  @override
  _AppointmentHistoryState createState() => _AppointmentHistoryState();
}

class _AppointmentHistoryState extends State<AppointmentHistory> {

  QuerySnapshot userStream;


  makeStream()async{
    QuerySnapshot temp;
    await DatabaseMethods().getStreamWithSAP('Appointments').then((snapshots) {

      temp = snapshots;

    });


    setState(() {
      if(temp != null)
        userStream = temp;
    });


  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userStream = null;
  }


  @override
  Widget build(BuildContext context) {
    makeStream();

    return Container(
      child: Scaffold(
        appBar: appBar(),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            userStream != null ? ListView.builder(
              itemCount: userStream.documents.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                int action =  userStream.documents[index].data['action'];
                print(action);
                return appointmentCard(SAP: userStream.documents[index].data['SAP'], desc: userStream.documents[index].data['description'], action: action, timeStamp:  action>0? userStream.documents[index].data['timeAllotted'].toString() : null);
              },
            ): Container(),

          ],
        ),
      ),
    );
  }
}



Card appointmentCard( {String SAP , String desc , int action , String timeStamp }){
  return Card(
    child: Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(SAP, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                timeStamp != null ? Row(
                  children: [
                    Icon(Icons.timer, size: 25,),
                    SizedBox(width: 5,),
                    Text(timeStamp, style: TextStyle(fontSize: 20),),
                  ],
                ): Container(),
                SizedBox(height: 5,),
                Text(desc, style: TextStyle(),),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text('Action :', style: TextStyle(fontSize: 10),),
                    Icon(Icons.check_circle, size: 15, color: action == 0 ? Colors.red : action == 1 ? Colors.green : Colors.blue,)
                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    ),
  );
}