import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:infirmaryweb/Home_Page.dart';
import 'package:infirmaryweb/widget/doctor_list.dart';

class left_part extends StatefulWidget {
  @override
  _left_partState createState() => _left_partState();
}

class _left_partState extends State<left_part> {
  @override
  Widget build(BuildContext context) {
     return Container(
    //  width: width,
      child: Column(
        children: [

           Card(
                          
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                              Container(
                                          width: MediaQuery.of(context).size.width*0.2,
                                          height: 80,
                                          //color: Colors.cyan[900],
                                          color: Colors.orange[300],
                                          child: Center(
                                            child: Text(
                                              
                                         'Status :' + (status ? ' OPEN' : ' CLOSE'),
                                        style: Theme.of(context).textTheme.headline2.merge(TextStyle(color: Colors.white,fontSize: MediaQuery.of(context).size.width*0.015))),
                                          ),
                                        ),
                                
                                Container(
                                  color: Colors.green[300],

                                  width: MediaQuery.of(context).size.width*0.2,
                                  height: 60,
                      
                                  child: Center(
                                    child: CustomSwitch(
                                      activeColor: Colors.orange,
                                      value: status,
                                      onChanged: (value) {
                                        setState(() {
                                          status = value;
                                        });
                                        var f = userStream.docs[0].reference
                                           .set({"isOpen": status});
                                    
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          
                        ),
          
        doctorlist(media: MediaQuery.of(context).size),
                              ]
      )
    );
    
  }
}