import 'package:flutter/material.dart';

import 'student_details_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _studentName = 'Sara El Amrani';

  static const _program = 'Informatique';
  static const _level = 'S5';
  static const _email = 'sara@example.com';
  static const _academicYear = '2026–2027';
  static const _studentNumber = 'EMSI-2026-001';

  Widget _buildInformation(IconData icon, String text) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colors.outlineVariant),
      ),
      child: Row(
        children: [
          Icon(icon, color: colors.onPrimaryContainer),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: colors.onPrimaryContainer),
            ),
          ),
        ],
      ),
    );
  }

  // Bonus : le nom est modifiable via une boîte de dialogue et se répercute
  // partout où il est affiché sur cette page.
  Future<void> _modifierNom() async {
    final nouveauNom = await showDialog<String>(
      context: context,
      builder: (context) => _EditNameDialog(initialName: _studentName),
    );

    if (!mounted || nouveauNom == null) {
      return;
    }

    setState(() => _studentName = nouveauNom);
  }

  void _voirLesDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            StudentDetailsPage(studentName: _studentName, program: _program),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Mon profil')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 150,
                child: Stack(
                  children: [
                    Container(
                      height: 110,
                      decoration: BoxDecoration(
                        color: colors.primaryContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage(
                          'assets/images/profile.jpg',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Informations personnelles',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              _buildInformation(Icons.person, 'Nom : $_studentName'),
              const SizedBox(height: 8),
              _buildInformation(Icons.school, 'Filière : $_program'),
              const SizedBox(height: 8),
              _buildInformation(Icons.grade, 'Niveau : $_level'),
              const SizedBox(height: 8),
              _buildInformation(Icons.email, 'Email : $_email'),
              const SizedBox(height: 8),
              _buildInformation(
                Icons.calendar_today,
                'Année universitaire : $_academicYear',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => debugPrint('Modifier le profil'),
                      child: const Text('Modifier le profil'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => debugPrint('Contacter'),
                      child: const Text('Contacter'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _modifierNom,
                      child: const Text('Modifier le nom'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _voirLesDetails,
                      child: const Text('Voir les détails'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colors.primaryContainer,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: colors.outlineVariant),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Icon(
                        Icons.account_balance,
                        color: colors.onPrimaryContainer,
                        size: 32,
                      ),
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 36,
                          backgroundImage: AssetImage(
                            'assets/images/profile.jpg',
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(right: 36),
                                child: Text(
                                  'Étudiante EMSI',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(_studentName),
                              const SizedBox(height: 4),
                              const Text('$_program - $_level'),
                              const SizedBox(height: 4),
                              Text(
                                'N° étudiant : $_studentNumber',
                                style: TextStyle(
                                  color: colors.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _EditNameDialog extends StatefulWidget {
  const _EditNameDialog({required this.initialName});

  final String initialName;

  @override
  State<_EditNameDialog> createState() => _EditNameDialogState();
}

class _EditNameDialogState extends State<_EditNameDialog> {
  late final TextEditingController _controller;
  String? _error;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _valider() {
    final nom = _controller.text.trim();

    if (nom.isEmpty) {
      setState(() => _error = 'Nom obligatoire');
      return;
    }

    Navigator.pop(context, nom);
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
    title: const Text('Modifier le nom'),
    content: TextField(
      controller: _controller,
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(labelText: 'Nom complet', errorText: _error),
      onSubmitted: (_) => _valider(),
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.pop(context),
        child: const Text('Annuler'),
      ),
      ElevatedButton(onPressed: _valider, child: const Text('Valider')),
    ],
  );
}
