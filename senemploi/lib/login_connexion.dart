import 'package:flutter/material.dart';

class LoginConnexion extends StatelessWidget {
  LoginConnexion({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Connexion'),
        ),
        body: ListView(children: [
          Image.asset(
            'images/Recrutement',
            width: 700,
            height: 700,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Appeler la fonction de connexion ici
                  },
                  child: const Text('Se connecter'),
                ),
                TextButton(
                  onPressed: () {
                    // Naviguer vers l'écran de création de compte
                  },
                  child: const Text('Créer un compte'),
                ),
              ],
            ),
          ),
        ]));
  }
}
