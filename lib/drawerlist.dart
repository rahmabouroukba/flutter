import 'package:flutter/material.dart';

class MyDrawerList extends StatefulWidget {
  const MyDrawerList({super.key});

  @override
  State<MyDrawerList> createState() => _MyDrawerListState();
}

class _MyDrawerListState extends State<MyDrawerList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          ListTile(
            title: const Text("Facture"),
            onTap: () {
              Navigator.of(context).pushNamed("facture");
            },
          ),
          ListTile(
            title: const Text("Demande"),
            onTap: () {
              Navigator.of(context).pushNamed("demande");
            },
          ),
          ListTile(
            title: const Text("Panne"),
            onTap: () {
              Navigator.of(context).pushNamed("panne");
            },
          ),
          ListTile(
            title: const Text("Reclamation"),
            onTap: () {
              Navigator.of(context).pushNamed("reclamation");
            },
          ),
          ListTile(
            title: const Text("consommation"),
            onTap: () {
              Navigator.of(context).pushNamed("Reclamation");
            },
          ),
          ListTile(
            title: const Text("Deconnexion"),
            onTap: () {
              Navigator.of(context).pushNamed("loginview");
            },
          ),
        ],
      ),
    );
  }
}
