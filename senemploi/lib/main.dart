import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'login_connexion.dart'; // Votre écran de connexion

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Assurez-vous que Flutter est initialisé
  await Firebase.initializeApp(); // Initialisez Firebase une seule fois
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SEN EMPLOI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginConnexion(), // Votre écran de connexion
    );
  }
}