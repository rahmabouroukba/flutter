import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:rahmabourokba/drawerlist.dart';
import 'package:rahmabourokba/ilh.dart';
import 'package:rahmabourokba/my_drawer_head.dart';

class gazz extends StatefulWidget {
  @override
  _gazzState createState() => _gazzState();
}

class _gazzState extends State<gazz> {
  final _formKey = GlobalKey<FormState>();
  // li zidthom ena
  File? _pickedImage;
  ImagePicker? imagePicker;
  final ImagePicker _picker = ImagePicker();

  // li zidthom ena
  File? _pickedImage2;
  ImagePicker? imagePicker2;
  final ImagePicker _picker2 = ImagePicker();
  final Random _random = Random(); // 3ayt li random mn biblio math
  String? imageUrl1; //edheya lien image
  String? imageUrl2;
  // edheya fonction li taatik adad aleatoire besh tsami beha taswira
  String generateRandomName(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
    return String.fromCharCodes(Iterable.generate(
        length, (_) => chars.codeUnitAt(_random.nextInt(chars.length))));
  }
  // youfew houni

  final firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  // Future<List<String>> uploadFiles(File file, File file2) async {
  //   List<String> ids = [];
  //   String fileName = Path.basename(file.path);
  //   Reference ref = storage.ref().child("images/$fileName");
  //   UploadTask uploadTask = ref.putFile(file);
  //   TaskSnapshot taskSnapshot = await uploadTask;
  //   String id = taskSnapshot.ref.name;
  //   ids.add(id);

  // ignore: unnecessary_null_comparison
  //   if (file2 != null) {
  //     String fileName2 = Path.basename(file2.path);
  //     Reference ref2 = storage.ref().child("images/$fileName2");
  //     UploadTask uploadTask2 = ref2.putFile(file2);
  //     TaskSnapshot taskSnapshot2 = await uploadTask2;
  //     String id2 = taskSnapshot2.ref.name;
  //     ids.add(id2);
  //   }

  //   return ids;
  // }

  TextEditingController _dimController = TextEditingController();

  ImagePicker image = ImagePicker();

  File? file;

  File? file2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 96, 164, 219),
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.white,
            Color.fromARGB(255, 96, 164, 219),
          ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Container(
                    child: Text(
                      "demander un nouveau raccordement gaz",
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Niticia Text',
                          color: Color.fromARGB(255, 189, 117, 177),
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.white,
                              blurRadius: 9,
                              offset: (Offset(3, 3)),
                            )
                          ]),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(left: 40, right: 40, bottom: 40),
                          child: FormBuilderTextField(
                            name: "dim",
                            controller: _dimController,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                errorText: 'Veuillez entrer un dimension',
                              ),
                            ]),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.blue,
                              ),
                              hintText: "dimension",
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
                                  " Entre une Copie CIN",
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
                                  child: _pickedImage2 == null
                                      ? Icon(
                                          Icons.image,
                                          size: 50,
                                          color: Colors.white,
                                        )
                                      : Image.file(
                                          _pickedImage2!,
                                          fit: BoxFit.fill,
                                        ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                MaterialButton(
                                  onPressed: () {
                                    addGallery2();
                                  },
                                  color: Color.fromARGB(255, 129, 72, 113),
                                  child: Text(
                                    "Galerie",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                MaterialButton(
                                  onPressed: () {
                                    addCamera2();
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
                                    " Entre une copie  facture de consommation",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 129, 72, 113),
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
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                        height: 140,
                                        width: 180,
                                        child: _pickedImage == null
                                            ? Icon(
                                                Icons.image,
                                                size: 50,
                                                color: Colors.white,
                                              )
                                            : Image.file(
                                                _pickedImage!,
                                                fit: BoxFit.fill,
                                              ),
                                      ),
                                      SizedBox(width: 10),
                                      Column(
                                        children: [
                                          MaterialButton(
                                            onPressed: () {
                                              addGallery();
                                            },
                                            color: Color.fromARGB(
                                                255, 129, 72, 113),
                                            child: Text(
                                              "Galerie",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                          MaterialButton(
                                            onPressed: () {
                                              addCamera();
                                            },
                                            color: Color.fromARGB(
                                                255, 189, 117, 177),
                                            child: Text(
                                              "Appareil photo",
                                              style: TextStyle(
                                                  color: Colors.white),
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
                                  if (_dimController.text.isNotEmpty &&
                                      _pickedImage2 != null &&
                                      _pickedImage != null) {
                                    _formKey.currentState!.save();
                                    final User? user =
                                        FirebaseAuth.instance.currentUser;
                                    final _uid = user!.uid;
                                    final randomName = generateRandomName(10);
                                    //? edheya script li yaaml upload
                                    final ref1 = FirebaseStorage.instance
                                        .ref()
                                        .child('images')
                                        .child(randomName + '.jpg');
                                    await ref1.putFile(_pickedImage2!);
                                    //? edheya script li yekhou lien baed upload
                                    imageUrl1 = await ref1.getDownloadURL();
                                    //
                                    final randomName2 = generateRandomName(8);
                                    //? edheya script li yaaml upload
                                    final ref2 = FirebaseStorage.instance
                                        .ref()
                                        .child('images')
                                        .child(randomName2 + '.jpg');
                                    await ref2.putFile(_pickedImage!);
                                    //? edheya script li yekhou lien baed upload
                                    imageUrl2 = await ref2.getDownloadURL();

                                    // List<String> ids =
                                    //     await uploadFiles(file!, file2!);
                                    // String id1 = ids[0];
                                    // String id2 = ids.length > 1 ? ids[1] : '';
                                    // String convertXFileToPath(XFile file) {
                                    //   return file.path;
                                    // }

                                    await FirebaseFirestore.instance
                                        .collection('demandes')
                                        .doc('nouveau gaz')
                                        .collection('gaz')
                                        .doc(_uid)
                                        .set({
                                      'id1': imageUrl2,
                                      'id': _uid,
                                      'id2': imageUrl1,
                                      'dimension': _dimController.text,
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
                                  shadowColor:
                                      Color.fromARGB(255, 221, 44, 197),
                                  textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ]),
          ),
        ));
  }

  // getgall() async {
  //   var img = await ImagePicker().getImage(source: ImageSource.gallery);
  //   if (img != null) {
  //     setState(() {
  //       file = File(img.path);
  //     });
  //     String downloadURL = await uploadFile(file!);
  //     print(downloadURL);
  //   }
  // }

  // getcam() async {
  //   var img = await ImagePicker().getImage(source: ImageSource.camera);
  //   if (img != null) {
  //     setState(() {
  //       file = File(img.path);
  //     });
  //     String downloadURL = await uploadFile(file!);
  //     print(downloadURL);
  //   }
  // }

  // getgall2() async {
  //   var img = await ImagePicker().getImage(source: ImageSource.gallery);
  //   if (img != null) {
  //     setState(() {
  //       file2 = File(img.path);
  //     });
  //     String downloadURL = await uploadFile(file2!);
  //     print(downloadURL);
  //   }
  // }

  // getcam2() async {
  //   var img = await ImagePicker().getImage(source: ImageSource.camera);
  //   if (img != null) {
  //     setState(() {
  //       file2 = File(img.path);
  //     });
  //     String downloadURL = await uploadFile(file2!);
  //     print(downloadURL);
  //   }
  // }
  addCamera() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.camera);
    _pickedImage = File(pickedFile!.path);

    if (_pickedImage != null) {
      setState(() {
        _pickedImage;
      });
    } else {}
  }

  addGallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    _pickedImage = File(pickedFile!.path);

    if (_pickedImage != null) {
      setState(() {
        _pickedImage;
      });
    } else {}
  }

  addCamera2() async {
    XFile? pickedFile2 = await _picker2.pickImage(source: ImageSource.camera);
    _pickedImage2 = File(pickedFile2!.path);

    if (_pickedImage2 != null) {
      setState(() {
        _pickedImage2;
      });
    } else {}
  }

  addGallery2() async {
    XFile? pickedFile2 = await _picker2.pickImage(source: ImageSource.gallery);
    _pickedImage2 = File(pickedFile2!.path);

    if (_pickedImage2 != null) {
      setState(() {
        _pickedImage2;
      });
    } else {}
  }
}
