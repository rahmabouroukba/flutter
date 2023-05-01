import 'package:flutter/material.dart';

class Demande extends StatefulWidget {
  @override
  _DemandeState createState() => _DemandeState();
}

class _DemandeState extends State<Demande> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 96, 164, 219),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 400),
            width: double.infinity,
            height: 600,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Color.fromARGB(255, 96, 164, 219),
                ],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 120, left: 50, right: 50),
            width: double.infinity,
            height: 600,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/l.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  spreadRadius: 0.1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(60),
                  child: Text(
                    "choisir votre demande?",
                    style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                              color: Color.fromARGB(255, 189, 117, 177),
                              blurRadius: 6,
                              offset: Offset(3, 3))
                        ]),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("search");
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 96, 164, 219),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                    child: Text(
                      'Demander un nouveau raccordement électricité',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("gaz");
                    },
                    child: const Text(
                      'Demander un nouveau raccordement gaz',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 96, 164, 219),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(30),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("rem");
                    },
                    child: const Text(
                      'Autres services demandés',
                      style: TextStyle(fontSize: 16),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 96, 164, 219),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
