import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infirmaryweb/main.dart';

class Change_Info extends StatefulWidget {
  @override
  _Change_InfoState createState() => _Change_InfoState();
}

class _Change_InfoState extends State<Change_Info> {
  var selected;
  var choice = "no_choice", s, name, number, about;
  @override
  Widget build(BuildContext context) {
    print(selected);

    return AlertDialog(
      contentPadding: EdgeInsets.all(20),
      titlePadding: EdgeInsets.all(100),
      title: Text(
        "Change details",
        style: TextStyle(fontSize: 40),
      ),
      content: Card(
        color: Colors.blue[100],
        child: Container(
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: StreamBuilder(
                stream: Firestore.instance
                    .collection("EmergencyContact")
                    .snapshots(),
                builder: (context, snapshot) {
                  
                  doctor_list.clear();

                  for (var i in snapshot.data.docs) {
                    doctor_list.add(i.data()['Name']);

                    print(doctor_list);
                    print(selected);
                  }

                  print("List is ${snapshot.data.docs}");
                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        choice == "no_choice"
                            ? FlatButton(
                                onPressed: () {
                                  setState(() {
                                    choice = "update_existing";
                                  });
                                },
                                child: Text(
                                    "Update existing Doctor's Information"))
                            : Container(),
                        choice == "update_existing" 
                            ? DropdownButton(
                                value: selected,
                                
                                hint: Text("Choose Doctor name"),
                                items: doctor_list.map((e) {
                                  return DropdownMenuItem(
                                
                                      value: e,
                                      child: Text("$e"));
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selected = value;
                                  });
                                  print(s);
                                },
                              )
                            : Container(),
                        choice == "update_existing"
                            ? Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.all(20),
                                      child: Text("Update the details")),
                                  TextField(
                                    onChanged: (value) {
                                      name = value;
                                    },
                                    decoration:
                                        InputDecoration(labelText: "Name"),
                                  ),
                                  TextField(
                                    onChanged: (value) {
                                      number = value;
                                    },
                                    decoration: InputDecoration(
                                        labelText: "Mobile Number"),
                                  ),
                                  TextField(
                                    onChanged: (value) {
                                      about = value;
                                    },
                                    decoration:
                                        InputDecoration(labelText: "About"),
                                  ),
                                ],
                              )
                            : Container(),
                        choice == "no_choice"
                            ? FlatButton(
                                child: Text("Add a new Doctor"),
                                onPressed: () {
                                  setState(() {
                                    choice = "add_new";
                                  });
                                },
                              )
                            : Container(),
                        choice == "add_new"
                            ? Column(
                                children: [
                                  Container(
                                      margin: EdgeInsets.all(20),
                                      child: Text(
                                          "Add the details of new doctor")),
                                  TextField(
                                    decoration:
                                        InputDecoration(labelText: "Name"),
                                        onChanged: (value){
name=value;
                                        },
                                  ),
                                  TextField(
                                    onChanged: (value){
                                      number=value;
                                    },
                                    decoration: InputDecoration(
                                      
                                        labelText: "Mobile Number"),
                                  ),
                                  TextField(
                                    onChanged: (value){
                                      about=value;
                                    },
                                    decoration:
                                        InputDecoration(labelText: "About"),
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
                                      // margin: EdgeInsets.all(30),
                                      decoration: BoxDecoration(
                                        color: Colors.deepOrange[100],
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
                                              color: Colors.deepOrange[100],
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
                                          }

                                          setState(() {
                                            choice="no_choice";
                                            selected=name;
                                          });
                                        }
                                        else{
                                      Firestore.instance.collection("EmergencyContact").doc(number).set({"Name":name, "Number": number, "About": about, "ImgUrl":"aa"},
                                    
                                      );
                                        }
                                        },
                                      )
                                    : Container()
                              ])
                            : Container(),
                        FlatButton(
                          child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.deepOrange[100],
                                  borderRadius: BorderRadius.circular(40)),
                              padding: EdgeInsets.all(10),
                              width: 300,
                              child: Center(
                                child: Text(
                                  "Close",
                                  style: TextStyle(fontSize: 20),
                                ),
                              )),
                          onPressed: () {
                             
                             
                            Navigator.pop(context);
                          } 
                        ),
                      ]);
                
                 
                }),
          ),
        ),
      ),
    );
  }
}
