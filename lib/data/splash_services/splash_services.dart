


import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thewall/view/auth/login_screen.dart';
import 'package:thewall/view/home/home_screen.dart';

class SplashServices {

  final _auth = FirebaseAuth.instance;

   void splashTime(BuildContext context) async {
     Timer(Duration(seconds: 3) , () {
       Navigator.push(context, MaterialPageRoute(builder: (context) => _auth.currentUser != null ? HomeSceen() : LoginScreen()));
     });
  }

}