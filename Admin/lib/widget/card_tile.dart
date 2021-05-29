import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CardTile extends StatelessWidget {
  final String cardTitle;
  final IconData icon;
  final Color iconBgColor;
  final String mainText;
  final String subText;
  final int n;


  const CardTile(
      {Key key,
      this.cardTitle,
      this.icon,
      this.iconBgColor,
      this.mainText,
      this.subText,
      this.n,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _media = MediaQuery.of(context).size;
    return FittedBox(
      child: Container(
        height: MediaQuery.of(context).size.height / 5,
        width: MediaQuery.of(context).size.width/ 6,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Material(
              elevation: 20,
              color: Colors.green[50],
              shadowColor: Colors.grey,
              borderRadius: BorderRadius.circular(4),
              child: Container(
                height: MediaQuery.of(context).size.height / 6,
                width: MediaQuery.of(context).size.width/ 7,
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      cardTitle,
                      style: TextStyle(
                              fontSize: 18*MediaQuery.of(context).size.width/1700
                            ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    FittedBox(
                      child: StreamBuilder(
                              stream: Firestore.instance
                                  .collection("Appointments")
                                  .snapshots(),
                              builder: (c, snap) {
                                if(snap.hasData){
                                var count = 0;
                                int action;
                                for (var i in snap.data.docs) {
                                  action = i.data()['action'];
                                  if (action == n) {
                                    count++;
                                  } 
                        
                                }
                                if(n==100)
                                count=5;
                                return Text("$count",style: TextStyle(fontSize: 30*MediaQuery.of(context).size.width/1700,fontWeight: FontWeight.bold));
                                }
                                else{
                                  return Container(
                                  child: Text("NA"),
                                  );
                                }
                                
                              },
                            )
                      
                    ),
                    Spacer(),
                    Divider(),
                    Align(
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                          child: Text(
                            subText,
                            style: TextStyle(
                              fontSize: 15*MediaQuery.of(context).size.width/1700
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 20,
              child: Material(
                color: iconBgColor,
                borderRadius: BorderRadius.circular(4),
                elevation: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: iconBgColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: _media.height / 18,
                  width: _media.width / 20,
                  child: Icon(
                    icon,
                    size: 35*_media.width/1700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}