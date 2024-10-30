import 'package:flutter/material.dart';

class LoginConnexion extends StatelessWidget {
  LoginConnexion({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // notre image en arrière-plan pour l'instant
          Positioned.fill(
            child: Image.asset(
              'images/Recrutement.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // ceci est le contenu principal (formulaire de connexion)
          //on va l'ameliorer
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      border: const OutlineInputBorder(),
                      fillColor: Colors.white.withOpacity(0.8),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      border: const OutlineInputBorder(),
                      fillColor: Colors.white.withOpacity(0.8),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Appeler la fonction de connexion ici.
                      //
                    },
                    child: const Text('Se connecter'),
                  ),
                  TextButton(
                    onPressed: () {
                      // ici la fonction de navigation vers l'écran de création de compte
                    },
                    child: const Text('Créer un compte'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
