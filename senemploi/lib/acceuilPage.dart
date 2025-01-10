import 'package:flutter/material.dart';

class AccueilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SEN EMPLOI",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue.shade800,
        elevation: 10,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              // Naviguer vers la page des notifications
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barre de recherche
            _buildSearchBar(),
            const SizedBox(height: 20),

            // Catégories d'emplois
            Text(
              "Catégories",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            const SizedBox(height: 10),
            _buildCategories(),
            const SizedBox(height: 20),

            // Offres d'emploi récentes
            Text(
              "Offres récentes",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue.shade800,
              ),
            ),
            const SizedBox(height: 10),
            _buildRecentJobs(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Naviguer vers la page de publication d'offre
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue.shade800,
      ),
    );
  }

  // Barre de recherche
  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Rechercher un emploi...",
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }

  // Catégories d'emplois
  Widget _buildCategories() {
    final List<Map<String, dynamic>> categories = [
      {"icon": Icons.code, "label": "Informatique"},
      {"icon": Icons.medical_services, "label": "Santé"},
      {"icon": Icons.school, "label": "Enseignement"},
      {"icon": Icons.engineering, "label": "Ingénierie"},
      {"icon": Icons.restaurant, "label": "Restauration"},
      {"icon": Icons.shopping_bag, "label": "Vente"}
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 2.5,
      ),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          child: Padding(
            padding: const EdgeInsets.all(7.0),
            child: Row(
              children: [
                Icon(categories[index]["icon"], color: Colors.blue.shade800),
                const SizedBox(width: 7),
                Text(
                  categories[index]["label"],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Offres d'emploi récentes
  Widget _buildRecentJobs() {
    final jobs = [
      {
        "title": "Développeur Flutter",
        "company": "Tech Solutions",
        "location": "Dakar, Sénégal",
      },
      {
        "title": "Infirmier(ère)",
        "company": "Hôpital Général",
        "location": "Kaolack, Sénégal",
      },
      {
        "title": "Enseignant(e) domicile en Maths",
        "company": "Lycée Moderne",
        "location": "Saint-Louis, Sénégal",
      },
      {
        "title": "Ingénieur Civil",
        "company": "BTP SARL",
        "location": "Thiès, Sénégal",
      },
      {
        "title": "Serveur(se)",
        "company": "Restaurant Mere Seuleum",
        "location": "Kaolack, Sénégal",
      },
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 3,
          margin: const EdgeInsets.only(bottom: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  jobs[index]["title"] ?? "title non spécifiée",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  jobs[index]["company"] ?? "compagny non spécifiée",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  jobs[index]["location"] ?? "Localisation non spécifiée",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
