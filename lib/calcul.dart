import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:rahmabourokba/drawerlist.dart';
import 'package:rahmabourokba/my_drawer_head.dart';

class Calcul extends StatefulWidget {
  @override
  _CalculState createState() => _CalculState();
}

class _CalculState extends State<Calcul> {
  final TextEditingController firstController = TextEditingController();
  final TextEditingController fourController = TextEditingController();
  final TextEditingController fiveController = TextEditingController();
  final TextEditingController fController = TextEditingController();
  final TextEditingController pricceController = TextEditingController();

  final TextEditingController secondController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController powerController = TextEditingController();
  final TextEditingController otherPriceController = TextEditingController();
  final TextEditingController rttController = TextEditingController();
  final TextEditingController etController = TextEditingController();
  final TextEditingController tController = TextEditingController();
  final TextEditingController ttController = TextEditingController();
  final TextEditingController gtController = TextEditingController();
  final TextEditingController ftController = TextEditingController();
  final TextEditingController teController = TextEditingController();
  final TextEditingController dController = TextEditingController();

  final TextEditingController otherrPriceController = TextEditingController();
  final TextEditingController oController = TextEditingController();

  double totalSum = 0;

  void calculateSum() {
    double value2 = double.tryParse(calculatedPrice) ?? 0;
    double value3 = resultt;

    double value1 = tottalPrice;
    double value5 = double.tryParse(fController.text) ?? 0;

    double value4 = double.tryParse(ttController.text) ?? 0;

    totalSum = value1 + value2 + value3 + value4 + value5;
  }

  final List<String> districtOptions = [
    '1 mois',
    '2 mois',
    '4 mois',
    '6 mois',
    '8 mois',
    '10 mois',
    '12 mois',
  ];

  int selectedMonths = 1;
  double multiple = 0;
  double totallso = 0;
  int selectedPower = 2;
  int selectedNumber = 2;
  String calculatedPrice = '';
  double totalPrice = 0.0;
  double resultt = 0;
  double tottalPrice = 0;
  double totallo = 0;
  double result = 0;
  double resulto = 0;
  double total = 0;
  double totalls = 0;

  double totallss = 0;
  double results = 0;
  double totalPrico = 0.0;
  double totalPriceeoo = 0;

  double totall = 0;
  double otherPriceee = 0;
  double totalPricee = 0;
  double toe = 0;

  double otherPrice = 0;
  int number = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 133, 187, 231),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey,
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                const MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(
            "images/invo.png",
            height: 250,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 40,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    "calculer votre facture",
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
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.all(40),
                  child: FormBuilderTextField(
                    name: "index",
                    decoration: InputDecoration(
                      hintText: 'Entre nouveau index',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    controller: firstController,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'Veuillez entrer nouveau index',
                      ),
                    ]),
                    onSaved: (value) {
                      firstController.text = value!;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                  child: FormBuilderTextField(
                    name: "index",
                    decoration: InputDecoration(
                      hintText: 'Entre ancien index',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    controller: secondController,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'Veuillez entrer ancien index',
                      ),
                    ]),
                    onSaved: (value) {
                      secondController.text = value!;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                  child: FormBuilderDropdown(
                    name: 'mois',
                    decoration: InputDecoration(
                      hintText: "mois",
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    items: districtOptions
                        .map((mois) => DropdownMenuItem(
                              value: mois,
                              child: Text(mois),
                            ))
                        .toList(),
                    initialValue: districtOptions.first,
                    onChanged: (value) {
                      setState(() {});
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'Veuillez sélectionner un mois',
                      ),
                    ]),
                    onSaved: (value) {
                      selectedMonths = value! as int;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40, right: 40, bottom: 40),
                  child: FormBuilderTextField(
                    name: "prix unitaire",
                    decoration: InputDecoration(
                      hintText: 'Entre prix unitaire',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.number,
                    controller: priceController,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                        errorText: 'Veuillez entrer prix unitaire',
                      ),
                    ]),
                    onSaved: (value) {
                      priceController.text = value!;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    double a = double.parse(firstController.text);
                    double b = double.parse(secondController.text);
                    double price = double.parse(priceController.text);

                    setState(() {
                      result = a - b;
                      totalPrice = result * price;
                    });
                  },
                  child: const Text("Calculer"),
                ),
                SizedBox(height: 10),
                Text(
                  'Prix total: $totalPrice',
                  style: TextStyle(
                      fontSize: 23,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Niticia Text',
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Color.fromARGB(255, 107, 49, 102),
                          blurRadius: 9,
                          offset: (Offset(3, 3)),
                        )
                      ]),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text('Nombre de mois: '),
                    DropdownButton(
                      value: selectedMonths,
                      items: [
                        DropdownMenuItem(value: 1, child: Text('1 mois')),
                        DropdownMenuItem(value: 2, child: Text('2 mois')),
                        DropdownMenuItem(value: 4, child: Text('4 mois')),
                        DropdownMenuItem(value: 6, child: Text('6 mois')),
                        DropdownMenuItem(value: 8, child: Text('8 mois')),
                        DropdownMenuItem(value: 10, child: Text('10 mois')),
                        DropdownMenuItem(value: 12, child: Text('12 mois')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedMonths = value!;
                        });
                      },
                    ),
                  ],
                ),
                TextField(
                  controller: otherPriceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'other prix',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('Nombre: '),
                    DropdownButton(
                      value: selectedNumber,
                      items: [
                        DropdownMenuItem(value: 2, child: Text('2')),
                        DropdownMenuItem(value: 3, child: Text('3')),
                        DropdownMenuItem(value: 4, child: Text('4')),
                        DropdownMenuItem(value: 5, child: Text('6')),
                        DropdownMenuItem(value: 5, child: Text('9')),
                        DropdownMenuItem(value: 5, child: Text('12')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedNumber = value!;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    double otherPrice =
                        double.tryParse(otherPriceController.text) ?? 0.0;
                    setState(() {
                      totalPricee =
                          (otherPrice) * selectedMonths * selectedNumber;
                    });
                  },
                  child: Text('Calculer le total'),
                ),
                SizedBox(height: 10),
                Text('Le total est de $totalPricee'),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      totall = totalPricee + totalPrice;
                    });
                  },
                  child: Text('Calculer le totall'),
                ),
                SizedBox(height: 10),
                Text('Le totall est de $totall'),
                SizedBox(
                  height: 100,
                ),
                Container(
                  child: Text("électricite"),
                ),
                TextField(
                  controller: teController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Entre nouveau index',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: dController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Entre nouveau ancien',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('Nombre de mois: '),
                    DropdownButton(
                      value: selectedMonths,
                      items: [
                        DropdownMenuItem(value: 1, child: Text('1 mois')),
                        DropdownMenuItem(value: 2, child: Text('2 mois')),
                        DropdownMenuItem(value: 4, child: Text('4 mois')),
                        DropdownMenuItem(value: 6, child: Text('6 mois')),
                        DropdownMenuItem(value: 8, child: Text('8 mois')),
                        DropdownMenuItem(value: 10, child: Text('10 mois')),
                        DropdownMenuItem(value: 12, child: Text('12 mois')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedMonths = value!;
                        });
                      },
                    ),
                  ],
                ),
                TextField(
                  controller: pricceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Prix unitaire',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    double as = double.parse(teController.text);
                    double bs = double.parse(dController.text);
                    double prico = double.parse(priceController.text);

                    setState(() {
                      results = as - bs;
                      totalPrico = results * prico;
                    });
                  },
                  child: const Text("Calculer"),
                ),
                SizedBox(height: 10),
                Text(
                  'Prix total: $totalPrico',
                  style: TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    Text('Nombre de mois: '),
                    DropdownButton(
                      value: selectedMonths,
                      items: [
                        DropdownMenuItem(value: 1, child: Text('1 mois')),
                        DropdownMenuItem(value: 2, child: Text('2 mois')),
                        DropdownMenuItem(value: 4, child: Text('4 mois')),
                        DropdownMenuItem(value: 6, child: Text('6 mois')),
                        DropdownMenuItem(value: 8, child: Text('8 mois')),
                        DropdownMenuItem(value: 10, child: Text('10 mois')),
                        DropdownMenuItem(value: 12, child: Text('12 mois')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedMonths = value!;
                        });
                      },
                    ),
                  ],
                ),
                TextField(
                  controller: otherrPriceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'other prix',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('Nombre: '),
                    DropdownButton(
                      value: selectedNumber,
                      items: [
                        DropdownMenuItem(value: 2, child: Text('2')),
                        DropdownMenuItem(value: 3, child: Text('3')),
                        DropdownMenuItem(value: 4, child: Text('4')),
                        DropdownMenuItem(value: 5, child: Text('6')),
                        DropdownMenuItem(value: 5, child: Text('9')),
                        DropdownMenuItem(value: 5, child: Text('12')),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedNumber = value!;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    double oPrice =
                        double.tryParse(otherrPriceController.text) ?? 0.0;
                    setState(() {
                      totalPriceeoo =
                          (oPrice) * selectedMonths * selectedNumber;
                    });
                  },
                  child: Text('Calculer le total'),
                ),
                SizedBox(height: 10),
                Text('Le total est de $totalPriceeoo'),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      totalls = totalPriceeoo + totalPrico;
                    });
                  },
                  child: Text('Calculer le totall'),
                ),
                SizedBox(height: 10),
                Text('Le totall est de $totalls'),
                SizedBox(
                  height: 80,
                ),
                Container(
                  child: Text('rrrrrrr'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      totallso = totalls + totall;
                    });
                  },
                  child: Text('Calculer le totall'),
                ),
                SizedBox(height: 10),
                Text('Le totall est de $totallso'),
                SizedBox(
                  height: 80,
                ),
                TextField(
                  controller: fourController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter a number',
                  ),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: () {
                    double enteredValue = double.parse(fourController.text);
                    tottalPrice = enteredValue * result;
                    setState(() {});
                  },
                  child: Text('Calculate Total Price'),
                ),
                Text('The calculated total price is: $tottalPrice'),
                TextField(
                  controller: fController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter contribution fT',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 35,
                ),
                TextField(
                  controller: rttController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter contribution RTT',
                  ),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: () {
                    double enteredValue = double.parse(rttController.text);
                    double ttotalPrice = enteredValue * result;
                    setState(() {});
                    calculatedPrice = ttotalPrice.toStringAsFixed(0);
                  },
                  child: Text('Calculate Total Price'),
                ),
                Text('The calculated total price is: $calculatedPrice'),
                TextField(
                  controller: etController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter contribution gaz',
                  ),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      resultt = int.parse(etController.text) * results;
                    });
                  },
                  child: Text('Multiply'),
                ),
                Text('Resultt: $resultt'),
                TextField(
                  controller: ttController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter contribution RTT',
                  ),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: () {
                    calculateSum();
                    setState(() {});
                  },
                  child: Text('Calculate Sum'),
                ),
                Text('The calculated sum is: $totalSum'),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      totallo = totalSum + totallso;
                    });
                  },
                  child: Text('Calculer le totallo'),
                ),
                Text('The calculated sum is: $totallo'),
                TextField(
                  controller: gtController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'arriere',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'paiementprecedent',
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    double gt = double.parse(gtController.text);
                    double ft = double.parse(ftController.text);
                    setState(() {
                      total = totallo + gt - ft;
                    });
                    // show dialog with the result
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Résultat'),
                          content: Text('Somme : $total'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Calculer la somme'),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
