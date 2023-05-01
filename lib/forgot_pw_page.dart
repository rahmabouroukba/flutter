import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login_viewmodel.dart';

class forgetpasswordpage extends StatefulWidget {
  const forgetpasswordpage({Key? key}) : super(key: key);

  @override
  _forgetpasswordpageState createState() => _forgetpasswordpageState();
}

class _forgetpasswordpageState extends State<forgetpasswordpage> {
  final _emailTextController = TextEditingController();
  final viewModel = LoginViewModel();
  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  Future passwordreset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailTextController.text.trim());
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text("password reset link sent! check your email"),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Enter your Email and we will send you a password reset link",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
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
                    Icons.email,
                    color: Colors.blue,
                  ),
                  hintText: "EMAIL",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
                keyboardType: TextInputType.emailAddress,
                validator:
                    viewModel.validateEmail, // call validateEmail on viewModel
                onChanged: viewModel.setEmail,
                controller: _emailTextController,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MaterialButton(
              onPressed: passwordreset,
              child: Text('reset password'),
              color: Colors.blue,
            )
          ],
        ));
  }
}
