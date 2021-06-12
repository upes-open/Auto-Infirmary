import 'package:flutter/material.dart';
import 'package:infirmaryweb/view/widget/login_widget.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

bool state_global=false;


class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double heightSize = MediaQuery.of(context).size.height; 
    

    return Scaffold(
          body: ModalProgressHUD(
            progressIndicator: CircularProgressIndicator(),
            inAsyncCall: spin,
                      child: Container(
        color: Colors.green[50],
        child: Center(
            child: Container(
              height: heightSize * 0.65,
              width: widthSize * 0.65,
              child: Card(
                elevation: 5,
                child: Row(
                  children: [
                    widthSize>1000?Expanded(
                      flex: 1,
                      child: Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: Image.asset('images/doctor2.png', height: heightSize , width: widthSize , semanticLabel: 'test',fit: BoxFit.contain,),
                        )
                      )
                    ):Container(),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(top: 40*MediaQuery.of(context).size.height/700),
                        color: Colors.green[300],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Sign In  ",style: TextStyle(fontSize: 40*MediaQuery.of(context).size.height/650),),
                               Container(
                                 width: 40*MediaQuery.of(context).size.height/650,
                                 height: 40*MediaQuery.of(context).size.height/650,
                                 child: CircleAvatar(radius: 20*MediaQuery.of(context).size.height/650,backgroundImage: AssetImage('images/doctor-logo.png'))),
                              ],
                            ),
                            SizedBox(height: 20*MediaQuery.of(context).size.height/700),
                            heightSize>550?LoginForm(
                              0, 0.009, 16, 0.04, 0.01, 0.04,
                              75, 0.01, 0.007, 0.01, 0.006
                            ):Container()
                          ]
                        )
                      )
                    )
                  ]
                )
              )
            )
        )
      ),
          ),
    );
  }
}