import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:infirmary/Auth/GoogleSignIn.dart';
import 'package:infirmary/Auth/NotSAP.dart';
import 'package:infirmary/homeScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:infirmary/Auth/GoogleSignIn.dart';

import '../../User.dart';
import '../../main.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isEmailVerify = false;


  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      isEmailVerify = user.isEmailVerified;
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      user.sendEmailVerification();
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }



  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<FirebaseUser> signInWithGoogle(BuildContext context) async {
    GoogleSignIn _googleSignIn = new GoogleSignIn();

    GoogleSignInAccount googleSignInAccount =
    await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    AuthResult result = await _auth.signInWithCredential(credential);
    FirebaseUser userDetails = result.user;



    if (result == null) {
    } else {
      if(userDetails.email.contains("@stu.upes.ac.in")){
       user=userDetails;
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      }else{
        userDetails.delete();
       signOut(context);
       // _deleteCacheDir();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => NotSAP()));
      }
    }
  }
  Future<void> _deleteCacheDir() async {
    final cacheDir = await getTemporaryDirectory();

    if (cacheDir.existsSync()) {
      cacheDir.deleteSync(recursive: true);
    }
  }


  Future signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GoogleSignin()));
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
