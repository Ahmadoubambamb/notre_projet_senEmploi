import 'package:flutter/material.dart';
import 'nav_bar.dart';

class LoginConnexion extends StatelessWidget {
  LoginConnexion({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 225, 241, 248),
        title: const Text(
          "SEN EMPLOI",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        leadingWidth: 500,
      ),
      body: Stack(
        children: [
          // notre image en arrière-plan pour l'instant
          Positioned.fill(
            child: Image.asset(
              'images/job3.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // ceci est le contenu principal (formulaire de connexion)
          //on va l'ameliorer
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white
                      .withOpacity(0.8), // Fond blanc semi-transparent
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: 'votre mail',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Mot de passe',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Fonction de connexion
                          const NavBar();
                        },
                        child: const Text('Se connecter'),
                      ),
                      TextButton(
                        onPressed: () {
                          // Navigation vers la création de compte
                        },
                        child: const Text('Créer un compte'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
