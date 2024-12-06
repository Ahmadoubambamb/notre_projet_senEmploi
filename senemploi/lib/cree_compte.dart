import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreeCompte extends StatefulWidget {
  const CreeCompte({super.key});

  @override
  State<CreeCompte> createState() => _CreeCompteState();
}

class _CreeCompteState extends State<CreeCompte> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Fonction pour créer un compte Firebase
  void _creeCompte() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Créer un compte'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ClipOval(
              child: Image.asset(
                'images/job3.jpg',
                fit: BoxFit.cover,
                width: 150,
                height: 110,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Mot de passe',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirmer le mot de passe',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _creeCompte, // Appeler la fonction
              child: const Text('Créer un compte'),
            ),
          ],
        ),
      ),
    );
  }
}
