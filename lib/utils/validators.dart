// Fonctions de validation locales (aucune donnée n'est envoyée à un serveur).
// Chaque validator reçoit la valeur du champ et retourne `null` si la saisie
// est acceptée, ou un message d'erreur sinon.

/// Email : champ non vide et présence de « @ ».
/// Vérification pédagogique : elle ne garantit pas qu'une adresse existe.
String? validateEmail(String? value) {
  final email = (value ?? '').trim();
  if (email.isEmpty) return 'Email obligatoire';
  if (!email.contains('@')) return 'Email invalide';
  return null;
}

/// Mot de passe : obligatoire et au moins 8 caractères (règle de l'exercice).
String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Mot de passe obligatoire';
  }
  if (value.length < 8) {
    return 'Au moins 8 caractères';
  }
  return null;
}

/// Confirmation : doit être identique au mot de passe saisi.
String? validateConfirmation(String? value, String password) {
  if (value == null || value.isEmpty) {
    return 'Confirmez votre mot de passe';
  }
  if (value != password) {
    return 'Les mots de passe ne correspondent pas';
  }
  return null;
}

/// Nom complet : obligatoire.
String? validateFullName(String? value) {
  if ((value ?? '').trim().isEmpty) return 'Nom complet obligatoire';
  return null;
}

/// Téléphone (bonus) : 10 chiffres commençant par 05, 06 ou 07.
String? validatePhone(String? value) {
  final phone = (value ?? '').trim();
  if (phone.isEmpty) return 'Téléphone obligatoire';
  if (!RegExp(r'^0[5-7]\d{8}$').hasMatch(phone)) {
    return 'Numéro marocain à 10 chiffres (ex. 0612345678)';
  }
  return null;
}
