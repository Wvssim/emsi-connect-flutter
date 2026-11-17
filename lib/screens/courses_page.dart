import 'package:flutter/material.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  static const Color couleurPrincipale = Color(0xFF00796B);

  @override
  Widget build(BuildContext context) {
    final modules = <Map<String, Object>>[
      {
        'nom': 'Développement Multi-Plateforme',
        'enseignant': 'Mme Aouraghe',
        'heures': 32,
      },
      {
        'nom': 'Bases de données avancées',
        'enseignant': 'M. Exemple',
        'heures': 40,
      },
      {
        'nom': 'Génie logiciel',
        'enseignant': 'Mme Exemple',
        'heures': 36,
      },
      {
        'nom': 'Cloud Computing',
        'enseignant': 'M. Exemple',
        'heures': 32,
      },
      {
        'nom': 'Intelligence artificielle',
        'enseignant': 'Mme Exemple',
        'heures': 40,
      },
      {
        'nom': 'Sécurité informatique',
        'enseignant': 'M. Exemple',
        'heures': 30,
      },
      {
        'nom': 'Réseaux informatiques',
        'enseignant': 'Mme Exemple',
        'heures': 36,
      },
      {
        'nom': 'Gestion de projet',
        'enseignant': 'M. Exemple',
        'heures': 24,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes cours'),
        backgroundColor: couleurPrincipale,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Modules du semestre',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              itemCount: modules.length,
              itemBuilder: (context, index) {
                final module = modules[index];
                final nom = module['nom'] as String;
                final enseignant = module['enseignant'] as String;
                final heures = module['heures'] as int;

                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 12,
                    ),
                    horizontalTitleGap: 12,
                    leading: CircleAvatar(
                      radius: 18,
                      backgroundColor: couleurPrincipale,
                      foregroundColor: Colors.white,
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                      nom,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        'Enseignant : $enseignant\n'
                        'Volume horaire : $heures heures',
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    isThreeLine: true,
                    trailing: const Icon(
                      Icons.chevron_right,
                      color: couleurPrincipale,
                      size: 20,
                    ),
                    onTap: () {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                            content: Text(
                              'Module sélectionné : $nom',
                            ),
                          ),
                        );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
