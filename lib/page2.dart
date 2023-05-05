import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  // final String name;
  // final String cin;

  // const Page2({Key? key, required this.name, required this.cin})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('Name: $name'),
            // Text('cin: $cin'),
          ],
        ),
      ),
    );
  }
}
