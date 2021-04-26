import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infirmaryweb/Auth/Services/FirestoreService.dart';
import 'package:infirmaryweb/Home_Page.dart';
import 'package:infirmaryweb/main.dart';
import 'package:toast/toast.dart';


var animation,a;
class Change_Info extends StatefulWidget {
  @override
  _Change_InfoState createState() => _Change_InfoState();
}

class _Change_InfoState extends State<Change_Info>
    with TickerProviderStateMixin {
  AnimationController _controller,_controller2,_controller3;
  var animation,animation2,animation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 2));
    _controller2 = AnimationController(vsync: this,duration: Duration(seconds: 2));
    _controller3 = AnimationController(vsync: this,duration: Duration(seconds: 2));
    animation=CurvedAnimation(parent: _controller, curve: Curves.easeIn,);
    animation2=CurvedAnimation(parent: _controller2, curve: Curves.easeIn);
    animation3=CurvedAnimation(parent: _controller3, curve: Curves.easeIn);

  if(a==1)
  _controller.forward(from: 0.5);
  else if(a==2)
  _controller2.forward(from: 0.5);
  else if(a==3)
  _controller3.forward(from: 0.5);
  }
  
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

 var selected;
  var choice = "no_choice", s, name, number, about,image_url;
 
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.cyan[900],
      contentPadding: EdgeInsets.all(20),
      titlePadding: EdgeInsets.all(80),
      title: Center(
        child: Text(
          "Change details",
          style: TextStyle(fontSize: 40,
          color: Colors.yellow
          ),
        ),
      ),
      content: Container(
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: StreamBuilder(
                stream: Firestore.instance
                    .collection("EmergencyContact")
                    .snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.hasData){
                  doctor_list.clear();
                  for (var i in snapshot.data.docs) {
                    doctor_list.add(i.data()['Name']);
                  }
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        choice == "no_choice"
                            ? Container(
                              margin: EdgeInsets.only(bottom: 20),
                              height: 55,
                              width: 400,
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.cyan[200]),
                              child: Center(
                                child: InkWell(
                                  onTap:  () {
                                  setState(() {
                                    choice = "update_existing";
                                  });
                                },
                                  onHover: (status){
                                    setState(() {
                                      a=1;
                                      });
                                    if(status==true){
                                       _controller.forward(from: 0.5);
                                        }
                                      },   
                                  onDoubleTap: (){},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                     RotationTransition(
                                       turns: animation,
                                       child: Container(
                                          margin: EdgeInsets.all(20),
                                          child: Icon(Icons.update,
                                          size: 20,
                                          )
                                            ),
                                    ),
                                                                              
                                      SizedBox(width: 50),
                                      Text(
                                        "Update existing doctor details", 
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ):
                             Container(),
                        choice == "update_existing" 
                            ? DropdownButton(
                                value: selected,
                                
                                hint: Text("Choose Doctor name"),
                                items: doctor_list.map((e) {
                                  return DropdownMenuItem(
                                      value: e,
                                      child: Container(
                                        width: 200,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.cyan[200],
                                        ),
                                    
                                        child: Center(child: Text("$e"))));
                              }).toList(),
                                onChanged: (value) 
                                {
                                  setState(() {
                                  selected = value;
                                  });
                                },
                              )
                            : Container(),
                        choice == "update_existing"
                            ? Column(
                                children: [
                                  SizedBox(
                                    height: 50
                                        ),
                                  TextField(
                                    onChanged: (value) {
                                    name = value;
                                    },
                                    keyboardType: TextInputType.name,
                                    decoration:
                                        InputDecoration(labelText: "Name",
                                        isDense: true,
                                        prefixIcon: Icon(Icons.person),
                                        fillColor: Colors.yellow[200],
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)), 
                                        ),
                                  ),
                                  SizedBox(
                                    height: 20
                                  ),
                                  TextField(
                                    onChanged: (value) {
                                    number = value;
                                    },
                                     keyboardType: TextInputType.number,
                                     decoration:
                                        InputDecoration(labelText: "Mobile Number",
                                        isDense: true,
                                        prefixIcon: Icon(Icons.phone),
                                        fillColor: Colors.yellow[200],
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                        ),
                              
                                  ),
                                  SizedBox(
                                    height: 20
                                  ),
                                  TextField(
                                    onChanged: (value) {
                                      about = value;
                                    },
                                    keyboardType: TextInputType.name,
                                    decoration:
                                        InputDecoration(labelText: "About",
                                        isDense: true,
                                        prefixIcon: Icon(Icons.info),
                                        fillColor: Colors.yellow[200],
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                        ),
                                  ),
                                  SizedBox(
                                    height: 20
                                  ),
                                  TextField(
                                    onChanged: (value) {
                                      image_url = value;
                                    },
                                     keyboardType: TextInputType.name,
                                    //autofocus: true,
                                    

                                    decoration:
                                    
                                        InputDecoration(labelText: "Image URL",
                                        isDense: true,
                                        prefixIcon: Icon(Icons.image),
                                        fillColor: Colors.yellow[200],
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                       // errorText: "Please enter string only"
                                        ),
                                  ),
                                ],
                              )
                            : Container(),
                        choice == "no_choice"
                            ?  Container(
                            //margin: EdgeInsets.symmetric(vertical: 10),
                             height: 55,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.cyan[200]),
                              child: Center(
                                child: InkWell(
                                  onDoubleTap: (){},
                                  onTap:  () {
                                  setState(() {
                                    choice = "add_new";
                                  });
                                },

                                  onHover: (status){
                                    if(status==true){
                                      setState(() {
                                        a=2;
                                      });
                                      _controller2.forward(from: 0.5);
                                    }
                                  },
                                                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      RotationTransition(
                                        turns: animation2,
                                                                              child: Container(
                                          margin: EdgeInsets.all(20),
                                          child: Icon(Icons.add,
                                          size: 20,
                                          )),
                                      ),
                                      SizedBox(width: 50),
                                      Text(
                                        "Add a new Doctor",
                                        
                                      ),
                                    ],
                                  ),
                                ),
                              )
                               
                              )
                            : Container(),
                        choice == "add_new"
                            ? Column(
                                children: [
                                  TextField(
                                    keyboardType: TextInputType.name,
                                    decoration:
                                    
                                        InputDecoration(labelText: "Name",
                                        isDense: true,
                                        prefixIcon: Icon(Icons.person),
                                        fillColor: Colors.yellow[200],
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                       
                                        ),
                                        onChanged: (value){
                                          name=value;
                                        },
                                  ),
                                  SizedBox(height: 15),
                                  TextField(
                                    onChanged: (value){
                                      number=value;
                                    },
                                   keyboardType: TextInputType.name,
                                    //autofocus: true,
                                    

                                    decoration:
                                    
                                        InputDecoration(labelText: "Mobile Number",
                                        isDense: true,
                                        prefixIcon: Icon(Icons.phone),
                                        fillColor: Colors.yellow[200],
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      
                                        ),
                                  ),
                                   SizedBox(height: 15),
                                  TextField(
                                    onChanged: (value){
                                      about=value;
                                    },
                                    keyboardType: TextInputType.name,
                                    //autofocus: true,
                                    

                                    decoration:
                                    
                                        InputDecoration(labelText: "About",
                                        isDense: true,
                                        prefixIcon: Icon(Icons.info),
                                        fillColor: Colors.yellow[200],
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                       
                                        
                                        ),
                                  ),
                                   SizedBox(height: 15),
                                   TextField(
                                    onChanged: (value){
                                      image_url=value;
                                    },
                                    keyboardType: TextInputType.name,
                                    //autofocus: true,
                                    

                                    decoration:
                                    
                                        InputDecoration(labelText: "Image URL",
                                        isDense: true,
                                        prefixIcon: Icon(Icons.image),
                                        fillColor: Colors.yellow[200],
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                      
                                        ),
                                  ),
                                ],
                              )
                            : Container(),
                        SizedBox(
                          height: 20,
                        ),
                        choice != "no_choice"
                            ? Row(children: [
                                FlatButton(
                                  child: Container(
                                      margin: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.cyan[200],
                                        borderRadius: BorderRadius.circular(20)

                                      ),
                                      padding: EdgeInsets.all(20),
                                      width: 200,
                                      child: Center(
                                        child: Text(
                                          "Back",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      )),
                                  onPressed: () {
                                    setState(() {
                                       
                                      choice = "no_choice";
                                    });
                                  },
                                ),
                                choice != "no_choice"
                                    ? FlatButton(
                                        child: Container(
                                            //margin: EdgeInsets.all(30),
                                            decoration: BoxDecoration(
                                              color: Colors.cyan[200],
                                              borderRadius: BorderRadius.circular(20)
                                            ),
                                            padding: EdgeInsets.all(20),
                                            width: 200,
                                            child: Center(
                                              child: Text(
                                                "Save",
                                                style: TextStyle(fontSize: 20),
                                              ),
                                            )),
                                        onPressed: () {

                                          Toast.show("Doctor's list updated", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);

                                          if(choice=="update_existing"){
                                          s = userStream2.docs.where(
                                              (element) => element
                                                  .data()
                                                  .containsValue(selected));
                                          for (var i in s) {
                                            i.reference.set({"Name": "$name"},
                                                SetOptions(merge: true));
                                            i.reference.set(
                                                {"Number": "$number"},
                                                SetOptions(merge: true));

                                            i.reference.set({"About": "$about"},
                                                SetOptions(merge: true));

                                                  i.reference.set({"ImgUrl": "$image_url"},
                                                SetOptions(merge: true));
                                                
                                          }

                                          setState(() {
                                            choice="no_choice";
                                            selected=name;
                                          });
                                        }
                                        else{
                                      Firestore.instance.collection("EmergencyContact").doc().set({"Name":name, "Number": number, "About": about, "ImgUrl": image_url},
                                    //"Docor "+doctor_number.toString()
                                      );
                                        }
                                        Navigator.pop(context);
                                        },
                                      )
                                    : Container()
                              ])
                            : Container(),
                        
                           Container(
                            //margin: EdgeInsets.symmetric(vertical: 10),
                             height: 55,
                                  width: 400,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.cyan[200]),
                              child: Center(
                                child: InkWell(
                                  onTap:   () {
                             
                             
                            Navigator.pop(context);
                          } ,
                                  onDoubleTap: (){},
                                  onHover: (status){
                                    setState(() {
                                      a=3;
                                    });
                                    if(status==true){
                                      _controller3.forward(from: 0.5);
                                    }
                                  },
                                                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      RotationTransition(
                                        turns: animation3,
                                                                              child: Container(
                                          margin: EdgeInsets.all(20),
                                          child: Icon(Icons.close,
                                          size: 20,
                                          )),
                                      ),
                                      SizedBox(width: 50),
                                      Text(
                                        "Close",
                                        
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        
                      ]);
                 }
                 else{
                   return Container();
                 }
                  }),
          ),
        ),
      
    );
  }
  
}
