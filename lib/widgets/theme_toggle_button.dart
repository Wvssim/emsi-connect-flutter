import 'package:flutter/material.dart';

import '../theme/theme_controller.dart';

/// Bouton de bascule clair / sombre (bonus).
///
/// Le bouton ne choisit aucune couleur : il modifie seulement le mode global,
/// et c'est MaterialApp (main.dart) qui applique le thème à toute l'application.
class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    // Pas de tooltip ici : il exige un Overlay, absent au-dessus du Navigator.
    return Semantics(
      button: true,
      label: isDark ? 'Passer en mode clair' : 'Passer en mode sombre',
      child: IconButton(
        icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
        onPressed: () {
          themeModeNotifier.value = isDark ? ThemeMode.light : ThemeMode.dark;
        },
      ),
    );
  }
}
