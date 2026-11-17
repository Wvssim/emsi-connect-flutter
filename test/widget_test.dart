import 'package:emsi_connect/main.dart';
import 'package:emsi_connect/screens/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'Le parcours connexion -> accueil affiche les éléments principaux',
    (tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.enterText(
        find.byType(TextFormField).at(0),
        'etudiant@emsi.ma',
      );
      await tester.enterText(find.byType(TextFormField).at(1), 'secret1234');
      await tester.tap(find.text('Vérifier la saisie'));
      await tester.pumpAndSettle();

      expect(find.text('EMSI Connect'), findsOneWidget);
      expect(find.byIcon(Icons.notifications), findsOneWidget);
      expect(find.text('Bienvenue sur EMSI Connect'), findsOneWidget);
      expect(find.text('Mes cours'), findsOneWidget);
      expect(find.text('Planning'), findsOneWidget);
      expect(find.text('Mon profil'), findsOneWidget);
      expect(find.text('Mes tâches'), findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byIcon(Icons.add), findsOneWidget);

      await tester.tap(find.byIcon(Icons.notifications));
      await tester.tap(find.byType(FloatingActionButton));
    },
  );

  testWidgets('La page profil affiche les informations de l\'étudiant', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(320, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MaterialApp(home: ProfilePage()));

    expect(find.text('Mon profil'), findsOneWidget);
    expect(find.text('Informations personnelles'), findsOneWidget);
    expect(find.text('Nom : Sara El Amrani'), findsOneWidget);
    expect(find.text('Filière : Informatique'), findsOneWidget);
    expect(find.text('Niveau : S5'), findsOneWidget);
    expect(find.text('Email : sara@example.com'), findsOneWidget);
    expect(find.text('Année universitaire : 2026–2027'), findsOneWidget);
    expect(find.text('Modifier le profil'), findsOneWidget);
    expect(find.text('Contacter'), findsOneWidget);
    expect(find.text('Étudiante EMSI'), findsOneWidget);
    expect(find.text('N° étudiant : EMSI-2026-001'), findsOneWidget);
  });
}
