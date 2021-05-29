import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infirmaryweb/widget/doctor_information.dart';

class doctorlist extends StatelessWidget {
  const doctorlist({
    Key key,
    @required Size media,
  })  : _media = media,
        super(key: key);

  final Size _media;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20)*_media.width/1700,
      child: Material(
        elevation: 10,
        shadowColor: Colors.grey,
        borderRadius: BorderRadius.circular(4),
        color: Colors.green[50],
        child: Container(
          //margin: EdgeInsets.all(50),
          padding: EdgeInsets.all(20)*MediaQuery.of(context).size.width/1700,
          height: _media.height/2,
          width: _media.width / 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Doctors List',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Availiable Doctors',
                style: TextStyle(fontSize: _media.width*13/1700, color: Colors.grey),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01),
              Expanded(
                child: StreamBuilder(
                stream: Firestore.instance.collection("EmergencyContact").snapshots(),
                builder: (c,s){
                  if(s.hasData){
                    return SizedBox(
                      height: 300*_media.width/1700,
                      child: DraggableScrollableSheet(
                        initialChildSize: 0.9,
                        minChildSize: 0.4,
                        maxChildSize: 1,
                        builder:(BuildContext context,ScrollController scroll_controller){
                          return  Container(
                            child: ListView.builder(
                            controller: scroll_controller ,
                            itemCount: s.data.docs.length,
                            shrinkWrap: true,
                            itemBuilder: (context, count) {
                              return Doctor_information(
                                s.data.docs[count].data()['Name'],
                                s.data.docs[count].data()['Number'],
                                s.data.docs[count].data()['ImgUrl'],
                                s.data.docs[count].data()['About'],
                                context,
                                MediaQuery.of(context).size.width*0.01
                                );
                                },
                                ),
                                 );

      },),
  );
        }
        else{
          return Container();
        }
      }
      )
              ),
            ],
          ),
        ),
      ),
    );
  }
}