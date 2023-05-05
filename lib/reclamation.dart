import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:rahmabourokba/drawerlist.dart';
import 'package:rahmabourokba/my_drawer_head.dart';

class Reclamation extends StatefulWidget {
  @override
  _ReclamationState createState() => _ReclamationState();
}

class _ReclamationState extends State<Reclamation> {
  final _formKey = GlobalKey<FormState>();

  final firestore = FirebaseFirestore.instance;

  late String _nom;
  late String _cin;
  late String _reference;
  late String _adr;
  late String _ntel;
  late String _activite;
  late String _rediger;
  late String _fax;
  late String _date;

  // void _submitForm() async {
  //   if (_formKey.currentState!.validate()) {
  //     _formKey.currentState!.save();
  //     await FirebaseFirestore.instance.collection('reclamation').add({
  //       'nom': _nom,
  //       'cin': _cin,
  //       'reference': _reference,
  //       'district': _district,
  //       'mot_de_passe': passwordController.text,
  //       'adresse': _adr,
  //       'email': emailController.text,
  //       'numero_telephone': _ntel,
  //       'activite': _activite,
  //       'rediger': _rediger,
  //       'date': _date,
  //       'fax': _fax,
  //       'prestation technique': selectedPrestationTechnique,
  //       'prestation commercial': selectedPrestationcommercial,
  //       'service': selectedService,
  //     });
  //   }
  // }

  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  String? selectedreclamation;
  List<String> type1List = [
    'Réclamation  sur facture',
    'Relance pour étude ',
    'Relance pour  exécution',
    'Reclamation vérification de tension',
    'Reclamation  vérification de pression',
    ' Reclamation vérification de disjoncter ',
    'Reclamation  vérification de détenteur ',
    'Reclamation  vérification de copteur',
    'Reclamation  Correction adresse ',
  ];
  List<String> type2List = [
    "Vérification de comptage",
    "Constat dégât matériel",
    "Réclamation sur facture",
    "Relance approbation dossier technique",
    "Facture définitive des travaux",
    "Rétablissement de l'énergie"
  ];
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

  String? selectedPrestationTechnique;
  String? selectedPrestationcommercial;
  late String _district;

  String? selectedService;
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
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 133, 187, 231),
                      Color.fromARGB(255, 133, 187, 231),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: MediaQuery.of(context).size.width / 5 - 30,
                child: Image.asset(
                  "images/recc.png",
                  width: 100,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60, bottom: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Colors.white)]),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Reclamation",
                      hintStyle: TextStyle(
                          fontSize: 40,
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
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, top: 200),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //   margin: EdgeInsets.all(40),
                  //   child: FormBuilderTextField(
                  //     name: 'nom',
                  //     decoration: InputDecoration(
                  //       prefixIcon: Icon(Icons.person, color: Colors.blue),
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
                  //   margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
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
                  //   margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                  //   child: FormBuilderTextField(
                  //     name: 'numero telephone',
                  //     decoration: InputDecoration(
                  //       prefixIcon: Icon(Icons.phone, color: Colors.blue),
                  //       hintText: "numero telephone",
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
                  //         errorText: 'Veuillez entrer votre  numero telephone',
                  //       ),
                  //       (value) {
                  //         if (value!.length != 8) {
                  //           return 'numero telephone doit comporter 8 chiffres';
                  //         }
                  //         return null;
                  //       },
                  //     ]),
                  //     onSaved: (value) {
                  //       _ntel = value!;
                  //     },
                  //     keyboardType: TextInputType.number,
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                  //   child: FormBuilderTextField(
                  //     name: 'reference',
                  //     decoration: InputDecoration(
                  //       prefixIcon: Icon(
                  //         Icons.lock,
                  //         color: Colors.blue,
                  //       ),
                  //       hintText: "Référence",
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
                  //         errorText: 'Veuillez entrer une référence',
                  //       ),
                  //       (value) {
                  //         if (value != null && value.length != 9) {
                  //           return 'La référence doit être composée de 9 chiffres';
                  //         }
                  //         return null;
                  //       },
                  //     ]),
                  //     onSaved: (value) {
                  //       _reference = value!;
                  //     },
                  //     keyboardType: TextInputType.number,
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                    child: FormBuilderTextField(
                      name: 'activite',
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.blue),
                        hintText: "activite",
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
                          errorText: 'Veuillez entrer votre activite',
                        ),
                      ]),
                      onChanged: (value) {
                        _activite = value!;
                      },
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
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
                  //         errorText: 'Veuillez sélectionner un district',
                  //       ),
                  //     ]),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                  //   child: FormBuilderTextField(
                  //     name: 'adresse',
                  //     decoration: InputDecoration(
                  //       prefixIcon: Icon(Icons.home, color: Colors.blue),
                  //       hintText: "adresse",
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
                  //         errorText: 'Veuillez entrer votre adresse',
                  //       ),
                  //     ]),
                  //     onSaved: (value) {
                  //       _adr = value!;
                  //     },
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                    child: FormBuilderTextField(
                      keyboardType: TextInputType.datetime,
                      name: 'date',
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.blue),
                        hintText: "date",
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
                          errorText: 'Veuillez entrer date',
                        ),
                      ]),
                      onChanged: (value) {
                        _date = value!;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                    child: FormBuilderTextField(
                      name: 'fax',
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.blue),
                        hintText: "fax",
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
                          errorText: 'Veuillez entrer votre fax',
                        ),
                      ]),
                      onChanged: (value) {
                        _fax = value!;
                      },
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                  //   child: FormBuilderTextField(
                  //     name: 'email', // You can set any attribute name you want
                  //     controller: emailController,
                  //     decoration: InputDecoration(
                  //       prefixIcon: Icon(
                  //         Icons.email,
                  //         color: Colors.blue,
                  //       ),
                  //       hintText: "Email",
                  //       border: OutlineInputBorder(
                  //         borderSide: BorderSide(color: Colors.white),
                  //         borderRadius: BorderRadius.circular(40),
                  //       ),
                  //       filled: true,
                  //       fillColor: Colors.white,
                  //     ),
                  //     validator: FormBuilderValidators.compose([
                  //       FormBuilderValidators.required(
                  //           errorText:
                  //               'Entrer votre Email'), // Add a required validator
                  //       FormBuilderValidators.email(
                  //           errorText:
                  //               'Please enter a valid email'), // Add an email format validator
                  //     ]),
                  //     keyboardType: TextInputType.emailAddress,
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                  //   child: FormBuilderTextField(
                  //     name:
                  //         'password', // Vous pouvez définir n'importe quel nom d'attribut
                  //     controller: passwordController,
                  //     obscureText: true,
                  //     decoration: InputDecoration(
                  //       prefixIcon: Icon(Icons.lock, color: Colors.blue),
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
                  //         errorText: 'Veuillez entrer votre mot de passe',
                  //       ),
                  //       (value) {
                  //         if (value != null && value.length != 6) {
                  //           return 'La mot de passe  doit être composée de 6 chiffres';
                  //         }
                  //         return null;
                  //       },
                  //     ]),
                  //     keyboardType: TextInputType.number,
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(255, 58, 148, 201),
                            blurRadius: 20,
                            offset: Offset(0, 10)),
                      ],
                    ),
                    child: FormBuilderDropdown(
                      name: 'district',
                      decoration: InputDecoration(
                        hintText: "District",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(
                          Icons.villa,
                          color: Colors.blue,
                        ),
                        border: InputBorder.none,
                      ),
                      items: districtOptions
                          .map((district) => DropdownMenuItem(
                                value: district,
                                child: Text(district),
                              ))
                          .toList(),
                      initialValue: districtOptions.first,
                      onChanged: (value) {
                        setState(() {
                          _district = value!;
                        });
                      },
                      validator: FormBuilderValidators.compose([
                        FormBuilderValidators.required(
                          errorText: 'Veuillez sélectionner un district',
                        ),
                      ]),
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
                              value: "client residentiel",
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
                              value: "client industriel",
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
                      if (selectedService == "client residentiel")
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 40, right: 40, bottom: 40),
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
                      if (selectedService == "client industriel")
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 40, right: 40, bottom: 40),
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
                    margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                    child: FormBuilderTextField(
                      name: 'rediger',
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Colors.blue),
                        hintText: "rediger",
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
                          errorText: 'description votre reclamation',
                        ),
                      ]),
                      onChanged: (value) {
                        _rediger = value!;
                      },
                    ),
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () async {
                        final User? user = FirebaseAuth.instance.currentUser;
                        final _uid = user!.uid;
                        if (selectedService == "client industriel") {
                          await FirebaseFirestore.instance
                              .collection('reclamation')
                              .doc('client industriel')
                              .collection('clients')
                              .doc(_uid)
                              .set({
                            'activité': _activite,
                            'district': _district,
                            'date': _date,
                            'fax': _fax,
                            'id': _uid,
                            'selectedPrestationTechnique':
                                selectedPrestationTechnique,
                            'type de client': 'client industriel',
                            'rediger': _rediger,
                          });œ
                        } else if (selectedService == "client residentiel") {
                          await FirebaseFirestore.instance
                              .collection('reclamation')
                              .doc('client residentiel')
                              .collection('clients')
                              .doc(_uid)
                              .set({
                            'activité': _activite,
                            'district': _district,
                            'id': _uid,
                            'date': _date,
                            'selectedPrestationTechnique':
                                selectedPrestationTechnique,
                            'fax': _fax,
                            'type de client': 'client residentiel',
                            'rediger': _rediger,
                          });
                        }
                        // if (_formKey.currentState!.validate()) {
                        //   _formKey.currentState!.save();
                        //   await auth.createUserWithEmailAndPassword(
                        //       email: emailController.text,
                        //       password: passwordController.text);
                        //   _submitForm();

                        // showDialog(
                        //   context: context,
                        //   builder: (BuildContext context) {
                        //     return AlertDialog(
                        //       title: Text(
                        //         "Veuillez patienter pour répondre à votre demande, nous la traiterons dans les plus brefs délais.",
                        //         style: TextStyle(
                        //           fontSize: 17,
                        //           fontStyle: FontStyle.italic,
                        //           fontWeight: FontWeight.bold,
                        //           color: Color.fromARGB(255, 221, 44, 197),
                        //         ),
                        //       ),
                        //       actions: <Widget>[
                        //         TextButton(
                        //           child: Text('Merci'),
                        //           onPressed: () {
                        //             Navigator.of(context).pop();
                        //           },
                        //         ),
                        //       ],
                        //     );
                        //   },
                      },
                      child: Text(
                        "Envoyer",
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        elevation: 9,
                        shadowColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
