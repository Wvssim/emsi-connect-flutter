import 'package:flutter/material.dart';

import 'about_page.dart';
import 'courses_page.dart';
import 'login_page.dart';
import 'profile_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Couleurs lues dans le thème global (ColorScheme.fromSeed) : elles suivent
    // la couleur de départ et le mode clair/sombre, sans valeur codée en dur.
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('EMSI Connect'),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'Notifications',
            onPressed: () => debugPrint('Notifications consultées'),
            icon: const Icon(Icons.notifications),
          ),
          IconButton(
            tooltip: 'Aide',
            onPressed: () => debugPrint('Aide consultée'),
            icon: const Icon(Icons.help_outline),
          ),
        ],
      ),
      // Menu latéral (bonus) : hub de navigation vers les pages secondaires.
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: colors.primary),
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
                child: Icon(Icons.person, color: colors.primary),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Accueil'),
              selected: true,
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.menu_book_outlined),
              title: const Text('Mes cours'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CoursesPage()),
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
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
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
                  MaterialPageRoute(builder: (context) => const AboutPage()),
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
                  MaterialPageRoute(builder: (context) => const SettingsPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Déconnexion'),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Image.asset(
                'assets/images/campus.jpg',
                height: 160,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              Text(
                'Bienvenue sur EMSI Connect',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: colors.primary,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Votre espace universitaire pour accéder à vos cours, votre planning et vos informations personnelles.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              // Partie 7 : grille de rubriques. 2 colonnes sur téléphone, 3 à partir de 600 px.
              LayoutBuilder(
                builder: (context, constraints) {
                  final columns = constraints.maxWidth < 600 ? 2 : 3;
                  return GridView.count(
                    crossAxisCount: columns,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    children: [
                      _RubriqueCard(
                        icon: Icons.menu_book,
                        label: 'Mes cours',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CoursesPage(),
                          ),
                        ),
                      ),
                      const _RubriqueCard(
                        icon: Icons.calendar_month,
                        label: 'Planning',
                      ),
                      _RubriqueCard(
                        icon: Icons.person,
                        label: 'Mon profil',
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                          ),
                        ),
                      ),
                      const _RubriqueCard(
                        icon: Icons.task_alt,
                        label: 'Mes tâches',
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
        onPressed: () => debugPrint('Fonctionnalité bientôt disponible'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _RubriqueCard extends StatelessWidget {
  const _RubriqueCard({required this.icon, required this.label, this.onTap});

  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final carte = Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: colors.onPrimaryContainer),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: colors.onPrimaryContainer),
          ),
        ],
      ),
    );

    if (onTap == null) {
      return carte;
    }

    return GestureDetector(onTap: onTap, child: carte);
  }
}
