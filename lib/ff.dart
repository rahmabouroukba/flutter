import 'package:flutter/material.dart';

class FF extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image(
            image: AssetImage('images/2.png'),
            width: double.infinity,
            height: 800,
            fit: BoxFit.cover),
      ),
    );
  }
}
