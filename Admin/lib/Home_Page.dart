import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infirmaryweb/AppBar.dart';
import 'package:infirmaryweb/Drawer.dart';

import 'Auth/Services/FirestoreService.dart';

List <String> doctor_list=List<String>();
  QuerySnapshot userStream;
  QuerySnapshot userStream2;
  QuerySnapshot userStream3;

 bool status = false;
  var traffic=5;
  var n;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  


  makeStream() async {
    QuerySnapshot temp;
    QuerySnapshot temp2;
    QuerySnapshot temp3;
    await DatabaseMethods().getStream('InfirmaryInfo').then((snapshots) {
      temp = snapshots;
    });

    await DatabaseMethods().getStream('EmergencyContact').then((snapshots) {
      temp2 = snapshots;
    });

    await DatabaseMethods().getStream('Appointments').then((snapshots) {
      temp3 = snapshots;
    });

    setState(() {
      if (temp != null) userStream = temp;
      if (temp2 != null) userStream2 = temp2;
      if (temp3 != null) userStream3 = temp3;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    makeStream();
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      
      drawer: appDrawer(context),
      appBar: appBar(),
      body: Container(
         decoration: BoxDecoration(
        ),
        child: LayoutBuilder(
                builder: (context,constraints){
                if(constraints.maxWidth>=800){
                return SingleChildScrollView(
                                child: Container(
                    width: constraints.biggest.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: page_view(MediaQuery.of(context).size.width*0.25,MediaQuery.of(context).size.width*0.01),
                    )
                  ),
                );
                }
                else if(constraints.maxWidth<800)
                {
                return SingleChildScrollView(
                                child: Container(
                                
                    width:constraints.biggest.width,
                                      child: Column(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      
                      children: page_view(constraints.biggest.width-20, MediaQuery.of(context).size.width*0.03),
                    )
                    
                  ),
                );
                }
                }
        ),
      ),
    );
  }
}

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
                  radius: 30,
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
                    Text(introduction,
                      style: Theme.of(context).textTheme.bodyText2.merge(TextStyle(fontSize: text_size))
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(number,
                  style: Theme.of(context).textTheme.bodyText2.merge(TextStyle(fontSize: text_size))
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






class right_part extends StatefulWidget {
  
double width;
double text_size;
right_part(this.width,this.text_size);
  
  @override
  _right_partState createState() => _right_partState();
}

class _right_partState extends State<right_part> {
    
  @override
  Widget build(BuildContext context) {
 
    return Container(
  //  width: widget.width,
    
          child: SingleChildScrollView(
                    child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color:Colors.black,
                    borderRadius: BorderRadius.circular(10)
                    
                  ),
                    
                    margin: EdgeInsets.only(top: 10),
                
                    width: widget.width,
                    child: Column(
                      children: [
                        Card(
                          color: Colors.black,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                              Container(
                                          width: widget.width,
                                          height: 50,
                                          color: Colors.cyan[900],
                                          child: Center(
                                            child: Text(
                                              
                                         'Status :' + (status ? 'OPEN' : 'CLOSE'),
                                        style: Theme.of(context).textTheme.headline2.merge(TextStyle(fontSize: widget.text_size))),
                                          ),
                                        ),
                               /* Row(
                            
                                  children: [
                                    Container(
                                      width: widget.width,
                                      color: Colors.cyan,
                                      child: Text(
                                         'Status :' + (status ? 'OPEN' : 'CLOSE'),
                                        style: Theme.of(context).textTheme.headline2.merge(TextStyle(fontSize: widget.text_size))),
                                    )
                                      //Theme.of(context).textTheme.bodyText1)
                                      
                                     /* TextStyle(
                                          color: Colors.white, fontSize: widget.text_size),
                                    ),*/
                                  ],
                                ),*/
                                Container(
                                  color: Colors.cyan[200],

                                  width: widget.width,
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
                        SizedBox(
                          height: 30
                        ),
                        Card(
                                color:Colors.cyan[200],
                                child: Column(
                                  children: [
                                   Container(
                                        //margin: EdgeInsets.all(10),
                                        child: Container(
                                          width: widget.width,
                                          height: 50,
                                          color:Colors.cyan[900],
                                          child: Center(
                                            child: Text("Doctor's List",
                                                style: Theme.of(context).textTheme.headline2.merge(TextStyle(fontSize: widget.text_size))
                                            ),
                                          ),
                                        )),
                                        Container(
child:   StreamBuilder(
  
    
  
    stream: Firestore.instance.collection("EmergencyContact").snapshots(),
  
    
  
    builder: (c,s){
  
    
  
      if(s.hasData){
  

  return SizedBox(
    height: 300,
  
    
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
    
      
    
                                                        widget.text_size
    
      
    
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
  
    
  
    
  
    
  
    ),
),


                            
                                  
                                  ],
                                ),
                              ),
                              SizedBox(
                                          height: 30
                                      
                                        ),
                          
                            
                        Container(
                          child: Column(children: [
                           StreamBuilder(
                              stream: Firestore.instance
                                  .collection("Appointments")
                                  .snapshots(),
                              builder: (c, snap) {
                                if(snap.hasData){
                                var live_count = 0;
                                var hold_case = 0;
                                var resolve_case = 0;
                                int action;
                                for (var i in snap.data.docs) {
                                  action = i.data()['action'];
                                  if (action == 1) {
                                    live_count++;
                                  } else if (action == 0) {
                                    hold_case++;
                                  } else {
                                    resolve_case++;
                                  }
                                }
                              

                                return Card(
                                  color: Colors.black,
                                
                                  child: Container(
                                  
                                
                                    color: Colors.cyan[200],
                                    child: Column(
                                      children: [
                                        
                                        Container(
                                        
                                          child: Container(
                                            

                                            width: widget.width,
                                            height: 50,
                                            
                                             color: Colors.cyan[900],
                                            child: Center(
                                              child: Text("Cases Status",
                                              style: Theme.of(context).textTheme.headline2.merge(TextStyle(fontSize: widget.text_size))
                                              
                                              ),
                                            ),
                                          ),
                                        ),
                                        
                                        Container(
                                          padding: EdgeInsets.only(left: 10,
                                                  top:10),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  Container(
                                                    
                                                      child: Text(
                                                          "Live cases      ",
                                                            style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(fontSize: widget.text_size)),
                                                          )),
                                                  Card(
                                                  margin: EdgeInsets.only(left: 40,top:10,bottom: 10),
                                                
                                                    color: Colors.cyan[900],
                                                    child: Container(
    
                                                      padding: EdgeInsets.symmetric(horizontal:20),
                                                      child: Text(
                                                        "$live_count",
                                                        style: Theme.of(context).textTheme.headline1.merge(TextStyle(fontSize: widget.text_size))
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                               Row(
                                                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                  child: Text(
                                                      "Hold cases      ",
                                                       style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(fontSize: widget.text_size))
                                                      )),
                                              Card(
                                                 margin: EdgeInsets.only(left: 40,top:10,bottom: 10),
                                                    
                                                color: Colors.cyan[900],
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: Text(
                                                    "$hold_case",
                                                    style: Theme.of(context).textTheme.headline1.merge(TextStyle(fontSize: widget.text_size)),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                  child: Text(
                                                      "Resolved cases",
                                                        style: Theme.of(context).textTheme.bodyText1.merge(TextStyle(fontSize: widget.text_size))
                                                      )),
                                              Card(
                                                margin: EdgeInsets.only(left: 40,top:10,bottom: 10),
                                                color: Colors.cyan[900],
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20),
                                                  child: Text(
                                                    "$resolve_case",
                                                    style: Theme.of(context).textTheme.headline1.merge(TextStyle(fontSize: widget.text_size)),
                                                  ),
                                                ),
                                              ),
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
                                else{
                                  return Container(
                                  
                                  );
                                }
                                
                              },
                            )
                          ]),
                        ),
                         SizedBox(
                          height: 30
                        ),

                        Card(
                          color: Colors.cyan[900],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(child: 
                                Text("Live Traffic:",
                                style: Theme.of(context).textTheme.headline2.merge(TextStyle(fontSize: widget.text_size)),
                                ),
                              
                              padding: EdgeInsets.all(10),),
                              Card(
                                color: Colors.cyan[900],
                                margin: EdgeInsets.all(20),
                                child: Container(child:  Text(

                                                "$traffic",
                                                style: Theme.of(context).textTheme.headline1.merge(TextStyle(fontSize: widget.text_size)),
                                              ),
                                padding: EdgeInsets.symmetric(
                                                  horizontal: widget.text_size),
                                ),
                              
                                )

                            ]
                          )
                        )
                      ],
                    ),
                  ),
                
              ],
            ),
          )
              

              
        );
  }
}


class middle_part  extends StatelessWidget {

  //double width;
  //middle_part(this.width);
  @override
  Widget build(BuildContext context) {
    return Container(
    //  width: width ,
      child: Text("This is middle portion"),
      
    );
  }
}



class left_part  extends StatelessWidget {
   //double width;
  //left_part(this.width);
  @override
  Widget build(BuildContext context) {
    return Container(
    //  width: width,
      
      child: Text("This is Left portion"),
      
    );
  }
}








List<Widget>  page_view(width, text_size){
  return <Widget>[
    
   
    left_part(),
    middle_part(),
    right_part(width,text_size),
    
  
  ];

}

