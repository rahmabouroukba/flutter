import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:rahmabourokba/home.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _userTextController = TextEditingController();
  TextEditingController _poidsTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            key: _formKey,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Center(
                      child: Text(
                        'Fitness Time',
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: [
                          SizedBox(height: 15),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[600]?.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Ce champ ne peut pas être vide";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _userTextController =
                                    value! as TextEditingController;
                              },
                              controller: _userTextController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: ' Nom et Prénom',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[600]?.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Ce champ ne peut pas être vide";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _poidsTextController =
                                    value! as TextEditingController;
                              },
                              controller: _poidsTextController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: 'Poids',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[600]?.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Ce champ ne peut pas être vide";
                                }
                                if (!EmailValidator.validate(value)) {
                                  return "Veuillez entrer une adresse e-mail valide";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _emailTextController =
                                    value! as TextEditingController;
                              },
                              controller: _emailTextController,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: 'Adresse Email',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                ),
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                            ),
                          ),
                          SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[600]?.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
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
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: 'Mot de Passe',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[600]?.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                border: InputBorder.none,
                                hintText: 'Numéro de Téléphone',
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Text(
                                  "si vous avez déja un compte",
                                  style: TextStyle(color: Colors.white),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(builder: (context) {
                                      return Home();
                                    }));
                                  },
                                  child: Text(
                                    "Cliquer ici",
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 71, 19, 49),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        try {
                                          UserCredential userCredential =
                                              await auth
                                                  .createUserWithEmailAndPassword(
                                            email: _emailTextController.text,
                                            password:
                                                _passwordTextController.text,
                                          );

                                          if (!userCredential
                                              .user!.emailVerified) {
                                            await userCredential.user!
                                                .sendEmailVerification();
                                          }

                                          firestore.collection('user').add({
                                            'email': _emailTextController.text,
                                            'password':
                                                _passwordTextController.text,
                                            'uid': userCredential.user!.uid,
                                            'user': _userTextController.text,
                                            'poids': _poidsTextController.text,
                                          });

                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Home()));
                                        } on FirebaseAuthException catch (e) {
                                          if (e.code == 'weak-password') {
                                            print(
                                                'The password provided is too weak.');
                                          } else if (e.code ==
                                              'email-already-in-use') {
                                            print(
                                                'The account already exists for that email.');
                                          } else {
                                            print(e);
                                          }
                                        } catch (e) {
                                          print(e);
                                        }
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: Text(
                                        "S'inscrire",
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
