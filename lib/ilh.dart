import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'dart:io';
import 'package:flutter/material.dart';

FirebaseStorage storage = FirebaseStorage.instance;

Future<String> uploadFile(File file) async {
  String fileName = Path.basename(file.path);
  Reference ref = storage.ref().child("images/$fileName");
  UploadTask uploadTask = ref.putFile(file);
  TaskSnapshot taskSnapshot = await uploadTask;
  String downloadURL = await taskSnapshot.ref.getDownloadURL();
  return downloadURL;
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  File? file;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image"),
      ),
      body: Center(
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  "Copie CIN",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color.fromARGB(255, 129, 72, 113),
                    fontSize: 25,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
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
      ),
    );
  }
}
