import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rahmabourokba/home.dart';
import 'package:rahmabourokba/rah1.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    Timer(
        Duration(
          seconds: 2,
        ), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => rah1()));
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
          //Navigator.push(
          //  context, MaterialPageRoute(builder: (context) => MapScreen()));
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("ya rahma fil page edheyya 7ot logo app "),
      ),
    );
  }
}
