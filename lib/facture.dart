import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:rahmabourokba/drawerlist.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rahmabourokba/my_drawer_head.dart';
import 'package:rahmabourokba/page2.dart';

class Facture extends StatefulWidget {
  @override
  _FactureState createState() => _FactureState();
}

class _FactureState extends State<Facture> {
  String? selectedDistrict;

  final List<String> districtOptions = [
    'Tunis',
    'Ariana',
    'Ezzahra',
    'El Kram',
    'Le Bardo',
    'Manouba',
    'Mourouj',
    'Bizerte',
    'Nabeul',
    'Béja',
    'Jendouba',
    'Le Kef',
    'Siliana',
    'Sousse',
    'Monastir',
    'Moknine',
    'Mahdia',
    'Kairouan',
    'Kasserine',
    'Sidi Bouzid',
    'Gafsa',
    'Sfax',
    'Kébili',
    'Gabès',
    'Zarzis',
    'Médenine',
    'Djerba',
    'Tataouine',
    'Tozeur',
    'Menzel Bourguiba',
    'Zaghouan',
    'Mahres',
    'Métlaoui',
    'El Menzah',
    'El Jem',
    'Ben Guerdane',
    'Hammamet',
    'Msaken',
  ];
  final _formKey = GlobalKey<FormState>();
  // late String _nom;
  // late String _cin;
  String? _reference;
  // late String _district;

  // late String _password;
  // void _submitForm() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //     await FirebaseFirestore.instance.collection('facture').add({
  //       'nom': _nom,
  //       'cin': _cin,
  //       'reference': _reference,
  //       'district': _district,
  //       'mot de passe': _password,
  //     });
  //   }
  // }

  @override
  void initState() {
    getUserData();
    super.initState();
  }

//! edheya yaaml read mn db firestore
  User? user = FirebaseAuth.instance.currentUser;
  var userData;
  Future<DocumentSnapshot> getUserData() async {
    var result = await FirebaseFirestore.instance
        .collection('user')
        .doc(user?.uid)
        .get();
    setState(() {
      userData = result;
    });
    return result;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 133, 187, 231),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
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
          child: Column(
            children: [
              Image.asset(
                "images/fact.png",
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Facture",
                        style: TextStyle(
                            fontSize: 60,
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Niticia Text',
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Color.fromARGB(255, 107, 49, 102),
                                blurRadius: 9,
                                offset: (Offset(3, 3)),
                              )
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(40),
                            //   child: FormBuilderTextField(
                            //     name: 'nom',
                            //     decoration: InputDecoration(
                            //       prefixIcon:
                            //           Icon(Icons.person, color: Colors.blue),
                            //       hintText: "Nom&Prénom",
                            //       hintStyle: TextStyle(color: Colors.grey),
                            //       border: OutlineInputBorder(
                            //         borderSide: BorderSide(color: Colors.white),
                            //         borderRadius: BorderRadius.circular(40),
                            //       ),
                            //       filled: true,
                            //       fillColor: Colors.white,
                            //     ),
                            //     validator: FormBuilderValidators.compose([
                            //       FormBuilderValidators.required(
                            //         errorText: 'Veuillez entrer un nom',
                            //       ),
                            //     ]),
                            //     onSaved: (value) {
                            //       _nom = value!;
                            //     },
                            //   ),
                            // ),
                            // Container(
                            //   margin: EdgeInsets.only(
                            //       left: 40, right: 40, bottom: 40),
                            //   child: FormBuilderTextField(
                            //     name: 'cin',
                            //     decoration: InputDecoration(
                            //       prefixIcon: Icon(
                            //         Icons.lock,
                            //         color: Colors.blue,
                            //       ),
                            //       hintText: "CIN",
                            //       hintStyle: TextStyle(color: Colors.grey),
                            //       border: OutlineInputBorder(
                            //         borderSide: BorderSide(color: Colors.white),
                            //         borderRadius: BorderRadius.circular(40),
                            //       ),
                            //       filled: true,
                            //       fillColor: Colors.white,
                            //     ),
                            //     validator: FormBuilderValidators.compose([
                            //       FormBuilderValidators.required(
                            //         errorText: 'Veuillez entrer un CIN',
                            //       ),
                            //       (value) {
                            //         if (value!.length != 6 && value.length != 8) {
                            //           return 'Le CIN doit comporter 6 ou 8 chiffres';
                            //         }
                            //         return null;
                            //       },
                            //     ]),
                            //     onSaved: (value) {
                            //       _cin = value!;
                            //     },
                            //     keyboardType: TextInputType.number,
                            //   ),
                            // ),
                            // Container(
                            //   margin: EdgeInsets.only(
                            //       left: 40, right: 40, bottom: 40),
                            //   child: FormBuilderTextField(
                            //     name:
                            //         'password', // Vous pouvez définir n'importe quel nom d'attribut

                            //     obscureText: true,
                            //     decoration: InputDecoration(
                            //       prefixIcon:
                            //           Icon(Icons.lock, color: Colors.blue),
                            //       hintText: "Mot de passe",
                            //       border: OutlineInputBorder(
                            //         borderSide: BorderSide(color: Colors.white),
                            //         borderRadius: BorderRadius.circular(40),
                            //       ),
                            //       filled: true,
                            //       fillColor: Colors.white,
                            //     ),
                            //     validator: FormBuilderValidators.compose([
                            //       FormBuilderValidators.required(
                            //         errorText:
                            //             'Veuillez entrer votre mot de passe',
                            //       ),
                            //       (value) {
                            //         if (value != null && value.length != 6) {
                            //           return 'La mot de passe doit être composée de 6 chiffres';
                            //         }
                            //         return null;
                            //       },
                            //     ]),
                            //     onSaved: (value) {
                            //       _password = value!;
                            //     },
                            //     keyboardType: TextInputType.number,
                            //   ),
                            // ),
                            // Container(
                            //   margin: EdgeInsets.only(
                            //       left: 40, right: 40, bottom: 40),
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.circular(40),
                            //     boxShadow: [
                            //       BoxShadow(
                            //           color: Color.fromARGB(255, 58, 148, 201),
                            //           blurRadius: 20,
                            //           offset: Offset(0, 10)),
                            //     ],
                            //   ),
                            //   child: FormBuilderDropdown(
                            //     name: 'district',
                            //     decoration: InputDecoration(
                            //       hintText: "District",
                            //       hintStyle: TextStyle(color: Colors.grey),
                            //       prefixIcon: Icon(
                            //         Icons.villa,
                            //         color: Colors.blue,
                            //       ),
                            //       border: InputBorder.none,
                            //     ),
                            //     items: districtOptions
                            //         .map((district) => DropdownMenuItem(
                            //               value: district,
                            //               child: Text(district),
                            //             ))
                            //         .toList(),
                            //     initialValue: districtOptions.first,
                            //     onChanged: (value) {
                            //       setState(() {
                            //         _district = value!;
                            //       });
                            //     },
                            //     validator: FormBuilderValidators.compose([
                            //       FormBuilderValidators.required(
                            //         errorText:
                            //             'Veuillez sélectionner un district',
                            //       ),
                            //     ]),
                            //   ),
                            // ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 40, right: 40, bottom: 40),
                            child: FormBuilderTextField(
                              maxLength: 8,
                              name: 'reference',
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.blue,
                                ),
                                hintText: "Référence",
                                hintStyle: TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                  errorText: 'Veuillez entrer une référence',
                                ),
                                (value) {
                                  if (value != null && value.length != 9) {
                                    return 'La référence doit être composée de 9 chiffres';
                                  }
                                  return null;
                                },
                              ]),
                              onChanged: (value) {
                                _reference = value!;
                              },
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          InkWell(
                            child: Text('test database'),
                            onTap: () async {
                              var name = userData["nom&prenom"];
                              var addresse = userData["addresse"];
                              var cin = userData["cin"];
                              var district = userData["district"];
                              var email = userData["email"];
                              var id = userData["id"];
                              var password = userData["password"];
                              var phoneNumber = userData["phoneNumber"];
                              var refUser = userData["ref"];
                              print(
                                  '$name\n$addresse\n$cin\n$district\n$email\n$id\n$password\n$phoneNumber\n$refUser ');
                            },
                          ),
                          Container(
                            child: ElevatedButton(
                              onPressed: () async {
                                // var name = userData["nom&prenom"];
                                // var addresse = userData["addresse"];
                                // var cin = userData["cin"];
                                // var district = userData["district"];
                                // var email = userData["email"];
                                var id = userData["id"];
                                // var password = userData["password"];
                                // var phoneNumber = userData["phoneNumber"];
                                var refUser = userData["ref"];

                                // if (_formKey.currentState!.validate()) {
                                //   _formKey.currentState!.save();
                                await FirebaseFirestore.instance
                                    .collection('facture')
                                    .doc(id)
                                    .collection('tous les facteurs')
                                    .doc()
                                    .set({
                                  // 'name': name,
                                  // 'addresse': addresse,
                                  // 'cin': cin,
                                  // 'district': district,
                                  // 'email': email,
                                  'id': id,
                                  // 'password': password,
                                  // 'phoneNumber': phoneNumber,
                                  // 'refUser': refUser,
                                  'refFacture': _reference
                                });
                                // await FirebaseFirestore.instance
                                //     .collection('user')
                                //     .doc(user!.uid)
                                //     .collection('facture')
                                //     .doc()
                                //     .set({
                                //   'name': userData["nom&prenom"],
                                //   'addresse': userData["addresse"],
                                //   'cin': userData["cin"],
                                //   'district': userData["district"],
                                //   'email': userData["email"],
                                //   'id': userData["id"],
                                //   'password': userData["password"],
                                //   'phoneNumber': userData["phoneNumber"],
                                //   'refUser': userData["ref"],
                                //   'refFacture': _reference
                                // });
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => Page2(),
                                //   ),
                                // );
                              },
                              child: Text(
                                "Suivant",
                                style: TextStyle(fontSize: 20),
                              ),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  elevation: 9,
                                  shadowColor: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
