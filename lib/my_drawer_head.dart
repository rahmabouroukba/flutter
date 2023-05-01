import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyHeaderDrawer extends StatefulWidget {
  const MyHeaderDrawer({Key? key}) : super(key: key);

  @override
  State<MyHeaderDrawer> createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  late TextEditingController _emailTextController;
  late TextEditingController _nameTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _nameTextController = TextEditingController();
    getUser();
  }

  void getUser() {
    var user = FirebaseAuth.instance.currentUser;
    _emailTextController.text = user?.email ?? '';
    _nameTextController.text = user?.displayName ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: UserAccountsDrawerHeader(
        decoration: BoxDecoration(color: Colors.black),
        accountName: Text(
          FirebaseAuth.instance.currentUser?.displayName ?? '',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        accountEmail: Text(
          FirebaseAuth.instance.currentUser?.email ?? '',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
        ),
        currentAccountPicture: CircleAvatar(
          backgroundImage: AssetImage('images/lampe.png'),
          backgroundColor: Color.fromARGB(255, 173, 79, 79),
        ),
      ),
    );
  }
}
