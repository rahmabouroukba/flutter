import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rahmabourokba/drawerlist.dart';
import 'package:rahmabourokba/my_drawer_head.dart';

class Reclmation extends StatefulWidget {
  @override
  _ReclmationState createState() => _ReclmationState();
}

class _ReclmationState extends State<Reclmation> {
  final _formKey = GlobalKey<FormState>();

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  TextEditingController _nomTextController = TextEditingController();
  TextEditingController _cinTextController = TextEditingController();
  TextEditingController _referenceTextController = TextEditingController();
  TextEditingController _activiteTextController = TextEditingController();
  TextEditingController _nrueTextController = TextEditingController();
  TextEditingController _ntelTextController = TextEditingController();
  TextEditingController _dateTextController = TextEditingController();
  TextEditingController _faxTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _redigerTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

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
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                            color: Colors.blue,
                          ),
                          hintText: "Nom&Prénom",
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
                            Icons.lock,
                            color: Colors.blue,
                          ),
                          hintText: "CIN",
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
                          _cinTextController = value! as TextEditingController;
                        },
                        controller: _cinTextController,
                        keyboardType: TextInputType.number,
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
                            Icons.numbers,
                            color: Colors.blue,
                          ),
                          hintText: "Référence",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champ ne peut pas être vide";
                          }
                          if (value.length != 9) {
                            return "La référence doit contenir exactement 9 chiffres";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _referenceTextController =
                              value! as TextEditingController;
                        },
                        controller: _referenceTextController,
                        keyboardType: TextInputType.number,
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
                            Icons.local_activity,
                            color: Colors.blue,
                          ),
                          hintText: "ACTIVITE",
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
                          _activiteTextController =
                              value! as TextEditingController;
                        },
                        controller: _activiteTextController,
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
                            Icons.home,
                            color: Colors.blue,
                          ),
                          hintText: "adresse ",
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
                          _nrueTextController = value! as TextEditingController;
                        },
                        controller: _nrueTextController,
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
                            Icons.phone,
                            color: Colors.blue,
                          ),
                          hintText: "N° TELEPHONE",
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
                          _ntelTextController = value! as TextEditingController;
                        },
                        controller: _ntelTextController,
                        keyboardType: TextInputType.number,
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
                            Icons.time_to_leave,
                            color: Colors.blue,
                          ),
                          hintText: "Date",
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
                          _dateTextController = value! as TextEditingController;
                        },
                        controller: _dateTextController,
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
                            Icons.print,
                            color: Colors.blue,
                          ),
                          hintText: "FAX",
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
                          _faxTextController = value! as TextEditingController;
                        },
                        controller: _faxTextController,
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
                                        color:
                                            Color.fromARGB(255, 58, 148, 201),
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
                                        color:
                                            Color.fromARGB(255, 58, 148, 201),
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
                            Icons.telegram,
                            color: Colors.blue,
                          ),
                          hintText: "Rédiger votre demande",
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champ ne peut pas être vide";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _redigerTextController =
                              value! as TextEditingController;
                        },
                        controller: _redigerTextController,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (_emailTextController.text.isEmpty ||
                                _passwordTextController.text.isEmpty ||
                                _nomTextController.text.isEmpty ||
                                _cinTextController.text.isEmpty ||
                                _referenceTextController.text.isEmpty ||
                                _activiteTextController.text.isEmpty ||
                                _nrueTextController.text.isEmpty ||
                                _ntelTextController.text.isEmpty ||
                                _dateTextController.text.isEmpty ||
                                _faxTextController.text.isEmpty ||
                                _redigerTextController.text.isEmpty ||
                                selectedService!.isEmpty) {
                              String emptyFieldName = "";
                              if (_emailTextController.text.isEmpty) {
                                emptyFieldName = "Email";
                              } else if (_passwordTextController.text.isEmpty) {
                                emptyFieldName = "Password";
                              } else if (_nomTextController.text.isEmpty) {
                                emptyFieldName = "Nom";
                              } else if (_referenceTextController
                                  .text.isEmpty) {
                                emptyFieldName = "reference";
                              } else if (_cinTextController.text.isEmpty) {
                                emptyFieldName = "cin";
                              } else if (_activiteTextController.text.isEmpty) {
                                emptyFieldName = "activite";
                              } else if (_nrueTextController.text.isEmpty) {
                                emptyFieldName = "adresse";
                              } else if (_ntelTextController.text.isEmpty) {
                                emptyFieldName = "ntel";
                              } else if (_faxTextController.text.isEmpty) {
                                emptyFieldName = "fax";
                              } else if (selectedService!.isEmpty) {
                                emptyFieldName = "type client";
                              } else if (selectedPrestationTechnique!.isEmpty) {
                                emptyFieldName = "prestation_technique";
                              } else if (selectedPrestationcommercial!
                                  .isEmpty) {
                                emptyFieldName = "prestation_commercial";
                              }

                              if (emptyFieldName.isNotEmpty) {
                                String errorMessage =
                                    "Veuillez remplir tous les champs.";
                                {
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
                                          color:
                                              Color.fromARGB(255, 221, 44, 197),
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
                                await firestore.collection('reclamation').add({
                                  'email': _emailTextController.text,
                                  'password': _passwordTextController.text,
                                  'uid': userCredential.user!.uid,
                                  'nom': _nomTextController.text,
                                  'cin': _cinTextController.text,
                                  'reference': _referenceTextController.text,
                                  'activite': _activiteTextController.text,
                                  'nrue': _nrueTextController.text,
                                  'district': _district,
                                  'ntel': _ntelTextController.text,
                                  'date': _dateTextController.text,
                                  'fax': _faxTextController.text,
                                  'rediger': _redigerTextController.text,
                                  'type_client': selectedService,
                                  'prestation_technique':
                                      selectedPrestationTechnique,
                                  'prestation_commercial':
                                      selectedPrestationcommercial,
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
                                          color:
                                              Color.fromARGB(255, 221, 44, 197),
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
                      ),
                    ),
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
