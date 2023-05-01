import 'package:flutter/material.dart';

class Facture22 extends StatelessWidget {
  const Facture22({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 133, 187, 231),
      body: Container(
        child: Column(
          children: [
            Container(
              height: 180,
              child: Center(
                child: Text(
                  "Facture",
                  style: TextStyle(
                      fontSize: 60,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Niticia Text',
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 107, 49, 102),
                          blurRadius: 9,
                          offset: (Offset(3, 3)),
                        )
                      ]),
                ),
              ),
            ),
            SizedBox(height: 400),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(30),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "valide",
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(30),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Paiement reçu',
                              style: TextStyle(
                                fontSize: 26,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 221, 44, 197),
                              ),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('images/va.png'),
                                SizedBox(height: 0),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Merci'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text(
                      "Payer",
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
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
