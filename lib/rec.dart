import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Reclamattion {
  final String nom;
  final String email;
  final String motDePasse;
  final String adresse;
  late final String description;

  Reclamattion({
    required this.nom,
    required this.email,
    required this.motDePasse,
    required this.adresse,
    required this.description,
  });
}

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

enum EtatFeedback { nonTraite, enCours, resolu }

class _FeedbackScreenState extends State<FeedbackScreen> {
  List<int> selectedButtonIndices =
      []; // Liste pour stocker les indices des boutons sélectionnés

  List<Color> claimColors = [];

  EtatFeedback etatActuel = EtatFeedback.nonTraite;
  String claimId = '';
  CollectionReference reclamationCollection =
      FirebaseFirestore.instance.collection('reclamation');
  Color claimColor = Colors
      .black; // Remplacez Colors.black par la couleur initiale de la réclamation

  Future<void> _deleteReclamation(String docId) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Supprimer la réclamation'),
          content:
              Text('Êtes-vous sûr de vouloir supprimer cette réclamation?'),
          actions: [
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Supprimer'),
              onPressed: () async {
                await reclamationCollection.doc(docId).delete();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void markClaimAsResolved(String claimId) async {
    try {
      // Référence à la collection "reclamation" dans la base de données
      CollectionReference reclamationsRef =
          FirebaseFirestore.instance.collection('reclamation');

      // Mise à jour du document de réclamation avec le statut "traitée"
      await reclamationsRef.doc(claimId).update({'statut': 'traitée'});

      print('Réclamation marquée comme traitée dans la base de données !');
    } catch (e) {
      print('Erreur lors de la mise à jour de la réclamation : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback des utilisateurs'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: reclamationCollection.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Une erreur s\'est produite : ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          List<Reclamattion> reclamations = snapshot.data!.docs.map((doc) {
            Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
            return Reclamattion(
              nom: data['nom'] ?? '',
              email: data['email'] ?? '',
              motDePasse: data['motDePasse'] ?? '',
              adresse: data['adresse'] ?? '',
              description: data['description'] ?? '',
            );
          }).toList();

          return ListView.builder(
            itemCount: reclamations.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(reclamations[index].nom),
                subtitle: Text(reclamations[index].description),
                trailing: Wrap(
                  spacing: 12,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        _deleteReclamation(snapshot.data!.docs[index].id);
                      },
                      child: Text('Supprimer'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        markClaimAsResolved(snapshot.data!.docs[index].id);

                        // Mettre à jour la liste des indices des boutons sélectionnés
                        setState(() {
                          if (selectedButtonIndices.contains(index)) {
                            selectedButtonIndices.remove(index);
                          } else {
                            selectedButtonIndices.add(index);
                          }
                        });
                      },
                      child: Text('Marquer comme traitée'),
                    ),
                    Container(
                      color: selectedButtonIndices.contains(index)
                          ? Colors.green
                          : Colors.transparent,
                      child: Text('Réclamation'),
                    ),
                  ],
                ),
                onTap: () {},
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
