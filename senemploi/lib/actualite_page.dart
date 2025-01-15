import 'package:flutter/material.dart';

class ActualitePage extends StatelessWidget {
  const ActualitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fil d\'actualité'),
      ),
      body: const Center(
        child: Text('Contenu du fil d\'actualité'),
      ),
    );
  }
}