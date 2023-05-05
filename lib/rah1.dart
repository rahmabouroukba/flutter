import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class rah1 extends StatefulWidget {
  const rah1({super.key});

  @override
  State<rah1> createState() => _rah1State();
}

class _rah1State extends State<rah1> {
  String? name;
  String? cin;
  String? ref;
  String? num;
  String? address;
  String? email;
  String? mdp;
  String dropdownValue = 'Tunis';

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
  String? _district;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 162, 212, 241),
        Color.fromARGB(255, 96, 164, 219),
      ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  "Inscription",
                  style: TextStyle(
                    fontSize: 40,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Niticia Text',
                    color: Colors.yellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: 120,
                  height: 120,
                  margin: EdgeInsets.fromLTRB(110, 30, 90, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image:
                          DecorationImage(image: AssetImage("images/ins.png"))),
                ),
                SizedBox(
                  height: 50,
                ),
                //!
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'blablabla';
                    } else {
                      setState(() {
                        name = value;
                      });
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35)),
                    labelText: '  nom&prenom',
                    counterText: 'prenom',
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 40,
                  onChanged: (value) {
                    name = value;
                  },
                ),
                //!
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Valid e-mail';
                    } else {
                      setState(() {
                        email = value;
                      });
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35)),
                    labelText: '  E-mail address',
                    counterText: '*Please use a verified e-mail',
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 40,
                  onChanged: (value) {
                    email = value;
                  },
                ),
                //!
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Valid e-mail';
                    } else {
                      setState(() {
                        num = value;
                      });
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35)),
                    labelText: '  phonenumber',
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.phone,
                  maxLength: 8,
                  onChanged: (value) {
                    num = value;
                  },
                ),
                //!
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "ref";
                    } else {
                      setState(() {
                        ref = value;
                      });
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35)),
                    labelText: '  ref',
                    // counterText: 'ref',
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 8,
                  onChanged: (value) {
                    ref = value;
                  },
                ),
                //!
                //!
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "cin";
                    } else {
                      setState(() {
                        cin = value;
                      });
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35)),
                    labelText: '  cin',
                    // counterText: 'ref',
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 8,
                  onChanged: (value) {
                    cin = value;
                  },
                ),
                //!
                //!
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "addresse";
                    } else {
                      setState(() {
                        address = value;
                      });
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35)),
                    labelText: '  addresse',
                    // counterText: 'ref',
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 20,
                  onChanged: (value) {
                    address = value;
                  },
                ),
                //!
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "mdp";
                    } else {
                      setState(() {
                        mdp = value;
                      });
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35)),
                    labelText: '  password',
                    // counterText: 'password',
                  ),
                  autofocus: false,
                  keyboardType: TextInputType.emailAddress,
                  maxLength: 40,
                  onChanged: (value) {
                    mdp = value;
                  },
                  obscureText: true,
                ),
                //!
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
                  child: DropdownButton<String>(
                    iconSize: 40,
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>[
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
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Text(
                  'Ville selectionné: $dropdownValue',
                ),

                ElevatedButton(
                  onPressed: () async {
                    try {
                      UserCredential user = await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: email!.trim(), password: mdp!.trim());
                      try {
                        final User? user777 = FirebaseAuth.instance.currentUser;
                        final _uid = user777!.uid;
                        print(_uid);
                        await FirebaseFirestore.instance
                            .collection('user')
                            .doc(_uid)
                            .set({
                          "email": email,
                          "id": _uid,
                          "cin": cin,
                          "addresse": address,
                          "ref": ref,
                          "password": mdp,
                          "nom&prenom": name,
                          'district': dropdownValue,
                          'phoneNumber': num
                        });
                        AnimatedSnackBar.material(
                          "succées d'inscri",
                          type: AnimatedSnackBarType.success,
                          duration: Duration(seconds: 4),
                          mobileSnackBarPosition: MobileSnackBarPosition
                              .bottom, // Position of snackbar on mobile devices
                        ).show(context);
                      } catch (ex) {
                        print(ex);
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        AnimatedSnackBar.material(
                          "mot de passe invalide",
                          type: AnimatedSnackBarType.error,
                          duration: Duration(seconds: 4),
                          mobileSnackBarPosition: MobileSnackBarPosition
                              .bottom, // Position of snackbar on mobile devices
                        ).show(context);
                      } else if (e.code == 'invalid-email') {
                        AnimatedSnackBar.material(
                          "addresse e-mail invalide",
                          type: AnimatedSnackBarType.error,
                          duration: Duration(seconds: 4),
                          mobileSnackBarPosition: MobileSnackBarPosition
                              .bottom, // Position of snackbar on mobile devices
                        ).show(context);
                      } else if (e.code == 'email-already-in-use') {
                        AnimatedSnackBar.material(
                          "Cet addresse e-mail est déja utilisé",
                          type: AnimatedSnackBarType.error,
                          duration: Duration(seconds: 4),
                          mobileSnackBarPosition: MobileSnackBarPosition
                              .bottom, // Position of snackbar on mobile devices
                        ).show(context);
                      }
                    } catch (ex) {
                      print(ex);
                      AnimatedSnackBar.material(
                        "$ex",
                        type: AnimatedSnackBarType.error,
                        duration: Duration(seconds: 4),
                        mobileSnackBarPosition: MobileSnackBarPosition
                            .bottom, // Position of snackbar on mobile devices
                      ).show(context);
                    }
                  },
                  child: Text(
                    "inscription",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      elevation: 9,
                      shadowColor: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
