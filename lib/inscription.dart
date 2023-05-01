import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Innscription extends StatefulWidget {
  @override
  _InnscriptionState createState() => _InnscriptionState();
}

class _InnscriptionState extends State<Innscription> {
  String name = "";

  String email = "";

  String mdp = "";

  String cin = "";

  String cmdp = "";
  FirebaseAuth auth = FirebaseAuth.instance;

  final _formKey = GlobalKey<FormState>();

  TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 162, 212, 241),
                  Color.fromARGB(255, 96, 164, 219),
                ],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 16,
            child: Container(
              decoration: BoxDecoration(),
              child: Image.asset(
                'images/ins.png',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: SingleChildScrollView(
              child: Form(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 300),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(width: 2, color: Colors.blue),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: "Nom et prénom",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "entrez votre nom";
                        }
                        return null;
                      },
                      onSaved: (val) {
                        name = val!;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "CIN",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 30),
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
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: "Télephonne",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 30),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 30),
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
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "mot de passe",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 30),
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
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: "confirmer le mot de passe",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 30),
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
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.home),
                      hintText: "votre adresse",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 30),
                      ),
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
              )),
            ),
          )
        ],
      ),
    );
  }
}
