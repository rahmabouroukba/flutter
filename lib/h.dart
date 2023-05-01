import 'package:flutter/material.dart';

class Homme extends StatefulWidget {
  @override
  _HommeState createState() => _HommeState();
}

class _HommeState extends State<Homme> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          height: screenSize.height * 0.35,
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 77, 158, 212),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bienvenue",
                          style: TextStyle(
                            color: Color.fromARGB(255, 43, 15, 172),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          "  quel est votre intérêt?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 43, 15, 172),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 80),
                    CircleAvatar(
                      radius: 33,
                      backgroundColor: Color.fromARGB(255, 221, 44, 197),
                      child: ClipOval(
                        child: Image.asset(
                          'images/rrrr.png',
                          fit: BoxFit.cover,
                          width: 60,
                          height: 60,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("paiement");
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.zero,
                            minimumSize: Size(150, 150),
                            elevation: 30,
                            shadowColor: Color.fromARGB(255, 43, 15, 172),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.payment,
                              size: 70,
                              color: Color.fromARGB(255, 43, 15, 172),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'PAIMENT',
                              style: TextStyle(
                                fontSize: 25,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 221, 44, 197),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("facture");
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.zero,
                            minimumSize: Size(150, 150),
                            elevation: 30,
                            shadowColor: Color.fromARGB(255, 43, 15, 172),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.receipt,
                              size: 70,
                              color: Color.fromARGB(255, 43, 15, 172),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'FACTURE',
                              style: TextStyle(
                                fontSize: 25,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 221, 44, 197),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("panne");
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.zero,
                            minimumSize: Size(170, 170),
                            elevation: 30,
                            shadowColor: Color.fromARGB(255, 43, 15, 172),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.warning,
                              size: 70,
                              color: Color.fromARGB(255, 43, 15, 172),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'PANNE',
                              style: TextStyle(
                                fontSize: 25,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 221, 44, 197),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("reclamation");
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.zero,
                            minimumSize: Size(150, 150),
                            elevation: 30,
                            shadowColor: Color.fromARGB(255, 43, 15, 172),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 70,
                              color: Color.fromARGB(255, 43, 15, 172),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'RECLAMATION',
                              style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 221, 44, 197),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calculate,
                              color: Color.fromARGB(255, 43, 15, 172),
                              size: 70,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'CONSOMMATION',
                              style: TextStyle(
                                fontSize: 10,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 221, 44, 197),
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.zero,
                            minimumSize: Size(150, 150),
                            elevation: 30,
                            shadowColor: Color.fromARGB(255, 43, 15, 172),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.assignment,
                              color: Color.fromARGB(255, 43, 15, 172),
                              size: 70,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'DEMANDE',
                              style: TextStyle(
                                fontSize: 24,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 221, 44, 197),
                              ),
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            padding: EdgeInsets.zero,
                            minimumSize: Size(150, 150),
                            elevation: 30,
                            shadowColor: Color.fromARGB(255, 43, 15, 172),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                      ),
                    ].map((button) {
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        child: Center(
                          child: button,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  height: 136,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.black,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(22)),
                    child: Image.asset(
                      "images/jeu.png",
                      height: 160,
                      width: 700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
