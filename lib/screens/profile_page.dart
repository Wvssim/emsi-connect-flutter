import 'package:flutter/material.dart';
import 'student_details_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String _studentName = 'Sara El Amrani';

  final String _program = 'Informatique';
  final String _level = 'S5';
  final String _email = 'sara@example.com';
  final String _academicYear = '2026–2027';
  final String _studentNumber = 'EMSI-2026-00123';

  Future<void> _modifierNom() async {
    final nouveauNom = await showDialog<String>(
      context: context,
      builder: (context) {
        return _EditNameDialog(initialName: _studentName);
      },
    );

    if (!mounted || nouveauNom == null) {
      return;
    }

    setState(() {
      _studentName = nouveauNom;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon profil'),
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
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
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage(
                          'assets/images/profil.jpg',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Informations personnelles',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildInformation(
                Icons.person,
                'Nom',
                _studentName,
              ),
              const SizedBox(height: 12),
              _buildInformation(
                Icons.school,
                'Filière',
                _program,
              ),
              const SizedBox(height: 12),
              _buildInformation(
                Icons.menu_book,
                'Niveau',
                _level,
              ),
              const SizedBox(height: 12),
              _buildInformation(
                Icons.email,
                'Email',
                _email,
              ),
              const SizedBox(height: 12),
              _buildInformation(
                Icons.calendar_month,
                'Année universitaire',
                _academicYear,
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint('Modifier le profil');
                      },
                      child: const Text(
                        'Modifier le profil',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint('Contacter');
                      },
                      child: const Text(
                        'Contacter',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _modifierNom,
                child: const Text('Modifier le nom'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentDetailsPage(
                        studentName: _studentName,
                        program: _program,
                      ),
                    ),
                  );
                },
                child: const Text('Voir les détails'),
              ),
              const SizedBox(height: 24),
              _buildCarteEtudiant(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInformation(
    IconData icone,
    String titre,
    String valeur,
  ) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.primaryContainer,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colors.outlineVariant,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icone,
            color: colors.onPrimaryContainer,
            size: 26,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '$titre : $valeur',
              style: TextStyle(
                fontSize: 16,
                color: colors.onPrimaryContainer,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarteEtudiant() {
    final colors = Theme.of(context).colorScheme;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: colors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -25,
            right: -25,
            child: Container(
              width: 120,
              height: 120,
              decoration: const BoxDecoration(
                color: Colors.white12,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: DefaultTextStyle(
              style: TextStyle(
                color: colors.onPrimary,
                fontSize: 14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.school,
                        color: colors.onPrimary,
                        size: 30,
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'EMSI\nCarte étudiant',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 32,
                        backgroundImage: AssetImage(
                          'assets/images/profil.jpg',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _studentName,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text('Filière : $_program'),
                            const SizedBox(height: 4),
                            Text('Niveau : $_level'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text('Numéro étudiant'),
                  const SizedBox(height: 4),
                  Text(
                    _studentNumber,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text('Année universitaire : $_academicYear'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EditNameDialog extends StatefulWidget {
  final String initialName;

  const _EditNameDialog({
    required this.initialName,
  });

  @override
  State<_EditNameDialog> createState() => _EditNameDialogState();
}

class _EditNameDialogState extends State<_EditNameDialog> {
  late final TextEditingController _controller;
  String? _error;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: widget.initialName,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _valider() {
    final nom = _controller.text.trim();

    if (nom.isEmpty) {
      setState(() {
        _error = 'Nom obligatoire';
      });
      return;
    }

    Navigator.pop(context, nom);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Modifier le nom'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        textCapitalization: TextCapitalization.words,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          labelText: 'Nom complet',
          errorText: _error,
        ),
        onSubmitted: (_) {
          _valider();
        },
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: _valider,
          child: const Text('Valider'),
        ),
      ],
    );
  }
}
