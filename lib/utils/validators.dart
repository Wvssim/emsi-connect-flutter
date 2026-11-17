String? validateEmail(String? value) {
  final email = (value ?? '').trim();

  if (email.isEmpty) {
    return 'Email obligatoire';
  }

  final emailRegex = RegExp(
    r'^[^@\s]+@[^@\s.]+(?:\.[^@\s.]+)+$',
  );

  if (!emailRegex.hasMatch(email)) {
    return 'Email invalide';
  }

  return null;
}
