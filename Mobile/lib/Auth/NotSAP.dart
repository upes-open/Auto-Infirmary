import 'package:flutter/material.dart';

import 'Services/AuthService.dart';


class NotSAP extends StatefulWidget {
  @override
  _NotSAPState createState() => _NotSAPState();
}

class _NotSAPState extends State<NotSAP> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Not SAP Mail Try Again !!',
                  style: TextStyle(fontSize: 30 , color: Colors.white),),
                GestureDetector(
                  onTap: () async {
                    AuthService().signInWithGoogle(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 16, horizontal: 100),
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white
                          ],
                        )),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          height: 30,
                          image: AssetImage('images/google_logo.png'),
                        ),
                        Text(
                          "Login using SAP",
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
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
