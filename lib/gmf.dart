import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class MyAppn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Send Email Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Send Email Demo'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              await sendEmail();
            },
            child: Text('Envoyer un e-mail'),
          ),
        ),
      ),
    );
  }
}

Future<void> sendEmail() async {
  String username =
      'bourokbarahma2001@gmail.com'; // Remplacez par votre adresse email
  String password = 'rahma23578736'; // Remplacez par votre mot de passe

  final smtpServer = gmail(username, password);

  final message = Message()
    ..from = Address(username, 'Votre nom')
    ..recipients.add(
        'bourokbarahma29@gmail.com') // Remplacez par l'adresse email du destinataire
    ..subject = 'hh'
    ..text = 'jn';

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}
