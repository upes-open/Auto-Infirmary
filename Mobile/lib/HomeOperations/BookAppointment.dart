import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infirmary/AppBar.dart';
import 'package:infirmary/Auth/Services/FirestoreService.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../HelperFunctions.dart';
import '../UrlLancher.dart';
import '../main.dart';


class BookAppointment extends StatefulWidget {
  @override
  _BookAppointmentState createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Form(
                    key: formKey,
                    child: Column(children: [
                      TextFormField(
                        validator: (val) {
                          return RegExp(
                              r"^\d{10}$")
                              .hasMatch(val)
                              ? null
                              : "Please enter correct number";
                        },
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration("Phone number"),
                        controller: phoneEditingController,
                        keyboardType: TextInputType.number,
                      ),
                      TextFormField(
                        validator: (val) {
                          return val.length > 0
                              ? null
                              : "Description";
                        },
                        style: simpleTextStyle(),
                        decoration: textFieldInputDecoration("Description"),
                        controller: textEditingController,
                      ),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0 , vertical: 20),
                    child: GestureDetector(
                      onTap: (){
                        if(formKey.currentState.validate() ){
                          DatabaseMethods().addData('Appointments', {'SAP' : user.email.split('@')[0], 'action': 0, 'description' : textEditingController.text , 'timeStamp' : DateTime.now().millisecondsSinceEpoch.toString() });



                          Alert(
                            context: context,
                            type: AlertType.success,
                            title: "Appointment send for confirmation",
                            desc: "Check your alloted time in booking history.",
                            buttons: [
                              DialogButton(
                                child: Text(
                                  "OK",
                                  style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                  textEditingController.clear();
                                  phoneEditingController.clear();
                                },
                                color:  Colors.green,
                              ),

                            ],
                          ).show();
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text('Book', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/*
action = 0 => appointment sent for approval
action = 1 => appoint booked + time alloted
action = 2 => appoint resolved
* */