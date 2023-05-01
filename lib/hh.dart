import 'package:flutter/material.dart';
import 'package:rahmabourokba/reclamation.dart';

class homm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 96, 164, 219),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 96, 164, 219),
        elevation: 0,
        title: Text(
          'Bienvenu',
          style: TextStyle(fontSize: 40),
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications,
              size: 30,
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 162, 212, 241),
          Color.fromARGB(255, 96, 164, 219),
        ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 25,
                      color: Colors.white,
                    ),
                    hintText: 'chercher',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Container(
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        height: 160,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            Container(
                              height: 136,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Color.fromARGB(255, 8, 23, 156),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22)),
                              ),
                            ),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 10),
                                  height: 140,
                                  width: 140,
                                  child: Image.asset(
                                    "images/fact.png",
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                child: SizedBox(
                                  height: 136,
                                  width: 200,
                                  child: Column(
                                    children: <Widget>[
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Reclamation()),
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 15),
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 8, 23, 156),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(22),
                                              topRight: Radius.circular(22),
                                            ),
                                          ),
                                          child: Text(
                                            "Facture",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        height: 160,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            Container(
                              height: 136,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Color.fromARGB(255, 8, 23, 156),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22)),
                              ),
                            ),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 10),
                                  height: 160,
                                  width: 200,
                                  child: Image.asset(
                                    "images/panne.png",
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                child: SizedBox(
                                  height: 136,
                                  width: size.width - 200,
                                  child: Column(
                                    children: <Widget>[
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Reclamation()),
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 15),
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 8, 23, 156),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(22),
                                              topRight: Radius.circular(22),
                                            ),
                                          ),
                                          child: Text(
                                            "Reclamation",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        height: 160,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            Container(
                              height: 136,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Color.fromARGB(255, 8, 23, 156),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22)),
                              ),
                            ),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 15),
                                  height: 160,
                                  width: 200,
                                  child: Image.asset(
                                    "images/reqq.png",
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                child: SizedBox(
                                  height: 136,
                                  width: size.width - 200,
                                  child: Column(
                                    children: <Widget>[
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("RECLAMATION"),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Reclamation()),
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 8, 23, 156),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(22),
                                              topRight: Radius.circular(22),
                                            ),
                                          ),
                                          child: Text(
                                            "Reclamation",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        height: 160,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            Container(
                              height: 136,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(22),
                                color: Color.fromARGB(255, 8, 23, 156),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22)),
                              ),
                            ),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 5),
                                  height: 160,
                                  width: 200,
                                  child: Image.asset(
                                    "images/calc.png",
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                child: SizedBox(
                                  height: 136,
                                  width: size.width - 200,
                                  child: Column(
                                    children: <Widget>[
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("RECLAMATION"),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Reclamation()),
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 8, 23, 156),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(22),
                                              topRight: Radius.circular(22),
                                            ),
                                          ),
                                          child: Text(
                                            "Reclamation",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Container(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        height: 160,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            Container(
                              height: 136,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(22),
                                  color: Color.fromARGB(255, 8, 23, 156)),
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(22)),
                              ),
                            ),
                            Positioned(
                                top: 0,
                                right: 0,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 10),
                                  height: 160,
                                  width: 200,
                                  child: Image.asset(
                                    "images/recc.png",
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                child: SizedBox(
                                  height: 136,
                                  width: size.width - 200,
                                  child: Column(
                                    children: <Widget>[
                                      Spacer(),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("RECLAMATION"),
                                      ),
                                      Spacer(),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Reclamation()),
                                          );
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 5),
                                          decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(255, 8, 23, 156),
                                            borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(22),
                                              topRight: Radius.circular(22),
                                            ),
                                          ),
                                          child: Text(
                                            "Reclamation",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
