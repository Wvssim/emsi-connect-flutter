import 'package:flutter/material.dart';

/// Mode d'affichage global de l'application (clair, sombre ou système).
///
/// Il est lu par MaterialApp dans main.dart : changer sa valeur change le thème
/// de toutes les pages, sans modifier chaque page individuellement (bonus).
final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier<ThemeMode>(
  ThemeMode.system,
);
