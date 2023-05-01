import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Initialiser le plugin Firebase Messaging pour gérer les notifications
final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class MyArpp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notification Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Notification Example'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({required this.title});

  // Méthode pour configurer les notifications locales
  void _configureLocalNotifications() {
    var androidInitialize =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: androidInitialize);
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // Méthode pour enregistrer un appareil avec FCM
  void _registerWithFirebase() async {
    await _firebaseMessaging.requestPermission();
    String? token = await _firebaseMessaging.getToken();
    print('FCM Token: $token');
    // Envoyer le token au serveur pour l'enregistrement
    // Remarque : cette partie doit être implémentée côté serveur
  }

  // Méthode pour afficher une notification locale
  void _showLocalNotification() async {
    var androidDetails = AndroidNotificationDetails('channelId', 'channelName',
        importance: Importance.max, priority: Priority.high);
    var notificationDetails = NotificationDetails(android: androidDetails);
    await _flutterLocalNotificationsPlugin.show(
        0, 'helllo', 'Contenu de la notification', notificationDetails,
        payload: 'Contenu du payload');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _configureLocalNotifications();
            _registerWithFirebase();
            _showLocalNotification();
          },
          child: Text('Afficher une notification'),
        ),
      ),
    );
  }
}
