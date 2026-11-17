import 'package:flutter/material.dart';

import 'screens/login_page.dart';
import 'theme/theme_controller.dart';
import 'widgets/theme_toggle_button.dart';

/// Couleur de départ du thème Material 3.
/// Pour tester (Partie 5, étape 17), remplacer par Colors.green et relancer.
const Color seedColor = Colors.indigo;

void main() => runApp(const MyApp());

/// Thème commun à toute l'application, déclaré une seule fois ici.
ThemeData _buildTheme(Brightness brightness) {
  final colorScheme = ColorScheme.fromSeed(
    seedColor: seedColor,
    brightness: brightness,
  );
  return ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    inputDecorationTheme: InputDecorationTheme(
      border: const OutlineInputBorder(),
      filled: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(48),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<ThemeMode>(
    valueListenable: themeModeNotifier,
    builder: (context, themeMode, _) => MaterialApp(
      title: 'EMSI Connect',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      themeMode: themeMode,
      // Bouton de bascule placé une seule fois ici, au-dessus de toutes les pages.
      builder: (context, child) => Stack(
        children: [
          child!,
          Positioned(
            left: 8,
            bottom: 8,
            child: SafeArea(
              child: Material(
                color: Theme.of(context).colorScheme.surfaceContainerHigh,
                shape: const CircleBorder(),
                elevation: 2,
                child: const ThemeToggleButton(),
              ),
            ),
          ),
        ],
      ),
      home: const LoginPage(),
    ),
  );
}
