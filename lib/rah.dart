// import 'package:animated_snack_bar/animated_snack_bar.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:form_builder_validators/form_builder_validators.dart';

// class rah extends StatefulWidget {
//   @override
//   _rahState createState() => _rahState();
// }

// class _rahState extends State<rah> {
//   final firestore = FirebaseFirestore.instance;

//   final _formKey = GlobalKey<FormState>();
//   late String _nom;
//   late String _cin;
//   late String _reference;
//   late String _adr;
//   late String _ntel;

//   String? selectedDistrict;
//   // void _submitForm() async {
//   //   if (_formKey.currentState!.validate()) {
//   //     _formKey.currentState!.save();
//   //     await FirebaseFirestore.instance.collection('user').add({
//   //       'nom': _nom,
//   //       'cin': _cin,
//   //       'reference': _reference,
//   //       'district': _district,
//   //       'mot_de_passe': passwordController.text,
//   //       'adresse': _adr,
//   //       'email': emailController.text,
//   //       'numero_telephone': _ntel,
//   //     });
//   //   }
//   // }

//   final List<String> districtOptions = [
//     'Tunis',
//     'Ariana',
//     'Ezzahra',
//     'El Kram',
//     'Le Bardo',
//     'Manouba',
//     'Mourouj',
//     'Bizerte',
//     'Nabeul',
//     'Béja',
//     'Jendouba',
//     'Le Kef',
//     'Siliana',
//     'Sousse',
//     'Monastir',
//     'Moknine',
//     'Mahdia',
//     'Kairouan',
//     'Kasserine',
//     'Sidi Bouzid',
//     'Gafsa',
//     'Sfax',
//     'Kébili',
//     'Gabès',
//     'Zarzis',
//     'Médenine',
//     'Djerba',
//     'Tataouine',
//     'Tozeur',
//     'Menzel Bourguiba',
//     'Zaghouan',
//     'Mahres',
//     'Métlaoui',
//     'El Menzah',
//     'El Jem',
//     'Ben Guerdane',
//     'Hammamet',
//     'Msaken',
//   ];

//   late String _district;
//   FirebaseAuth auth = FirebaseAuth.instance;

//   TextEditingController emailController = TextEditingController();

//   TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
    

//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(colors: [
//           Color.fromARGB(255, 162, 212, 241),
//           Color.fromARGB(255, 96, 164, 219),
//         ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(0, 90, 0, 32),
//           child: SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const Text(
//                     "Inscription",
//                     style: TextStyle(
//                       fontSize: 40,
//                       fontStyle: FontStyle.italic,
//                       fontFamily: 'Niticia Text',
//                       color: Colors.yellow,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Stack(
//                     children: [
//                       Container(
//                         width: 120,
//                         height: 120,
//                         margin: EdgeInsets.fromLTRB(110, 30, 90, 0),
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(100),
//                             image: DecorationImage(
//                                 image: AssetImage("images/ins.png"))),
//                       ),
//                     ],
//                   ),
//                   Container(
//                     child: Form(
//                       key: _formKey,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             margin: EdgeInsets.all(40),
//                             child: FormBuilderTextField(
//                               name: 'nom',
//                               decoration: InputDecoration(
//                                 prefixIcon:
//                                     Icon(Icons.person, color: Colors.blue),
//                                 hintText: "Nom&Prénom",
//                                 hintStyle: TextStyle(color: Colors.grey),
//                                 border: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.white),
//                                   borderRadius: BorderRadius.circular(40),
//                                 ),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                               ),
//                               validator: FormBuilderValidators.compose([
//                                 FormBuilderValidators.required(
//                                   errorText: 'Veuillez entrer un nom',
//                                 ),
//                               ]),
//                               onChanged: (value) {
//                                 name = value;
//                               },
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(
//                                 left: 40, right: 40, bottom: 40),
//                             child: FormBuilderTextField(
//                               maxLength: 8,
//                               name: 'cin',
//                               decoration: InputDecoration(
//                                 prefixIcon: Icon(
//                                   Icons.lock,
//                                   color: Colors.blue,
//                                 ),
//                                 hintText: "CIN",
//                                 hintStyle: TextStyle(color: Colors.grey),
//                                 border: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.white),
//                                   borderRadius: BorderRadius.circular(40),
//                                 ),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                               ),
//                               validator: FormBuilderValidators.compose([
//                                 FormBuilderValidators.required(
//                                   errorText: 'Veuillez entrer un CIN',
//                                 ),
//                                 (value) {
//                                   if (value!.length != 6 && value.length != 8) {
//                                     return 'Le CIN doit comporter 6 ou 8 chiffres';
//                                   }
//                                   return null;
//                                 },
//                               ]),
//                               onChanged: (value) {
//                                 cin = value;
//                               },
//                               keyboardType: TextInputType.number,
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(
//                                 left: 40, right: 40, bottom: 40),
//                             child: FormBuilderTextField(
//                               maxLength: 8,
//                               name: 'reference',
//                               decoration: InputDecoration(
//                                 prefixIcon: Icon(
//                                   Icons.lock,
//                                   color: Colors.blue,
//                                 ),
//                                 hintText: "Référence",
//                                 hintStyle: TextStyle(color: Colors.grey),
//                                 border: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.white),
//                                   borderRadius: BorderRadius.circular(40),
//                                 ),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                               ),
//                               validator: FormBuilderValidators.compose([
//                                 FormBuilderValidators.required(
//                                   errorText: 'Veuillez entrer une référence',
//                                 ),
//                                 (value) {
//                                   if (value != null && value.length != 9) {
//                                     return 'La référence doit être composée de 9 chiffres';
//                                   }
//                                   return null;
//                                 },
//                               ]),
//                               onChanged: (value) {
//                                 ref = value;
//                               },
//                               keyboardType: TextInputType.number,
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(
//                                 left: 40, right: 40, bottom: 40),
//                             child: FormBuilderTextField(
//                               maxLength: 8,
//                               name: 'numero telephone',
//                               decoration: InputDecoration(
//                                 prefixIcon:
//                                     Icon(Icons.phone, color: Colors.blue),
//                                 hintText: "numero telephone",
//                                 hintStyle: TextStyle(color: Colors.grey),
//                                 border: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.white),
//                                   borderRadius: BorderRadius.circular(40),
//                                 ),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                               ),
//                               validator: FormBuilderValidators.compose([
//                                 FormBuilderValidators.required(
//                                   errorText:
//                                       'Veuillez entrer votre  numero telephone',
//                                 ),
//                                 (value) {
//                                   if (value != null && value.length != 8) {
//                                     return 'La numero telephone doit être composée de 8 chiffres';
//                                   }
//                                   return null;
//                                 },
//                               ]),
//                               onChanged: (value) {
//                                 num = value;
//                               },
//                               keyboardType: TextInputType.number,
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(
//                                 left: 40, right: 40, bottom: 40),
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(40),
//                               boxShadow: [
//                                 BoxShadow(
//                                     color: Color.fromARGB(255, 58, 148, 201),
//                                     blurRadius: 20,
//                                     offset: Offset(0, 10)),
//                               ],
//                             ),
//                             child: FormBuilderDropdown(
//                               name: 'district',
//                               decoration: InputDecoration(
//                                 hintText: "District",
//                                 hintStyle: TextStyle(color: Colors.grey),
//                                 prefixIcon: Icon(
//                                   Icons.villa,
//                                   color: Colors.blue,
//                                 ),
//                                 border: InputBorder.none,
//                               ),
//                               items: districtOptions
//                                   .map((district) => DropdownMenuItem(
//                                         value: district,
//                                         child: Text(district),
//                                       ))
//                                   .toList(),
//                               initialValue: districtOptions.first,
//                               onChanged: (value) {
//                                 setState(() {
//                                   _district = value!;
//                                 });
//                               },
//                               validator: FormBuilderValidators.compose([
//                                 FormBuilderValidators.required(
//                                   errorText:
//                                       'Veuillez sélectionner un district',
//                                 ),
//                               ]),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(
//                                 left: 40, right: 40, bottom: 40),
//                             child: FormBuilderTextField(
//                               name: 'adresse',
//                               decoration: InputDecoration(
//                                 prefixIcon:
//                                     Icon(Icons.home, color: Colors.blue),
//                                 hintText: "adresse",
//                                 hintStyle: TextStyle(color: Colors.grey),
//                                 border: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.white),
//                                   borderRadius: BorderRadius.circular(40),
//                                 ),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                               ),
//                               validator: FormBuilderValidators.compose([
//                                 FormBuilderValidators.required(
//                                   errorText: 'Veuillez entrer votre adresse',
//                                 ),
//                               ]),
//                               onChanged: (value) {
//                                 address = value;
//                               },
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(
//                                 left: 40, right: 40, bottom: 40),
//                             child: FormBuilderTextField(
//                               name:
//                                   'email', // You can set any attribute name you want
//                               controller: emailController,
//                               decoration: InputDecoration(
//                                 prefixIcon: Icon(
//                                   Icons.email,
//                                   color: Colors.blue,
//                                 ),
//                                 hintText: "Email",
//                                 border: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.white),
//                                   borderRadius: BorderRadius.circular(40),
//                                 ),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                               ),
//                               validator: FormBuilderValidators.compose([
//                                 FormBuilderValidators.required(
//                                     errorText:
//                                         'Entrer votre Email'), // Add a required validator
//                                 FormBuilderValidators.email(
//                                     errorText:
//                                         'Please enter a valid email'), // Add an email format validator
//                               ]),
//                               keyboardType: TextInputType.emailAddress,
//                               onChanged: (value) {
//                                 email = value;
//                               },
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(
//                                 left: 40, right: 40, bottom: 40),
//                             child: FormBuilderTextField(
//                               name:
//                                   'password', // Vous pouvez définir n'importe quel nom d'attribut
//                               controller: passwordController,
//                               obscureText: true,
//                               decoration: InputDecoration(
//                                 prefixIcon:
//                                     Icon(Icons.lock, color: Colors.blue),
//                                 hintText: "Mot de passe",
//                                 border: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.white),
//                                   borderRadius: BorderRadius.circular(40),
//                                 ),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                               ),
//                               validator: FormBuilderValidators.compose([
//                                 FormBuilderValidators.required(
//                                   errorText:
//                                       'Veuillez entrer votre mot de passe',
//                                 ),
//                                 (value) {
//                                   if (value != null && value.length != 6) {
//                                     return 'La référence doit être composée de 6 chiffres';
//                                   }
//                                   return null;
//                                 },
//                               ]),
//                             ),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(
//                                 left: 40, right: 40, bottom: 40),
//                             child: FormBuilderTextField(
//                               name: 'confirmPassword',
//                               controller: passwordController,
//                               obscureText: true,
//                               decoration: InputDecoration(
//                                 prefixIcon: Icon(
//                                   Icons.lock,
//                                   color: Colors.blue,
//                                 ),
//                                 hintText: "Confirmer le mot de passe",
//                                 border: OutlineInputBorder(
//                                   borderSide: BorderSide(color: Colors.white),
//                                   borderRadius: BorderRadius.circular(40),
//                                 ),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                               ),
//                               validator: FormBuilderValidators.compose([
//                                 FormBuilderValidators.required(
//                                   errorText:
//                                       'Veuillez entrer votre mot de passe',
//                                 ),
//                                 (value) {
//                                   if (value != null && value.length != 6) {
//                                     return 'La référence doit être composée de 6 chiffres';
//                                   }
//                                   return null;
//                                 },
//                                 (value) {
//                                   if (value != passwordController.text) {
//                                     return "Les mots de passe ne correspondent pas";
//                                   }
//                                   return null;
//                                 },
//                               ]),
//                             ),
//                           ),
//                           Container(
//                             child: ElevatedButton(
//                               onPressed: () async {
//                                 try {
//                                   UserCredential user = await FirebaseAuth
//                                       .instance
//                                       .createUserWithEmailAndPassword(
//                                           email: email!.trim(),
//                                           password: mdp!.trim());
//                                   try {
//                                     final User? user777 =
//                                         FirebaseAuth.instance.currentUser;
//                                     final _uid = user777!.uid;
//                                     print(_uid);
//                                     await FirebaseFirestore.instance
//                                         .collection('utilisateur')
//                                         .doc(_uid)
//                                         .set({
//                                       "email": ,
//                                       "id": _uid,
//                                       "password": mdp,
//                                       "nom&prenom": name,
//                                     });
//                                   } catch (ex) {
//                                     print(ex);
//                                   }
//                                 } on FirebaseAuthException catch (e) {
//                                   if (e.code == 'weak-password') {
//                                     AnimatedSnackBar.material(
//                                       "mot de passe invalide",
//                                       type: AnimatedSnackBarType.error,
//                                       duration: Duration(seconds: 4),
//                                       mobileSnackBarPosition: MobileSnackBarPosition
//                                           .bottom, // Position of snackbar on mobile devices
//                                     ).show(context);
//                                   } else if (e.code == 'invalid-email') {
//                                     AnimatedSnackBar.material(
//                                       "addresse e-mail invalide",
//                                       type: AnimatedSnackBarType.error,
//                                       duration: Duration(seconds: 4),
//                                       mobileSnackBarPosition: MobileSnackBarPosition
//                                           .bottom, // Position of snackbar on mobile devices
//                                     ).show(context);
//                                   } else if (e.code == 'email-already-in-use') {
//                                     AnimatedSnackBar.material(
//                                       "Cet addresse e-mail est déja utilisé",
//                                       type: AnimatedSnackBarType.error,
//                                       duration: Duration(seconds: 4),
//                                       mobileSnackBarPosition: MobileSnackBarPosition
//                                           .bottom, // Position of snackbar on mobile devices
//                                     ).show(context);
//                                   }
//                                 } catch (ex) {
//                                   print(ex);
//                                 }
//                               },
//                               child: Text(
//                                 "Suivant",
//                                 style: TextStyle(fontSize: 20),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor: Colors.blue,
//                                   elevation: 9,
//                                   shadowColor: Colors.white),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
