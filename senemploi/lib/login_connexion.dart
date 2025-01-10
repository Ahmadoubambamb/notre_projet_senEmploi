import 'package:flutter/material.dart';
import 'package:senemploi/acceuilPage.dart';
import 'cree_compte.dart';

class LoginConnexion extends StatelessWidget {
  LoginConnexion({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Pour étendre le fond derrière l'AppBar
      appBar: AppBar(
        backgroundColor: Colors.transparent, // AppBar transparente
        elevation: 0, // Supprimer l'ombre
        toolbarHeight: 120, // Hauteur de l'AppBar
        flexibleSpace: Stack(
          children: [
            // Image de fond de l'AppBar
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/ijob.jpg'), // Image de fond
                  fit: BoxFit.cover, // Couvrir toute la largeur
                ),
              ),
            ),
            // Titre superposé sur l'image
            Center(
              child: Text(
                "SEN EMPLOI",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
              ),
            ),
            // Icônes superposées sur l'image
            Positioned(
              right: 10, // Position des icônes à droite
              top: 10, // Position des icônes en haut
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.home, color: Colors.white),
                    onPressed: () {
                      // Action pour la page d'accueil
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.feed, color: Colors.white),
                    onPressed: () {
                      // Action pour le fil d'actualité
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.person, color: Colors.white),
                    onPressed: () {
                      // Action pour le profil
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.settings, color: Colors.white),
                    onPressed: () {
                      // Action pour les paramètres
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/job3.jpg'), // Image de fond de la page
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.2), // Espace pour l'image de fond
            Container(
              decoration: BoxDecoration(
                color: Colors.white
                    .withOpacity(0.8), // Fond blanc semi-transparent
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: 'Votre mail',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Mot de passe',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Fonction de Connexion,
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AccueilPage(),
                        ),
                      );
                    },
                    child: const Text('Se connecter'),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigation vers la création de compte
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CreeCompte()),
                      );
                    },
                    child: const Text('Créer un compte'),
                  ),
                ],
              ),
              margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  // Marge extérieure seul
                  vertical: 90.0),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height *
                    0.2), // Espace pour l'image de fond
          ],
        ),
      ),
    );
  }
}
