import 'package:firebase_core/firebase_core.dart';
// ignore: unused_import
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:google_fonts/google_fonts.dart';
// ignore: unused_import
import 'package:rahmabourokba/a.dart';
// ignore: unused_import
import 'package:rahmabourokba/add.dart';
// ignore: unused_import
import 'package:rahmabourokba/bienvenu.dart';
import 'package:rahmabourokba/calcul.dart';
import 'package:rahmabourokba/connection.dart';

import 'package:rahmabourokba/gaz.dart';
import 'package:rahmabourokba/loginview.dart';
import 'package:rahmabourokba/demande.dart';
import 'package:rahmabourokba/facture.dart';
import 'package:rahmabourokba/rah1.dart';

import 'package:rahmabourokba/reclamation.dart';
import 'package:rahmabourokba/panne.dart';

import 'package:rahmabourokba/industriel.dart';
import 'package:rahmabourokba/residentiel.dart';
import 'package:rahmabourokba/facture2.dart';
import 'package:rahmabourokba/ins.dart';
import 'package:rahmabourokba/home.dart';

import 'package:rahmabourokba/loc.dart';
import 'package:rahmabourokba/rah.dart';

import 'package:rahmabourokba/search.dart';
import 'package:rahmabourokba/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: gazz(),
        routes: {
          "LoginView": (context) => connexion(),
          "Reclamation": (context) => Reclamation(),
          "loc": (context) => loc(),
          "insciption": (context) => Inscription(),
          "facture": (context) => Facture(),
          "Facture22": (context) => Facture22(),
          "panne": (context) => Panne(),
          "rep": (context) => Rep(),
          "rem": (context) => Rem(),
          "Home": (context) => Home(),
          "search": (context) => search(),
          "gaz": (context) => gazz(),
          // "rah": (context) => rah(),
          "loginview": (context) => LoginView(),
          "demande": (context) => Demande(),
        });
  }
}
