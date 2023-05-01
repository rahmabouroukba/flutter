import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rahmabourokba/drawerlist.dart';
import 'package:rahmabourokba/my_drawer_head.dart';

class Reclamationn extends StatefulWidget {
  @override
  _ReclamationnState createState() => _ReclamationnState();
}

class _ReclamationnState extends State<Reclamationn> {
  final _formKey = GlobalKey<FormState>();

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  TextEditingController _nomTextController = TextEditingController();

  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 182, 205, 224),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 133, 187, 231),
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.only(left: 15, top: 200),
            child: Form(
              key: _formKey,
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(40),
                      child: TextFormField(
                        controller: _nomTextController,
                        decoration: InputDecoration(
                          labelText: 'Nom',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veuillez entrer votre nom';
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 58, 148, 201),
                              blurRadius: 20,
                              offset: Offset(0, 10)),
                        ],
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.blue,
                          ),
                          hintText: "EMAIL",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champ ne peut pas être vide";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _emailTextController =
                              value! as TextEditingController;
                        },
                        controller: _emailTextController,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromARGB(255, 58, 148, 201),
                              blurRadius: 20,
                              offset: Offset(0, 10)),
                        ],
                      ),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champ ne peut pas être vide";
                          }
                          if (value.length < 6) {
                            return 'Le mot de passe doit contenir au moins 6 caractères';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _passwordTextController =
                              value! as TextEditingController;
                        },
                        obscureText: true,
                        controller: _passwordTextController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 20),
                          border: InputBorder.none,
                          hintText: 'Mot de Passe',
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(20),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              if (_emailTextController.text.isEmpty ||
                                  _passwordTextController.text.isEmpty ||
                                  _nomTextController.text.isEmpty) {
                                String emptyFieldName = "";
                                if (_emailTextController.text.isEmpty) {
                                  emptyFieldName = "Email";
                                } else if (_passwordTextController
                                    .text.isEmpty) {
                                  emptyFieldName = "Password";
                                } else if (_nomTextController.text.isEmpty) {
                                  emptyFieldName = "Nom";
                                }

                                if (emptyFieldName.isNotEmpty) {
                                  String errorMessage =
                                      "Veuillez remplir tous les champs.";
                                  if (emptyFieldName == "password") {
                                    // Assuming you have a variable named `password` that holds the password value
                                    var password;
                                    if (password.length < 6) {
                                      errorMessage +=
                                          " Mot de passe incorrect. Le mot de passe doit contenir au moins 6 caractères.";
                                    }
                                  } else {
                                    errorMessage +=
                                        " Champ manquant : $emptyFieldName";
                                  }

                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          errorMessage,
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 221, 44, 197),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('OK'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                }
                              } else {
                                try {
                                  UserCredential userCredential =
                                      await auth.createUserWithEmailAndPassword(
                                    email: _emailTextController.text,
                                    password: _passwordTextController.text,
                                  );

                                  if (!userCredential.user!.emailVerified) {
                                    await userCredential.user!
                                        .sendEmailVerification();
                                  }

                                  await firestore
                                      .collection('demandes')
                                      .doc('autres demande')
                                      .collection('client residentiel')
                                      .add({
                                    'email': _emailTextController.text,
                                    'password': _passwordTextController.text,
                                    'uid': userCredential.user!.uid,
                                    'nom': _nomTextController.text,
                                  });

                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          "Veuillez patienter pour répondre à votre demande, nous la traiterons dans les plus brefs délais.",
                                          style: TextStyle(
                                            fontSize: 17,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 221, 44, 197),
                                          ),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: Text('Merci'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                } on FirebaseAuthException {
                                  // Handle FirebaseAuthException
                                } catch (e) {
                                  print(e);
                                }
                              }
                            }
                          },
                          child: Text(
                            "Envoyer",
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7),
                            ),
                            elevation: 30,
                            shadowColor: Color.fromARGB(255, 221, 44, 197),
                            textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
