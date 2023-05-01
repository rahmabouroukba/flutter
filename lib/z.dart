import 'package:flutter/material.dart';

class MyAppp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Password Alert',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PasswordPage(),
    );
  }
}

class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  String password = '';

  void _showAlertDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alerte'),
          content: Text(message),
          actions: [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password Alert'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Mot de passe',
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (password.length < 6) {
                  _showAlertDialog(context,
                      'Le mot de passe doit comporter au moins 6 caractères.');
                } else {
                  _showAlertDialog(context,
                      'Le mot de passe doit comporter au ns 6 caractères.');
                }
              },
              child: Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }
}
