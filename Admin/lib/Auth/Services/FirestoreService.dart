import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:infirmary/main.dart';



class DatabaseMethods{
  getStream(String path)async {
    return await Firestore.instance
        .collection(path).get();
  }

  addData(String collection, Map<String, dynamic> Data){

    Firestore.instance.collection(collection)
        .add(Data).catchError((e){
      print(e.toString());
    });
  }
}