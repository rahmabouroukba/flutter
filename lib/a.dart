import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:rahmabourokba/ilh.dart';

class MyFormPage extends StatefulWidget {
  @override
  _MyFormPageState createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();

  final firestore = FirebaseFirestore.instance;

  FirebaseStorage storage = FirebaseStorage.instance;
  Future<List<String>> uploadFiles(File file) async {
    List<String> ids = [];
    String fileName = Path.basename(file.path);
    Reference ref = storage.ref().child("images/$fileName");
    UploadTask uploadTask = ref.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    String id = taskSnapshot.ref.name;
    ids.add(id);

    return ids;
  }

  File? file;

  TextEditingController _nameController = TextEditingController();

  ImagePicker image = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormBuilderTextField(
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
                        onSaved: (value) {},
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "  Copie CIN",
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
                      Row(children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();

                                    List<String> ids = await uploadFiles(file!);
                                    String id1 = ids[0];
                                    String id2 = ids.length > 1 ? ids[1] : '';

                                    await firestore
                                        .collection('demandes')
                                        .doc('nouveau gaz')
                                        .collection('gaz')
                                        .add({
                                      'id1': id1,
                                      'id2': id2,
                                      'name': _nameController.text,
                                    });

                                    if (_nameController.text.isNotEmpty) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                              _formKey.currentState!
                                                          .validate() &&
                                                      file != null
                                                  ? "Veuillez patienter pour répondre à votre demande, nous la traiterons dans les plus brefs délais."
                                                  : "Veuillez remplir tous les champs et ajouter une image.",
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
                                                  Navigator.of(context)
                                                      .pop(); // Fermer la boîte de dialogue
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
                                      fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ]))));
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
}
