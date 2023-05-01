import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Créer une instance de FlutterLocalNotificationsPlugin
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Configuration de l'initialisation de la bibliothèque FlutterLocalNotificationsPlugin
  var initializationSettingsAndroid = AndroidInitializationSettings('app_icon');
  var initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

class MyaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Local Notifications',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // Configurer les paramètres de notification
  Future<void> _showNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      importance: Importance.max,
      priority: Priority.high,
    );
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'hello', // Titre de la notification
      '', // Corps de la notification
      platformChannelSpecifics,
      payload: 'notification_payload',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Local Notifications')),
      body: Center(
        child: ElevatedButton(
          onPressed: _showNotification,
          child: Text('Afficher une notification "hello"'),
        ),
      ),
    );
  }
}
