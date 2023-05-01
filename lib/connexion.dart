import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

// ignore: must_be_immutable
class Login extends StackedView<LoginViewModel> {
  Login({Key? key}) : super(key: key);
  // ignore: prefer_final_fields

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Color.fromARGB(255, 133, 187, 231),
              Color.fromARGB(255, 58, 148, 201),
            ]),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Text(
                      "connexion",
                      style: TextStyle(
                          fontSize: 40,
                          fontStyle: FontStyle.italic,
                          fontFamily: 'Niticia Text',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Color.fromARGB(255, 107, 49, 102),
                              blurRadius: 9,
                              offset: (Offset(3, 3)),
                            )
                          ]),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Email",
                                    prefixIcon: Icon(Icons.email),
                                    hintStyle:
                                        TextStyle(color: Colors.blueGrey),
                                    border: InputBorder.none),
                                keyboardType: TextInputType.emailAddress,
                                validator: viewModel.validateEmail,
                                onChanged: viewModel.setEmail,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
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
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    hintText: "Mot de passe ",
                                    prefixIcon: Icon(Icons.lock),
                                    hintStyle:
                                        TextStyle(color: Colors.blueGrey),
                                    border: InputBorder.none),
                                validator: viewModel.ValidatePassword,
                                onChanged: viewModel.setPassword,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 180),
                        child: InkWell(
                            onTap: () {},
                            child: Text(
                              "Mot de passe oublié?",
                              style: TextStyle(
                                color: Color.fromARGB(160, 42, 54, 95),
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Color.fromARGB(255, 58, 148, 201),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 6, 112, 173),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () async {
                            Navigator.of(context).pushNamed("Home");
                          },
                          child: Text(
                            "Se connecter",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(
                                  top: 7, bottom: 7, left: 10, right: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(7),
                              ),
                              elevation: 0),
                        ),
                      ),
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
                                  Navigator.of(context)
                                      .pushNamed("innscription");
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ))
            ],
          )),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
  @override
  bool get reactive => false;
}
