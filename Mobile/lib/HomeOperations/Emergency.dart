import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:infirmary/AppBar.dart';
import 'package:infirmary/Auth/Services/FirestoreService.dart';
import 'package:infirmary/Map.dart';
import 'package:infirmary/UrlLancher.dart';
import 'package:infirmary/main.dart';
import 'package:location/location.dart';
import 'package:map/map.dart';
import 'package:latlng/latlng.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../HelperFunctions.dart';
import '../Location.dart';

var controller = MapController(
  location: LatLng(0, 0),
);

class Emergency extends StatefulWidget {
  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  bool isLoading = false;
  LocationData locationData;
  String emergencyContact;


  void getData()async{

    QuerySnapshot temp;
    await DatabaseMethods().getStream('EmergencyContacts').then((snapshots) {

      temp = snapshots;

    });
    setState(() {
      emergencyContact = temp.documents[0].data['Pnumber'];
    });
  }

  void control() async {
    locationData = await Locate();

    setState(() {
      controller = MapController(
          location: LatLng(locationData.latitude, locationData.longitude));
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
    control();
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController phoneEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: appBar(),
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
                      decoration: textFieldInputDecoration("Land mark / Description"),
                      controller: textEditingController,
                    ),
                  ]),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.black, borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Lat :' +
                                  (locationData != null
                                      ? locationData.latitude.toString()
                                      : ''),
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              'Long :' +
                                  (locationData != null
                                      ? locationData.longitude.toString()
                                      : ''),
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.width*0.8,
                          child: Card(
                            child: isLoading
                                ? Container(
                                    height: 100,
                                    width: 100,
                                    child: CircularProgressIndicator(
                                      backgroundColor: Colors.orange,
                                      strokeWidth: 8,
                                    ))
                                : plotMap(controller),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    onTap: (){
                      if(formKey.currentState.validate() && locationData != null){
                            DatabaseMethods().addData('EmergencyAlerts', {'SAP' : user.email.split('@')[0], 'actionTaken': false, 'description' : textEditingController.text , 'latitude': locationData.latitude.toString() , 'longitude' : locationData.longitude.toString(), 'timeStamp' : DateTime.now().millisecondsSinceEpoch.toString() });

                            Alert(
                              context: context,
                              type: AlertType.success,
                              title: "Alert send successfully",
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
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text('Send Alert !', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: GestureDetector(
                    onTap: (){
                      launchURL('tel://'+ emergencyContact.toString());
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Text('Call', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
