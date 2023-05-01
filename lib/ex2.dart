import 'package:flutter/material.dart';

void main() => runApp(MyApop());

class MyApop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notifications Admin',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => AdminPage(),
        '/user': (context) => UserPage(),
      },
    );
  }
}

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  void _onSendNotificationPressed() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Send Notification'),
          content: TextField(
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
              labelText: 'Notification Message',
            ),
          ),
          actions: [
            ElevatedButton(
              child: Text('Send'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/user');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Admin Page',
              style: TextStyle(fontSize: 24.0),
            ),
            ElevatedButton(
              onPressed: () {
                _onSendNotificationPressed();
              },
              child: Text('Send Notification to User'),
            ),
          ],
        ),
      ),
    );
  }
}

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Page'),
      ),
      body: Center(
        child: Text(
          'User Page',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
