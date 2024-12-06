import 'package:flutter/material.dart';
import 'login_connexion.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'cree_compte.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Application Opportunités d'Emploi",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginConnexion(),
    );
  }
}
