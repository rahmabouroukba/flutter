import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:rahmabourokba/home.dart';

// ignore: camel_case_types, must_be_immutable
class ra extends StatelessWidget {
  String name = "";
  String email = "";
  String mdp = "";
  String cin = "";
  String cmdp = "";
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();

  ra({super.key});
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
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: "nom&prénom",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 30),
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
                        } else if (!EmailValidator.validate(value)) {
                          return 'Veuillez entrer une adresse email valide';
                        } else {
                          return null;
                        }
                        // ignore: dead_code, unused_label
                        onSaved:
                        (val) {
                          email = val;
                        };
                      }),
                  SizedBox(height: 20),
                  TextFormField(
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
                    onSaved: (vaue) {
                      mdp = vaue!;
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) {
                            return Home();
                          }));
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
