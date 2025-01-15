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
  final TextEditingController confirmPasswordController = TextEditingController();

  // Fonction pour créer un compte Firebase
  void _creeCompte() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    // Vérification des champs vides
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Veuillez remplir tous les champs.')),
        );
      }
      return;
    }

    // Validation de l'email
    if (!_validateEmail(email)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Veuillez entrer une adresse email valide.')),
        );
      }
      return;
    }

    // Validation du mot de passe
    if (!_validatePassword(password)) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Le mot de passe doit contenir au moins 6 caractères.')),
        );
      }
      return;
    }

    // Vérification si les mots de passe correspondent
    if (password != confirmPassword) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Les mots de passe ne correspondent pas.')),
        );
      }
      return;
    }

    // Afficher un indicateur de chargement
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
      // Création du compte Firebase
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Fermer l'indicateur de chargement
      if (mounted) {
        Navigator.of(context).pop();
      }

      // Afficher un message de succès
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Compte créé avec succès !')),
        );
      }

      // Réinitialiser les champs de saisie
      emailController.clear();
      passwordController.clear();
      confirmPasswordController.clear();

      // Naviguer vers une autre page si nécessaire
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home'); // Exemple
      }
    } on FirebaseAuthException catch (e) {
      // Fermer l'indicateur de chargement
      if (mounted) {
        Navigator.of(context).pop();
      }

      String errorMessage;

      // Gérer les erreurs spécifiques Firebase
      switch (e.code) {
        case 'email-already-in-use':
          errorMessage = 'Cet email est déjà utilisé.';
          break;
        case 'invalid-email':
          errorMessage = 'L\'adresse email est invalide.';
          break;
        case 'weak-password':
          errorMessage = 'Le mot de passe est trop faible.';
          break;
        case 'network-request-failed':
          errorMessage = 'Problème de connexion Internet. Veuillez vérifier votre connexion.';
          break;
        default:
          errorMessage = 'Une erreur est survenue : ${e.message}';
          break;
      }

      // Afficher le message d'erreur
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    } catch (e) {
      // Fermer l'indicateur de chargement
      if (mounted) {
        Navigator.of(context).pop();
      }

      // Gérer les autres types d'erreurs
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Une erreur inattendue est survenue.')),
        );
      }
    }
  }

  // Validation de l'email
  bool _validateEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // Validation du mot de passe
  bool _validatePassword(String password) {
    return password.length >= 6;
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