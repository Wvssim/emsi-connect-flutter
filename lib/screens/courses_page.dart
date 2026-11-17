import 'package:flutter/material.dart';

import 'login_page.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final modules = [
      {
        'nom': 'Développement Multi-Plateforme',
        'enseignant': 'Mme Aouraghe',
        'heures': 32,
      },
      {
        'nom': 'Bases de données avancées',
        'enseignant': 'M. Bennani',
        'heures': 28,
      },
      {
        'nom': 'Réseaux informatiques',
        'enseignant': 'M. Exemple',
        'heures': 24,
      },
      {
        'nom': 'Intelligence artificielle',
        'enseignant': 'Mme Idrissi',
        'heures': 30,
      },
      {'nom': 'Cybersécurité', 'enseignant': 'M. Alaoui', 'heures': 26},
      {'nom': 'Gestion de projet', 'enseignant': 'Mme Tazi', 'heures': 20},
      {'nom': 'Cloud computing', 'enseignant': 'M. Chraibi', 'heures': 24},
      {'nom': 'Génie logiciel', 'enseignant': 'Mme Berrada', 'heures': 28},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes cours'),
        actions: [
          IconButton(
            tooltip: 'Connexion',
            icon: const Icon(Icons.login),
            onPressed: () =>
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => const LoginPage())),
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: modules.length,
        itemBuilder: (context, index) {
          final module = modules[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            child: ListTile(
              leading: CircleAvatar(child: Text('${index + 1}')),
              title: Text(
                '${module['nom']}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                'Enseignant : ${module['enseignant']} - ${module['heures']} h',
              ),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Module sélectionné : ${module['nom']}'),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
