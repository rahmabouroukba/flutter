import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rahmabourokba/drawerlist.dart';
import 'package:rahmabourokba/my_drawer_head.dart';
import 'sustomappbar.dart';

class Remm extends StatefulWidget {
  @override
  _RemmState createState() => _RemmState();
}

class _RemmState extends State<Remm> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  TextEditingController _adrTextController = TextEditingController();

  TextEditingController _nomTextController = TextEditingController();
  TextEditingController _cinTextController = TextEditingController();
  TextEditingController _referenceTextController = TextEditingController();
  TextEditingController _activiteTextController = TextEditingController();
  TextEditingController _ntelTextController = TextEditingController();
  TextEditingController _dateTextController = TextEditingController();
  TextEditingController _faxTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _redigerTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  List<String> type1List = [
    "1* Nouveau branchement",
    "2* Modification de puissance ou de débit ",
    "3* Vérification de compteur",
    "4* Remplacement ou déplacement de compteur ",
    "5* Modification sur réseaux electricité  ou Gaz",
    "6* Branchement provisoire ",
    "7* Mise en service"
  ];
  List<String> type2List = [
    "1* Relevé d'index(Absence à la reléve)",
    "2* Réalisation d'abonnement avec ou sans dépose compteur",
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
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: sustomAppBar(
          icon2: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
            ),
          ),
          iconmenu: IconButton(
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(
              Icons.menu,
            ),
          ),
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
          child: Column(children: <Widget>[
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              child: Form(
                key: _formKey,
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
                            color: Color.fromARGB(255, 133, 187, 231),
                          ),
                          hintText: "CIN",
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
                            Icons.work,
                            color: Color.fromARGB(255, 133, 187, 231),
                          ),
                          hintText: "Réference",
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Ce champ ne peut pas être vide";
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
                            color: Color.fromARGB(255, 133, 187, 231),
                          ),
                          hintText: "ACTIVITE",
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
                          _adrTextController = value! as TextEditingController;
                        },
                        controller: _adrTextController,
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
                            color: Color.fromARGB(255, 133, 187, 231),
                          ),
                          hintText: "N° TELEPHONE",
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
                            color: Color.fromARGB(255, 133, 187, 231),
                          ),
                          hintText: "Date",
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
                            color: Color.fromARGB(255, 133, 187, 231),
                          ),
                          hintText: "FAX",
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
                          _passwordTextController =
                              value! as TextEditingController;
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
                            color: Color.fromARGB(255, 133, 187, 231),
                          ),
                          hintText: "rediger ",
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

                              firestore.collection('reclamation').add({
                                'email': _emailTextController.text,
                                'password': _passwordTextController.text,
                                'uid': userCredential.user!.uid,
                                'nom': _nomTextController.text,
                                'cin': _cinTextController.text,
                                'reference': _referenceTextController.text,
                                'activite': _activiteTextController.text,
                                'nrue': _adrTextController.text,
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
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                print('The password provided is too weak.');
                              } else if (e.code == 'email-already-in-use') {
                                print(
                                    'The account already exists for that email.');
                              } else {
                                print(e);
                              }
                            } catch (e) {
                              print(e);
                            }
                          }
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
                                    color: Color.fromARGB(255, 221, 44, 197),
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
                        },
                        child: Text(
                          "Envoyer",
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 18, 93, 155),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7)),
                            elevation: 30,
                            shadowColor: Color.fromARGB(255, 221, 44, 197),
                            textStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
