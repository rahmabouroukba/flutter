import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Red extends StatefulWidget {
  @override
  _RedState createState() => _RedState();
}

class _RedState extends State<Red> {
  final _formKey = GlobalKey<FormState>();

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  TextEditingController _nomTextController = TextEditingController();

  TextEditingController _emailTextController = TextEditingController();

  TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var selectedService;
    var selectedPrestationTechnique;
    var selectedPrestationcommercial;
    var type1List;
    var type2List;
    return Scaffold(
        body: Container(
            child: SingleChildScrollView(
                child: Form(
      key: _formKey,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: EdgeInsets.all(40),
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
                Icons.person,
                color: Color.fromARGB(255, 133, 187, 231),
              ),
              hintText: "Nom&Prénom",
              border: InputBorder.none,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Ce champ ne peut pas être vide";
              }
              return null;
            },
            onSaved: (value) {
              _nomTextController = value! as TextEditingController;
            },
            controller: _nomTextController,
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
                color: Color.fromARGB(255, 133, 187, 231),
              ),
              hintText: "EMAIL",
              border: InputBorder.none,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Ce champ ne peut pas être vide";
              }
              return null;
            },
            onSaved: (value) {
              _emailTextController = value! as TextEditingController;
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
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock,
                color: Color.fromARGB(255, 133, 187, 231),
              ),
              hintText: "mot de passe",
              border: InputBorder.none,
            ),
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
              _passwordTextController = value! as TextEditingController;
            },
            obscureText: true,
            controller: _passwordTextController,
          ),
        ),
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("Client Résidentiel",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18)),
                    value: "type1",
                    groupValue: selectedService,
                    activeColor: Colors.white,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedService = newValue!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: Text("Client Industriel",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18)),
                    value: "type2",
                    groupValue: selectedService,
                    activeColor: Colors.white,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedService = newValue!;
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            if (selectedService == "type1")
              Column(
                children: [
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
                    child: DropdownButton<String>(
                      value: selectedPrestationTechnique,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedPrestationTechnique = newValue!;
                        });
                      },
                      items: type1List.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text("Sélectionnez votre Réclamation"),
                      isExpanded: true,
                    ),
                  ),
                ],
              ),
            if (selectedService == "type2")
              Column(
                children: [
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
                    child: DropdownButton<String>(
                      value: selectedPrestationcommercial,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedPrestationcommercial = newValue!;
                        });
                      },
                      items: type2List.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      hint: Text("Sélectionnez le service"),
                      isExpanded: true,
                    ),
                  ),
                ],
              ),
          ],
        ),
        Container(
          margin: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                try {
                  UserCredential userCredential =
                      await auth.createUserWithEmailAndPassword(
                    email: _emailTextController.text,
                    password: _passwordTextController.text,
                  );

                  if (!userCredential.user!.emailVerified) {
                    await userCredential.user!.sendEmailVerification();
                  }

                  firestore.collection('user').add({
                    'email': _emailTextController.text,
                    'password': _passwordTextController.text,
                    'uid': userCredential.user!.uid,
                    'nom': _nomTextController.text,
                  });
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'weak-password') {
                    print('The password provided is too weak.');
                  } else if (e.code == 'email-already-in-use') {
                    print('The account already exists for that email.');
                  } else {
                    print(e);
                  }
                } catch (e) {
                  print(e);
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
                    borderRadius: BorderRadius.circular(7)),
                elevation: 30,
                shadowColor: Color.fromARGB(255, 221, 44, 197),
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
          ),
        ),
      ]),
    ))));
  }
}
