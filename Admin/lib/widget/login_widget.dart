import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infirmaryweb/Auth/Services/login.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:infirmaryweb/Change_Info.dart';
import 'package:infirmaryweb/HomePage/right_portion.dart';
import 'package:infirmaryweb/Home_Page.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:toast/toast.dart';

bool _obscureText=true;
var spin = false;
var email;
var password;
var auth = FirebaseApp.instance;
class LoginForm extends StatefulWidget {
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final paddingTopForm, fontSizeTextField, fontSizeTextFormField, spaceBetweenFields, iconFormSize;
  final spaceBetweenFieldAndButton, widthButton, fontSizeButton, fontSizeForgotPassword, fontSizeSnackBar, errorFormMessage;

  LoginForm(
    this.paddingTopForm, this.fontSizeTextField, this.fontSizeTextFormField, this.spaceBetweenFields, this.iconFormSize, this.spaceBetweenFieldAndButton,
    this.widthButton, this.fontSizeButton, this.fontSizeForgotPassword, this.fontSizeSnackBar, this.errorFormMessage
  );

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double heightSize = MediaQuery.of(context).size.height; 
    
    return Form(
      autovalidate: true,
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.only(left: widthSize * 0.05, right: widthSize * 0.05, top: 30),
        child: Column(
                children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Email', style: TextStyle(
            fontSize: 15,
            fontFamily: 'Poppins',
            color: Colors.white)
          )
        ),
        TextFormField(
        
          onChanged: (value) => {email = value},
          controller: _usernameController,
          validator: (value) {
            if(value.isEmpty) {
              return 'Field is empty !!';
            }
          },
          cursorColor: Colors.white,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            fillColor: Colors.white,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2)
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2)
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2)
            ),
            labelStyle: TextStyle(color: Colors.white),
            errorStyle: TextStyle(color: Colors.white, fontSize: widthSize * widget.errorFormMessage),
            prefixIcon: Icon(
              Icons.person,
              size: widthSize * widget.iconFormSize,
              color: Colors.white,
            ),
          ),
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.white, fontSize: widget.fontSizeTextFormField)
        ),
        SizedBox(height: heightSize * widget.spaceBetweenFields),
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Password', style: TextStyle(
            fontSize: 15,
            fontFamily: 'Poppins',
            color: Colors.white)
          )
        ),
        TextFormField(
          onChanged: (value) => {password = value},
          obscureText: _obscureText,
          controller: _passwordController,
          validator: (value){
            if(value.isEmpty || value==null) {
              print("NO PASSWORD");
              return 'Password field is empty!!';
            }
          },
          
          cursorColor: Colors.white,
          keyboardType: TextInputType.text,
         // obscureText: true,
          decoration: InputDecoration(
            suffixIcon: IconButton(
          // Based on passwordVisible state choose the icon
           icon: Icon(_obscureText
           ? Icons.visibility_off
           : Icons.visibility,
           color: Theme.of(context).primaryColorDark),

        onPressed: () {
           // Update the state i.e. toogle the state of passwordVisible variable
           setState(() {
               _obscureText = !_obscureText;
           });}),
            fillColor: Colors.white,
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 2)
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2)
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 2)
            ),
            labelStyle: TextStyle(color: Colors.white),
            errorStyle: TextStyle(color: Colors.white, fontSize: widthSize * widget.errorFormMessage),
            prefixIcon: Icon(
              Icons.lock,
              size: widthSize * widget.iconFormSize,
              color: Colors.white,
            ),
          ),
          textAlign: TextAlign.start,
          style: TextStyle(color: Colors.white, fontSize: widget.fontSizeTextFormField)
        ),
        SizedBox(height: heightSize * widget.spaceBetweenFieldAndButton),
        FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ),
          padding: EdgeInsets.fromLTRB(widget.widthButton, 15, widget.widthButton, 15),
          color: Colors.white,
          onPressed: () async {
            
        setState(() {
          spin = true;
        });

        try{
                
        var auth = FirebaseAuth.instance;
        var a = await auth.signInWithEmailAndPassword(
            email: email, password: password);
        if (a != null) {
          setState(() {
            spin = false;
          });
          Toast.show("Successfully Signed In!", context, duration: 3, gravity:  Toast.BOTTOM,backgroundColor: Colors.green);
          Navigator.pushNamed(context, "dashboard");
        }
        }
        catch(e)
        {
          Toast.show("Wrong Credentials!!", context, duration: 3, gravity:  Toast.BOTTOM,backgroundColor: Colors.green);
        }
        
       
                },
          child: Text('ENTER', style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            color: Color.fromRGBO(41, 187, 255, 1))
          )
        ),
        
                ]
              )
      )
    );
  }
}