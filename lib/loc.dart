import 'dart:io';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:rahmabourokba/customappbar.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:rahmabourokba/drawerlist.dart';
import 'package:rahmabourokba/ilh.dart';
import 'package:rahmabourokba/my_drawer_head.dart';

class loc extends StatefulWidget {
  @override
  _locState createState() => _locState();
}

class _locState extends State<loc> {
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

  final firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  Future<List<String>> uploadFiles(
      File file, File file2, File file3, File file4) async {
    List<String> ids = [];
    String fileName = Path.basename(file.path);
    Reference ref = storage.ref().child("images/$fileName");
    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    String id = taskSnapshot.ref.name;
    ids.add(id);

    // ignore: unnecessary_null_comparison
    if (file2 != null) {
      String fileName2 = Path.basename(file2.path);
      Reference ref2 = storage.ref().child("images/$fileName2");
      UploadTask uploadTask2 = ref2.putFile(file2);
      TaskSnapshot taskSnapshot2 = await uploadTask2;
      String id2 = taskSnapshot2.ref.name;
      ids.add(id2);
    }
    // ignore: unnecessary_null_comparison
    if (file3 != null) {
      String fileName3 = Path.basename(file3.path);
      Reference ref3 = storage.ref().child("images/$fileName3");
      UploadTask uploadTask3 = ref3.putFile(file3);
      TaskSnapshot taskSnapshot3 = await uploadTask3;
      String id2 = taskSnapshot3.ref.name;
      ids.add(id2);
    }
    // ignore: unnecessary_null_comparison
    if (file4 != null) {
      String fileName4 = Path.basename(file4.path);
      Reference ref4 = storage.ref().child("images/$fileName4");
      UploadTask uploadTask4 = ref4.putFile(file4);
      TaskSnapshot taskSnapshot4 = await uploadTask4;
      String id4 = taskSnapshot4.ref.name;
      ids.add(id4);
    }

    return ids;
  }

  TextEditingController _adrController = TextEditingController();

  TextEditingController _nomController = TextEditingController();

  late String _district;

  File? file;
  File? file2;
  File? file3;
  File? file4;

  ImagePicker image = ImagePicker();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: CustomAppBar(
          icon2: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite,
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.white,
            Color.fromARGB(255, 96, 164, 219),
          ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(children: [
                      Container(
                        margin: EdgeInsets.all(40),
                        child: FormBuilderTextField(
                          name: "nom",
                          controller: _nomController,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'Veuillez entrer un nom',
                            ),
                          ]),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                            hintText: "Nom&Prénom",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(left: 40, right: 40, bottom: 40),
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
                        margin:
                            EdgeInsets.only(left: 40, right: 40, bottom: 40),
                        child: FormBuilderTextField(
                          name: "adresse",
                          controller: _adrController,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                              errorText: 'Veuillez entrer votre adresse ',
                            ),
                          ]),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.blue,
                            ),
                            hintText: "adresse",
                            hintStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                " Entre Copie CIN",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 129, 72, 113),
                                    fontSize: 25,
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.w400),
                              ),
                              Container(
                                margin: EdgeInsets.all(30),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(4)),
                                height: 140,
                                width: 180,
                                child: file == null
                                    ? Icon(
                                        Icons.image,
                                        size: 50,
                                        color: Colors.white,
                                      )
                                    : Image.file(
                                        file!,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              MaterialButton(
                                onPressed: () {
                                  getgall();
                                },
                                color: Color.fromARGB(255, 129, 72, 113),
                                child: Text(
                                  "Galerie",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  getcam();
                                },
                                color: Color.fromARGB(255, 189, 117, 177),
                                child: Text(
                                  "Appareil photo",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "  Entre  Une copie de la patente et du registre de commerce pour usage commercial",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 129, 72, 113),
                                      fontSize: 15,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(30),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      height: 140,
                                      width: 180,
                                      child: file2 == null
                                          ? Icon(
                                              Icons.image,
                                              size: 50,
                                              color: Colors.white,
                                            )
                                          : Image.file(
                                              file2!,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      children: [
                                        MaterialButton(
                                          onPressed: () {
                                            getgall2();
                                          },
                                          color:
                                              Color.fromARGB(255, 129, 72, 113),
                                          child: Text(
                                            "Galerie",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        MaterialButton(
                                          onPressed: () {
                                            getcam2();
                                          },
                                          color: Color.fromARGB(
                                              255, 189, 117, 177),
                                          child: Text(
                                            "Appareil photo",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "  Entre  Une copie Autorisation légalisée auprès du propriétaire",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 129, 72, 113),
                                      fontSize: 15,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(30),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      height: 140,
                                      width: 180,
                                      child: file3 == null
                                          ? Icon(
                                              Icons.image,
                                              size: 50,
                                              color: Colors.white,
                                            )
                                          : Image.file(
                                              file3!,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      children: [
                                        MaterialButton(
                                          onPressed: () {
                                            getgall3();
                                          },
                                          color:
                                              Color.fromARGB(255, 129, 72, 113),
                                          child: Text(
                                            "Galerie",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        MaterialButton(
                                          onPressed: () {
                                            getcam3();
                                          },
                                          color: Color.fromARGB(
                                              255, 189, 117, 177),
                                          child: Text(
                                            "Appareil photo",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "  Entre une copie de la patente et du registre de commerce pour usage commercial",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 129, 72, 113),
                                      fontSize: 15,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w700),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(30),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      height: 140,
                                      width: 180,
                                      child: file4 == null
                                          ? Icon(
                                              Icons.image,
                                              size: 50,
                                              color: Colors.white,
                                            )
                                          : Image.file(
                                              file4!,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      children: [
                                        MaterialButton(
                                          onPressed: () {
                                            getgall4();
                                          },
                                          color:
                                              Color.fromARGB(255, 129, 72, 113),
                                          child: Text(
                                            "Galerie",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        MaterialButton(
                                          onPressed: () {
                                            getcam4();
                                          },
                                          color: Color.fromARGB(
                                              255, 189, 117, 177),
                                          child: Text(
                                            "Appareil photo",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (_nomController.text.isNotEmpty &&
                                    _district.isNotEmpty &&
                                    _adrController.text.isNotEmpty &&
                                    file != null &&
                                    file2 != null) {
                                  _formKey.currentState!.save();

                                  List<String> ids = await uploadFiles(
                                      file!, file2!, file3!, file4!);
                                  String id1 = ids[0];
                                  String id2 = ids.length > 1 ? ids[1] : '';
                                  String id3 = ids.length > 2 ? ids[2] : '';
                                  String id4 = ids.length > 3 ? ids[3] : '';

                                  await firestore
                                      .collection('demandes')
                                      .doc('nouveau electricitr')
                                      .collection('cas locataire')
                                      .add({
                                    'id1': id1,
                                    'id2': id2,
                                    'id3': id3,
                                    'id4': id4,
                                    'name': _nomController.text,
                                    'District': _district,
                                    'adresse': _adrController.text
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
                                            color: Color.fromARGB(
                                                255, 221, 44, 197),
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
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          "Veuillez remplir tous les champs avant d'envoyer.",
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
                                textStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15)),
                          ),
                        ),
                      )
                    ]),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  getgall() async {
    var img = await ImagePicker().getImage(source: ImageSource.gallery);
    if (img != null) {
      setState(() {
        file = File(img.path);
      });
      String downloadURL = await uploadFile(file!);
      print(downloadURL);
    }
  }

  getcam() async {
    var img = await ImagePicker().getImage(source: ImageSource.camera);
    if (img != null) {
      setState(() {
        file = File(img.path);
      });
      String downloadURL = await uploadFile(file!);
      print(downloadURL);
    }
  }

  getgall2() async {
    var img = await ImagePicker().getImage(source: ImageSource.gallery);
    if (img != null) {
      setState(() {
        file2 = File(img.path);
      });
      String downloadURL = await uploadFile(file2!);
      print(downloadURL);
    }
  }

  getcam2() async {
    var img = await ImagePicker().getImage(source: ImageSource.camera);
    if (img != null) {
      setState(() {
        file2 = File(img.path);
      });
      String downloadURL = await uploadFile(file2!);
      print(downloadURL);
    }
  }

  getgall3() async {
    var img = await ImagePicker().getImage(source: ImageSource.gallery);
    if (img != null) {
      setState(() {
        file3 = File(img.path);
      });
      String downloadURL = await uploadFile(file3!);
      print(downloadURL);
    }
  }

  getcam3() async {
    var img = await ImagePicker().getImage(source: ImageSource.camera);
    if (img != null) {
      setState(() {
        file3 = File(img.path);
      });
      String downloadURL = await uploadFile(file3!);
      print(downloadURL);
    }
  }

  getgall4() async {
    var img = await image.getImage(source: ImageSource.gallery);
    setState(() {
      file4 = File(img!.path);
    });
  }

  getcam4() async {
    var img = await image.getImage(source: ImageSource.camera);
    setState(() {
      file4 = File(img!.path);
    });
  }
}
