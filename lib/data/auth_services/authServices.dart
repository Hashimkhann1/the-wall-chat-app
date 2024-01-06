

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thewall/utils/utils.dart';
import 'package:thewall/view/auth/login_screen.dart';
import 'package:thewall/view/home/home_screen.dart';

import '../getx/loading_getx.dart';

class AuthService {

  final Utils utils = Utils();
  LoadingServices loadingServices = Get.put(LoadingServices());
  final _auth = FirebaseAuth.instance;

  void loginuser(BuildContext context ,String email , String password) async {
    loadingServices.setLoaidng();
    try{
      await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      ).then((value){
        utils.toastMessage("User Loged in Successfully");
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeSceen()));
        loadingServices.setLoaidng();
      }).onError((error, stackTrace){
        utils.toastMessage(error.toString());
        loadingServices.setLoaidng();
      });
    }on FirebaseAuthException catch(e){
      loadingServices.setLoaidng();
      utils.toastMessage(e.code.toString());
      print(e.code.toString());
    }
  }

  signUp(BuildContext context , String email , String password , String confrimPassword) async {
    loadingServices.setLoaidng();
    if(password != confrimPassword){
      utils.toastMessage("Confirm Password not matched");
    }else{
      try{
        _auth.createUserWithEmailAndPassword(
            email: email,
            password: password
        ).then((value){
          utils.toastMessage("User registered SSuccessfully");
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeSceen()));
          loadingServices.setLoaidng();
        }).onError((error, stackTrace) {
          utils.toastMessage(error.toString());
          loadingServices.setLoaidng();
        });
      }on FirebaseAuthException catch(e){
        utils.toastMessage(e.code.toString());
        loadingServices.setLoaidng();
      }
    }
  }

  void signOut(BuildContext context) async {
    try{
      await _auth.signOut().then((value) {
        utils.toastMessage("Logout Successfully");
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }).onError((error, stackTrace) {
        utils.toastMessage("Something went wrong ry again");
      });
    }on FirebaseAuthException catch(error){
      utils.toastMessage(error.code.toString());
    }
  }

}