import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Inscription extends StatefulWidget {
  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  String name = "";

  String email = "";

  String mdp = "";

  String cin = "";
  String adr = "";

  String cmdp = "";
  String tel = "";

  FirebaseAuth auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/89.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 70),
                  Text(
                    'Inscription ',
                    style: TextStyle(
                        color: Color.fromARGB(255, 204, 43, 191),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        shadows: [
                          Shadow(
                              color: Color.fromARGB(255, 197, 118, 187),
                              blurRadius: 6,
                              offset: Offset(3, 3))
                        ]),
                  ),
                  SizedBox(height: 40),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Nom & Prénom",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Entrez votre nom";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        name = val!;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "CIN",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "entrez votre mot de passe";
                        }
                        if (value.length == 8) {
                          return "entrez 8 caracteres au min";
                        }
                        return null;
                      },
                      onSaved: (vaue) {
                        cin = vaue!;
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        hintText: "Télephonne",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "entrez votre numero télephone";
                        }
                        if (value.length == 8) {
                          return "entrez 8 caracteres au min";
                        }
                        return null;
                      },
                      onSaved: (vaue) {
                        tel = vaue!;
                      },
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ce champ ne peut pas être vide';
                          } else {
                            return null;
                          }
                          // ignore: dead_code
                          (val) {
                            email = val;
                          };
                        }),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "mot de passe",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "entrez votre mot de passe";
                        }
                        if (value.length < 8) {
                          return "entrez 8 caracteres au min";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        hintText: "confirmer le mot de passe",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return "Les mots de passe ne correspondent pas";
                        }
                        return null;
                      },
                      onSaved: (vae) {
                        cmdp = vae!;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.home),
                        hintText: "votre adresse",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "entrez votre adresse";
                        }

                        return null;
                      },
                      onSaved: (vae) {
                        adr = vae!;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          await auth.createUserWithEmailAndPassword(
                              email: _emailController.text,
                              password: _passwordController.text);
                          Navigator.of(context).pushNamed("Home");
                        }
                      },
                      child: Text(
                        "S’inscrire",
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 45, 14, 182),
                        elevation: 9,
                        shadowColor: Color.fromARGB(
                          255,
                          221,
                          44,
                          197,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Déja un compte?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        InkWell(
                          child: GestureDetector(
                            child: Text(
                              " Connexion",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color.fromARGB(
                                  255,
                                  221,
                                  44,
                                  197,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).pushNamed("connection");
                            },
                          ),
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
    );
  }
}
