import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      title: const Text('EMSI Connect'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () => debugPrint('Notifications consultées'),
          icon: const Icon(Icons.notifications),
        ),
      ],
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              'assets/images/emsi.jpg',
              height: 160,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            const Text(
              'Bienvenue sur EMSI Connect',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Text(
              'Votre espace universitaire pour accéder à vos cours, votre planning et vos informations personnelles.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 140,
                  height: 100,
                  color: Colors.green.shade50,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.menu_book),
                      SizedBox(height: 8),
                      Text('Mes cours'),
                    ],
                  ),
                ),
                Container(
                  width: 140,
                  height: 100,
                  color: Colors.green.shade50,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calendar_month),
                      SizedBox(height: 8),
                      Text('Planning'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 140,
                  height: 100,
                  color: Colors.green.shade50,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.person),
                      SizedBox(height: 8),
                      Text('Mon profil'),
                    ],
                  ),
                ),
                Container(
                  width: 140,
                  height: 100,
                  color: Colors.green.shade50,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.task_alt),
                      SizedBox(height: 8),
                      Text('Mes tâches'),
                    ],
                  ),
                ),
              ],
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
