import 'package:flutter/material.dart';

class Autres extends StatefulWidget {
  @override
  _AutresState createState() => _AutresState();
}

class _AutresState extends State<Autres> {
  int _selectedAbonnement = 0;
  String? selectedDistrict;

  final List<String> districtOptions = [
    'Tunis',
    'Arianna',
    'Ezzahra',
    'Elkram',
    'Bardo',
    'Manouba',
    'Mourouj',
    'Bizerte',
    'Nabeul',
    'Beja',
    'janbouba',
    'Elkef',
    'Siliana',
    'Sousse',
    'Monastir',
    'Moknine',
    'Mahdia',
    'Kairouan',
    'Kasserine',
    'Sidi bouzid',
    'Gafsa',
    'Sfax',
    'kebili',
    'Gabes',
    'Zarzis',
    'Mednine',
    'Djerba',
    'Tataouine',
    'Tozeur',
    'Ml.Bourgiba',
    'Zaghouan',
    'Mahres',
    'Meetlaoui',
    'El Menzah',
    'El Jem',
    'Ben Guerdene',
    'Hammamet',
    'Msaken',
  ];
  int _selectedClientType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 58, 148, 201),
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 133, 187, 231),
          Color.fromARGB(255, 58, 148, 201),
        ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
        child: Column(
          children: [
            Container(
              height: 70,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(70))),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Text(
                        "Autres services demandés",
                        style: TextStyle(
                          fontSize: 30,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 96, 164, 219),
                          shadows: [
                            Shadow(
                              color: Colors.white,
                              blurRadius: 6,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Form(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(40),
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
                                prefixIcon: Icon(Icons.bolt),
                                hintText: "Réference",
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 40, right: 40, bottom: 40),
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
                            child: DropdownButtonFormField<String>(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.villa),
                                hintText: "District",
                                border: InputBorder.none,
                              ),
                              value: selectedDistrict,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedDistrict = newValue;
                                });
                              },
                              items:
                                  districtOptions.map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        ],
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          "Abonnement",
                          style: TextStyle(
                              fontSize: 30,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.blue,
                              shadows: [
                                Shadow(
                                    color: Color.fromARGB(255, 226, 194, 221),
                                    blurRadius: 10.0,
                                    offset: Offset(3, 3))
                              ]),
                        ),
                      ),
                      RadioListTile(
                        title: Text(
                          "Abonné",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        value: 1,
                        groupValue: _selectedAbonnement,
                        onChanged: (value) {
                          setState(() {
                            _selectedAbonnement = value!;
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text("Non abonné",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        value: 2,
                        groupValue: _selectedAbonnement,
                        onChanged: (value) {
                          setState(() {
                            _selectedAbonnement = value!;
                          });
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text(
                          "Type de client",
                          style: TextStyle(
                              fontSize: 30,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.blue,
                              shadows: [
                                Shadow(
                                    color: Color.fromARGB(255, 226, 194, 221),
                                    blurRadius: 10.0,
                                    offset: Offset(3, 3))
                              ]),
                        ),
                      ),
                      SizedBox(height: 20),
                      RadioListTile(
                        title: Text("Clients résidentiels",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500)),
                        value: 1,
                        groupValue: _selectedClientType,
                        onChanged: (value) {
                          setState(() {
                            _selectedClientType = value!;
                            Navigator.pushNamed(context, "rem");
                          });
                        },
                      ),
                      RadioListTile(
                        title: Text(
                            "Clients industriels, promoteurs et tertiaires",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500)),
                        value: 2,
                        groupValue: _selectedClientType,
                        onChanged: (value) {
                          setState(() {
                            _selectedClientType = value!;
                            Navigator.pushNamed(context, "rep");
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
