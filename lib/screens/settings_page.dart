import 'package:flutter/material.dart';

import '../theme/theme_controller.dart';

/// Écran « Paramètres » (bonus) : le mode sombre agit réellement sur le
/// thème global (themeModeNotifier) ; les autres réglages sont simulés et
/// ne sont pas enregistrés durablement.
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _compactMode = false;
  bool _showAdditionalInfo = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Paramètres')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Text(
              'Préférences',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: colors.primary,
              ),
            ),
            const SizedBox(height: 16),
            ValueListenableBuilder<ThemeMode>(
              valueListenable: themeModeNotifier,
              builder: (context, mode, _) {
                final isDark = mode == ThemeMode.dark;
                return SwitchListTile(
                  title: const Text('Mode sombre'),
                  subtitle: const Text(
                    'Change le thème de toute l\'application',
                  ),
                  secondary: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
                  value: isDark,
                  onChanged: (value) {
                    themeModeNotifier.value = value
                        ? ThemeMode.dark
                        : ThemeMode.light;
                  },
                );
              },
            ),
            const Divider(),
            SwitchListTile(
              title: const Text('Notifications'),
              subtitle: const Text('Autoriser les notifications'),
              secondary: const Icon(Icons.notifications_outlined),
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() => _notificationsEnabled = value);
              },
            ),
            const Divider(),
            SwitchListTile(
              title: const Text('Mode compact'),
              subtitle: const Text('Réduire certains espacements'),
              secondary: const Icon(Icons.view_compact_outlined),
              value: _compactMode,
              onChanged: (value) {
                setState(() => _compactMode = value);
              },
            ),
            const Divider(),
            SwitchListTile(
              title: const Text('Afficher les informations complémentaires'),
              secondary: const Icon(Icons.info_outline),
              value: _showAdditionalInfo,
              onChanged: (value) {
                setState(() => _showAdditionalInfo = value);
              },
            ),
            if (_showAdditionalInfo)
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Le mode sombre modifie réellement le thème de '
                  'l\'application. Les autres réglages sont simulés : '
                  'ils ne sont pas enregistrés durablement.',
                ),
              ),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: EdgeInsets.all(_compactMode ? 8 : 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'État des paramètres',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Notifications : '
                      '${_notificationsEnabled ? "Activées" : "Désactivées"}',
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Mode compact : '
                      '${_compactMode ? "Activé" : "Désactivé"}',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content: Text('Paramètres modifiés localement'),
                    ),
                  );
              },
              child: const Text('Afficher une confirmation'),
            ),
          ],
        ),
      ),
    );
  }
}
