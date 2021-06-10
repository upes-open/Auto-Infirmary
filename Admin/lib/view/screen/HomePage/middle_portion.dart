import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class middle_part extends StatelessWidget {
  const middle_part({
    Key key,
    @required Size media,
  })  : _media = media,
        super(key: key);

  final Size _media;

  @override
  Widget build(BuildContext context) {
    return Material(

      elevation: 10,
      shadowColor: Colors.grey,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        height: _media.height / 1.4,
        width: _media.width / 3 ,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Positioned(
                  top: 10,
                  left: 20,
                  bottom: 30,
                  child: Text(
                    'Daily Appointment',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 50.0, left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                         // SizedBox(width: 2),
                          Text(
                            'Student Id',
                            style: TextStyle(color: Colors.green[300],fontSize: MediaQuery.of(context).size.width*0.011),
                          ),
                          SizedBox(width: 100*MediaQuery.of(context).size.width/1700),
                          Text(
                            'Description',
                            style: TextStyle(color: Colors.green[300],fontSize: MediaQuery.of(context).size.width*0.011),
                          ),
                          
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(thickness: 7,color: Colors.green[300],),
                       StreamBuilder(builder: (context,s)
          {
           if(s.hasData){
  

  return Container(
    height: _media.height / 1.9,
        width: _media.width / 2,
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
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        Text("${s.data.docs[count].data()['SAP']}",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.011,color: Colors.brown[400])),
                        SizedBox(width:100*MediaQuery.of(context).size.width/1700),
                        Text("${s.data.docs[count].data()['description']}",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.011,color: Colors.brown[400]),)
                      ],),
                      SizedBox(height: 10)
                    ],
                  );
                  
                /*  appointment(
                    s.data.docs[count].data()['description'],
                    s.data.docs[count].data()['SAP'],
                    context,
                    );*/
                    }
                    ),
                    );
                    },
    ),
  );
      
        }
        else
        return Container();
          },
          stream: Firestore.instance.collection("Appointments").snapshots(),
          )
                     
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}