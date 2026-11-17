import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _darkMode = false;

  ThemeData _buildTheme(Brightness brightness) {
    final colors = ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: brightness,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colors,
      scaffoldBackgroundColor: colors.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.primary,
        foregroundColor: colors.onPrimary,
        centerTitle: true,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.surfaceContainerHighest,
        contentPadding: const EdgeInsets.all(16),
        prefixIconColor: colors.primary,
        suffixIconColor: colors.primary,
        errorMaxLines: 3,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colors.primary,
          foregroundColor: colors.onPrimary,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.primaryContainer,
        foregroundColor: colors.onPrimaryContainer,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMSI Connect',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      themeMode: _darkMode ? ThemeMode.dark : ThemeMode.light,
      builder: (context, child) {
        final colors = Theme.of(context).colorScheme;

        return Column(
          children: [
            Material(
              color: colors.surface,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Icon(
                        _darkMode ? Icons.dark_mode : Icons.light_mode,
                        color: colors.primary,
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text('Mode sombre'),
                      ),
                      Switch(
                        value: _darkMode,
                        onChanged: (value) {
                          setState(() {
                            _darkMode = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: child ?? const SizedBox.shrink(),
            ),
          ],
        );
      },
      home: const LoginPage(),
    );
  }
}
