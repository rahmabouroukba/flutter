import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:rahmabourokba/drawerlist.dart';
import 'package:rahmabourokba/my_drawer_head.dart';

class Panne extends StatefulWidget {
  const Panne({Key? key}) : super(key: key);
  @override
  _PanneState createState() => _PanneState();
}

class _PanneState extends State<Panne> {
  final _formKey = GlobalKey<FormState>();
  late String _nom;
  late String _adresse;
  late String _ville;
  late String _description;
  late String _reference;
  late String _methods;

  String? selectedMethod;
  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      await FirebaseFirestore.instance.collection('facture').add({
        'nom': _nom,
        'adresse': _adresse,
        'ville': _ville,
        'description': _description,
        'reference': _reference,
        'methods': _methods
      });
    }
  }

  final List<String> Methods = ['électricité', 'Gaz'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 133, 187, 231),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text(
            "Panne",
            style: TextStyle(
                fontSize: 60,
                fontStyle: FontStyle.italic,
                fontFamily: 'Niticia Text',
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    color: Colors.white,
                    blurRadius: 9,
                    offset: (Offset(3, 3)),
                  )
                ]),
          ),
          centerTitle: true,
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey,
          child: SingleChildScrollView(
            child: Container(
              child: const Column(
                children: [
                  MyHeaderDrawer(),
                  MyDrawerList(),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                ),
                Positioned(
                  top: 75.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(45.0),
                        topRight: Radius.circular(45.0),
                      ),
                      color: Colors.white,
                    ),
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Positioned(
                  top: 3.0,
                  left: (MediaQuery.of(context).size.width / 2) - 100.0,
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(100, 20, 90, 0),
                        width: 170,
                        height: 170,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 9, color: Colors.blue),
                            borderRadius: BorderRadius.circular(100)),
                      ),
                      Container(
                        width: 150,
                        height: 150,
                        margin: const EdgeInsets.fromLTRB(110, 30, 90, 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: const DecorationImage(
                                image: AssetImage("images/de.png"))),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 200.0,
                  left: 25.0,
                  right: 25.0,
                  child: SingleChildScrollView(
                      child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    const BoxShadow(
                                        color:
                                            Color.fromARGB(255, 58, 148, 201),
                                        blurRadius: 20,
                                        offset: Offset(0, 10)),
                                  ],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: "Nom&Prenom",
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: Colors.blue,
                                            ),
                                            hintStyle: TextStyle(
                                                color: Colors.blueGrey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Veuillez entrer une nom';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          _nom = value!;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    const BoxShadow(
                                        color:
                                            Color.fromARGB(255, 58, 148, 201),
                                        blurRadius: 20,
                                        offset: Offset(0, 10)),
                                  ],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: "Reference",
                                            prefixIcon: Icon(
                                              Icons.lock,
                                              color: Colors.blue,
                                            ),
                                            hintStyle: TextStyle(
                                                color: Colors.blueGrey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Veuillez entrer une reference';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          _reference = value!;
                                        },
                                        keyboardType: TextInputType.number,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    const BoxShadow(
                                        color:
                                            Color.fromARGB(255, 58, 148, 201),
                                        blurRadius: 20,
                                        offset: Offset(0, 10)),
                                  ],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: "Ville",
                                            prefixIcon: Icon(
                                              Icons.location_city,
                                              color: Colors.blue,
                                            ),
                                            hintStyle: TextStyle(
                                                color: Colors.blueGrey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Veuillez entrer la ville';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          _ville = value!;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    const BoxShadow(
                                        color:
                                            Color.fromARGB(255, 58, 148, 201),
                                        blurRadius: 20,
                                        offset: Offset(0, 10)),
                                  ],
                                ),
                                child: FormBuilderDropdown(
                                  name: 'district',
                                  decoration: const InputDecoration(
                                    hintText: "District",
                                    prefixIcon: Icon(
                                      Icons.fire_extinguisher,
                                      color: Colors.blue,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  items: Methods.map(
                                      (district) => DropdownMenuItem(
                                            value: district,
                                            child: Text(district),
                                          )).toList(),
                                  initialValue: Methods.first,
                                  //allowClear: true,
                                  onChanged: (value) {
                                    setState(() {
                                      _methods = value!;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    const BoxShadow(
                                        color:
                                            Color.fromARGB(255, 58, 148, 201),
                                        blurRadius: 20,
                                        offset: Offset(0, 10)),
                                  ],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: "Adresse",
                                            prefixIcon: Icon(
                                              Icons.home,
                                              color: Colors.blue,
                                            ),
                                            hintStyle: TextStyle(
                                                color: Colors.blueGrey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Veuillez entrer une adresse';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          _adresse = value!;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    const BoxShadow(
                                        color:
                                            Color.fromARGB(255, 58, 148, 201),
                                        blurRadius: 20,
                                        offset: Offset(0, 10)),
                                  ],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: "description panne",
                                            prefixIcon: Icon(
                                              Icons.home,
                                              color: Colors.blue,
                                            ),
                                            hintStyle: TextStyle(
                                                color: Colors.blueGrey),
                                            border: InputBorder.none),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Veuillez entrer votre panne';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          _description = value!;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                      _submitForm();
                                    }
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                            "Veuillez patienter pour répondre à votre demande, nous la traiterons dans les plus brefs délais.",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontStyle: FontStyle.italic,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 221, 44, 197),
                                            ),
                                          ),
                                          actions: <Widget>[
                                            TextButton(
                                              child: const Text('Merci'),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  child: const Text(
                                    "Envoyer",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      padding: const EdgeInsets.only(
                                          left: 40, right: 40),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      elevation: 20,
                                      shadowColor: const Color.fromARGB(
                                          255, 185, 23, 137),
                                      textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                ),
                              )
                            ],
                          ))),
                ),
              ],
            ),
          ),
        ));
  }
}
