import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:rahmabourokba/drawerlist.dart';
import 'package:rahmabourokba/my_drawer_head.dart';
import 'sustomappbar.dart';

class Rep extends StatefulWidget {
  @override
  _RepState createState() => _RepState();
}

class _RepState extends State<Rep> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  late String _nom;
  late String _cin;
  late String _reference;
  late String _adr;
  late String _ntel;
  late String _activite;
  late String _rediger;
  late String _fax;
  late String _date;
  late String _profession;
  late String _ville;
  late String _Raisonsocial;
  late String _Registercom;

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await FirebaseFirestore.instance
          .collection('demandes')
          .doc('autres demande')
          .collection('client industriel')
          .add({
        'nom': _nom,
        'cin': _cin,
        'reference': _reference,
        'district': _district,
        'mot_de_passe': passwordController.text,
        'adresse': _adr,
        'email': emailController.text,
        'numero_telephone': _ntel,
        'profession': _profession,
        'ville': _ville,
        'activite': _activite,
        'rediger': _rediger,
        'date': _date,
        'fax': _fax,
        'raison': _Raisonsocial,
        'register commerce': _Registercom,
        'prestation technique': selectedPrestationTechnique,
        'prestation commercial': selectedPrestationcommercial,
      });
    }
  }

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  String? selectedreclamation;

  List<String> type1List = [
    "1* Alimentation en énergie",
    "2* Vérification disjoncteur ",
    "3*Vérification détendeur Gaz",
    "4* Modification de puissance ou de débit ",
    "5* Modification des réseaux",
    "6* Etalonnage de compteur",
    "7* Coupure de l'énergie",
    "8* Rétablissement de l'énergie",
    "9* Location de transformateur"
  ];
  List<String> type2List = [
    "1* Relevé d'index",
    "2* Changement de tarif",
    "3* Résiliation et mutation d'abonnement"
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
      initialIndex: 0,
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
            Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/res.png"), fit: BoxFit.cover),
              ),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        colors: [
                      Colors.black.withOpacity(.8),
                      Colors.black.withOpacity(.2)
                    ])),
              ),
            ),
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
                      child: FormBuilderTextField(
                        name: 'nom',
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.blue),
                          hintText: "Nom&Prénom",
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
                            errorText: 'Veuillez entrer un nom',
                          ),
                        ]),
                        onSaved: (value) {
                          _nom = value!;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                      child: FormBuilderTextField(
                        name: 'cin',
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.blue,
                          ),
                          hintText: "CIN",
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
                            errorText: 'Veuillez entrer un CIN',
                          ),
                          (value) {
                            if (value!.length != 6 && value.length != 8) {
                              return 'Le CIN doit comporter 6 ou 8 chiffres';
                            }
                            return null;
                          },
                        ]),
                        onSaved: (value) {
                          _cin = value!;
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                      child: FormBuilderTextField(
                        name: 'numero telephone',
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone, color: Colors.blue),
                          hintText: "numero telephone",
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
                            errorText:
                                'Veuillez entrer votre  numero telephone',
                          ),
                          (value) {
                            if (value!.length != 8) {
                              return 'numero telephone doit comporter 8 chiffres';
                            }
                            return null;
                          },
                        ]),
                        onSaved: (value) {
                          _ntel = value!;
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                      child: FormBuilderTextField(
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
                        onSaved: (value) {
                          _reference = value!;
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                      child: FormBuilderTextField(
                        name: 'activite',
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.local_activity, color: Colors.blue),
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
                        onSaved: (value) {
                          _activite = value!;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                      child: FormBuilderTextField(
                        name: 'profession',
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.local_activity, color: Colors.blue),
                          hintText: "profession",
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
                            errorText: 'Veuillez entrer votre profession',
                          ),
                        ]),
                        onSaved: (value) {
                          _profession = value!;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                      child: FormBuilderTextField(
                        name: 'Raison social ',
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.business, color: Colors.blue),
                          hintText: "Raison social ",
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
                            errorText: 'Veuillez entrer votre Raison social ',
                          ),
                        ]),
                        onSaved: (value) {
                          _Raisonsocial = value!;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                      child: FormBuilderTextField(
                        name: 'Register commerce  ',
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.business, color: Colors.blue),
                          hintText: "Register commerce ",
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
                            errorText:
                                'Veuillez entrer votre Register commerce ',
                          ),
                        ]),
                        onSaved: (value) {
                          _Registercom = value!;
                        },
                      ),
                    ),
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
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                      child: FormBuilderTextField(
                        name: 'adresse',
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.home, color: Colors.blue),
                          hintText: "adresse",
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
                            errorText: 'Veuillez entrer votre adresse',
                          ),
                        ]),
                        onSaved: (value) {
                          _adr = value!;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                      child: FormBuilderTextField(
                        name: 'ville',
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.villa, color: Colors.blue),
                          hintText: "ville",
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
                            errorText: 'Veuillez entrer votre ville',
                          ),
                        ]),
                        onSaved: (value) {
                          _ville = value!;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                      child: FormBuilderTextField(
                        name: 'date',
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.date_range, color: Colors.blue),
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
                        onSaved: (value) {
                          _date = value!;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                      child: FormBuilderTextField(
                        name: 'fax',
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.fax, color: Colors.blue),
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
                        onSaved: (value) {
                          _fax = value!;
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                      child: FormBuilderTextField(
                        name:
                            'email', // You can set any attribute name you want
                        controller: emailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.blue,
                          ),
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText:
                                  'Entrer votre Email'), // Add a required validator
                          FormBuilderValidators.email(
                              errorText:
                                  'Please enter a valid email'), // Add an email format validator
                        ]),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                      child: FormBuilderTextField(
                        name:
                            'password', // Vous pouvez définir n'importe quel nom d'attribut
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: Colors.blue),
                          hintText: "Mot de passe",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                            errorText: 'Veuillez entrer votre mot de passe',
                          ),
                          (value) {
                            if (value != null && value.length != 6) {
                              return 'La mot de passe  doit être composée de 6 chiffres';
                            }
                            return null;
                          },
                        ]),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: RadioListTile<String>(
                                title: Text("prestation technique",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18)),
                                value: "prestation technique",
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
                                title: Text("prestation commercial",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18)),
                                value: "prestation commercial",
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
                        if (selectedService == "prestation technique")
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
                                  hint: Text("Sélectionnez votre prestation"),
                                  isExpanded: true,
                                ),
                              ),
                            ],
                          ),
                        if (selectedService == "prestation commercial")
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
                      child: FormBuilderTextField(
                        name: 'rediger',
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.telegram, color: Colors.blue),
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
                        onSaved: (value) {
                          _rediger = value!;
                        },
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            await auth.createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text);
                            _submitForm();

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
                          }
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
      ),
    );
  }
}
