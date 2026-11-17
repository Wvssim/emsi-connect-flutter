import 'package:flutter/material.dart';
import '../utils/validators.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmationController = TextEditingController();

  bool _showPassword = false;
  bool _showConfirmation = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _descriptionController.dispose();
    _passwordController.dispose();
    _confirmationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inscription'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        labelText: 'Nom complet',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Nom complet obligatoire';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Adresse email',
                        hintText: 'exemple@emsi.ma',
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      validator: validateEmail,
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        labelText: 'Téléphone',
                        hintText: '0612345678',
                        prefixIcon: Icon(Icons.phone_outlined),
                        errorMaxLines: 2,
                      ),
                      validator: (value) {
                        final phone = (value ?? '').trim();

                        if (phone.isEmpty) {
                          return 'Téléphone obligatoire';
                        }

                        if (!RegExp(r'^[0-9]{10}$').hasMatch(phone)) {
                          return 'Saisissez exactement 10 chiffres';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _descriptionController,
                      keyboardType: TextInputType.multiline,
                      minLines: 3,
                      maxLines: 5,
                      maxLength: 200,
                      decoration: const InputDecoration(
                        labelText: 'Description (facultative)',
                        hintText: 'Présentez-vous en quelques mots',
                        prefixIcon: Icon(Icons.description_outlined),
                        alignLabelWithHint: true,
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: !_showPassword,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        prefixIcon: const Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          tooltip: _showPassword
                              ? 'Masquer le mot de passe'
                              : 'Afficher le mot de passe',
                          icon: Icon(
                            _showPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _showPassword = !_showPassword;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Mot de passe obligatoire';
                        }

                        if (value.length < 8) {
                          return 'Au moins 8 caractères';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _confirmationController,
                      obscureText: !_showConfirmation,
                      autocorrect: false,
                      enableSuggestions: false,
                      decoration: InputDecoration(
                        labelText: 'Confirmer le mot de passe',
                        prefixIcon: const Icon(Icons.lock_reset),
                        errorMaxLines: 3,
                        suffixIcon: IconButton(
                          tooltip: _showConfirmation
                              ? 'Masquer la confirmation'
                              : 'Afficher la confirmation',
                          icon: Icon(
                            _showConfirmation
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _showConfirmation = !_showConfirmation;
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Confirmez votre mot de passe';
                        }

                        if (value != _passwordController.text) {
                          return 'Les mots de passe ne correspondent pas';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                            .hideCurrentSnackBar();

                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Formulaire valide — compte non créé',
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text('Créer mon compte'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
