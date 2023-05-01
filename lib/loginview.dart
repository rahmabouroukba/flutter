import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:rahmabourokba/forgot_pw_page.dart';
import 'package:rahmabourokba/home.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

// ignore: must_be_immutable
class LoginView extends StackedView<LoginViewModel> {
  LoginView({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 133, 187, 231),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Text(
            "CONNEXION",
            style: TextStyle(
                fontSize: 40,
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
        body: SingleChildScrollView(
            child: Container(
          child: Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.transparent,
            ),
            Positioned(
              top: 105.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(55.0),
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
                    margin: EdgeInsets.fromLTRB(100, 20, 90, 0),
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
                    margin: EdgeInsets.fromLTRB(110, 30, 90, 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        image:
                            DecorationImage(image: AssetImage("images/l.png"))),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 250.0,
              left: 25.0,
              right: 25.0,
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(children: [
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
                        keyboardType: TextInputType.emailAddress,
                        validator: viewModel.validateEmail,
                        onChanged: viewModel.setEmail,
                        controller: _emailTextController,
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
                          hintText: "Mot de passe",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                        ),
                        obscureText: true,
                        validator: viewModel.validatePassword,
                        onChanged: viewModel.setPassword,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return forgetpasswordpage();
                                }));
                              },
                              child: Text("mot de passe oublié"))
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          bool success = await viewModel.loginUser(
                              viewModel.getEmail(), viewModel.getPassword());
                          if (success) {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return Home();
                            }));
                          } else {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.ERROR,
                              animType: AnimType.SCALE,
                              title: 'Erreur de connexion',
                              desc:
                                  'Veuillez vérifier vos informations de connexion et réessayer',
                              btnOkOnPress: () {},
                            )..show();
                          }
                        }
                      },
                      // ignore: prefer_const_constructors
                      child: Text(
                        "Se connecter",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.only(
                              top: 7, bottom: 7, left: 10, right: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                          elevation: 20),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Vous n'avez pas de compte ?",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          InkWell(
                            child: GestureDetector(
                              child: Text(
                                " inscription",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromARGB(
                                    255,
                                    221,
                                    44,
                                    197,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.of(context).pushNamed("rah");
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ]),
        )));
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
  @override
  bool get reactive => false;
}
