import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AfficherPage extends StatefulWidget {
  @override
  _AfficherPageState createState() => _AfficherPageState();
}

class _AfficherPageState extends State<AfficherPage> {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Afficher les noms et les adresses'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _db.collection('facture').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Erreur : ${snapshot.error}');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text('Chargement en cours...');
          }
          return Table(
            border: TableBorder.all(),
            children: [
              TableRow(
                children: [
                  TableCell(child: Text('Nom')),
                  TableCell(child: Text('Adresse')),
                ],
              ),
              for (var doc in snapshot.data!.docs)
                TableRow(
                  children: [
                    TableCell(child: Text(doc['nom'])),
                    TableCell(child: Text(doc['adresse'])),
                  ],
                ),
            ],
          );
        },
      ),
    );
  }
}
