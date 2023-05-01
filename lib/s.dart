import 'package:flutter/material.dart';

class MyWidgget extends StatefulWidget {
  @override
  _MyWidggetState createState() => _MyWidggetState();
}

class _MyWidggetState extends State<MyWidgget> {
  final TextEditingController teController = TextEditingController();
  final TextEditingController dController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController powerController = TextEditingController();
  final TextEditingController otherrPriceController = TextEditingController();
  final TextEditingController oController = TextEditingController();
  double totalls = 0;
  int selectedMonths = 1;
  double results = 0;
  double totalPrico = 0.0;
  double totalPriceeoo = 0;

  int selectedNumber = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: SingleChildScrollView(
                child: Container(
      padding: EdgeInsets.all(30),
      color: Colors.blue,
      child: Column(children: [
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
          controller: priceController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Prix unitaire',
          ),
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
            double oPrice = double.tryParse(otherrPriceController.text) ?? 0.0;
            setState(() {
              totalPriceeoo = (oPrice) * selectedMonths * selectedNumber;
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
      ]),
    ))));
  }
}
