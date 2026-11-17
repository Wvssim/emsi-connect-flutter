import 'package:flutter/material.dart';
import 'courses_page.dart';
import 'profile_page.dart';
import 'login_page.dart';
import 'settings_page.dart';
import 'about_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('EMSI Connect'),
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Notifications',
            icon: const Icon(Icons.notifications),
            onPressed: () {
              debugPrint('Notifications consultées');
            },
          ),
          IconButton(
            tooltip: 'Aide',
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              debugPrint('Aide consultée');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: colors.primary,
              ),
              accountName: Text(
                'Étudiant EMSI',
                style: TextStyle(color: colors.onPrimary),
              ),
              accountEmail: Text(
                'etudiant@emsi.ma',
                style: TextStyle(color: colors.onPrimary),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: colors.onPrimary,
                child: Icon(
                  Icons.person,
                  color: colors.primary,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Accueil'),
              selected: true,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.menu_book_outlined),
              title: const Text('Mes cours'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CoursesPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Mon profil'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text('À propos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Paramètres'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Déconnexion'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 96),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/emsi.jpg',
                  width: 220,
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Bienvenue sur EMSI Connect',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: colors.primary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Connectés pour réussir ensemble.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: colors.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Votre espace universitaire pour accéder à vos cours, '
                'votre planning et vos informations personnelles.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              LayoutBuilder(
                builder: (context, constraints) {
                  final columns = constraints.maxWidth < 600 ? 2 : 3;

                  return GridView.count(
                    crossAxisCount: columns,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    children: [
                      _buildRubrique(
                        context,
                        Icons.menu_book,
                        'Mes cours',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CoursesPage(),
                            ),
                          );
                        },
                      ),
                      _buildRubrique(
                        context,
                        Icons.calendar_month,
                        'Planning',
                      ),
                      _buildRubrique(
                        context,
                        Icons.person,
                        'Mon profil',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfilePage(),
                            ),
                          );
                        },
                      ),
                      _buildRubrique(
                        context,
                        Icons.task_alt,
                        'Mes tâches',
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Ajouter',
        onPressed: () {
          debugPrint('Fonctionnalité bientôt disponible');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildRubrique(
    BuildContext context,
    IconData icone,
    String libelle, {
    VoidCallback? onTap,
  }) {
    final colors = Theme.of(context).colorScheme;

    final carte = Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colors.outlineVariant,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icone,
            size: 36,
            color: colors.onPrimaryContainer,
          ),
          const SizedBox(height: 8),
          Text(
            libelle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: colors.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );

    if (onTap == null) {
      return carte;
    }

    return GestureDetector(
      onTap: onTap,
      child: carte,
    );
  }
}
