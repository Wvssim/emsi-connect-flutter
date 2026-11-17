import 'package:emsi_connect/main.dart';
import 'package:emsi_connect/screens/home_page.dart';
import 'package:emsi_connect/screens/login_page.dart';
import 'package:emsi_connect/screens/register_page.dart';
import 'package:emsi_connect/theme/theme_controller.dart';
import 'package:emsi_connect/utils/validators.dart';
import 'package:emsi_connect/widgets/theme_toggle_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void definirEcran(WidgetTester tester, Size taille) {
  tester.view.physicalSize = taille;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

bool champMasque(WidgetTester tester, int indexChamp) {
  final editable = find.descendant(
    of: find.byType(TextFormField).at(indexChamp),
    matching: find.byType(EditableText),
  );
  return tester.widget<EditableText>(editable).obscureText;
}

void main() {
  group('Fonctions de validation', () {
    test('validateEmail : vide, sans @, valide', () {
      expect(validateEmail(null), 'Email obligatoire');
      expect(validateEmail('   '), 'Email obligatoire');
      expect(validateEmail('etudiant.emsi.ma'), 'Email invalide');
      expect(validateEmail('etudiant@emsi.ma'), isNull);
    });

    test('validatePassword : obligatoire puis minimum 8 caractères', () {
      expect(validatePassword(''), 'Mot de passe obligatoire');
      expect(validatePassword('1234'), 'Au moins 8 caractères');
      expect(validatePassword('12345678'), isNull);
    });

    test('validateConfirmation : doit être identique', () {
      expect(validateConfirmation('', 'motdepasse'), isNotNull);
      expect(
        validateConfirmation('motdepasse2', 'motdepasse1'),
        'Les mots de passe ne correspondent pas',
      );
      expect(validateConfirmation('motdepasse1', 'motdepasse1'), isNull);
    });

    test('validatePhone : 10 chiffres commençant par 05, 06 ou 07', () {
      expect(validatePhone('0612345678'), isNull);
      expect(validatePhone('12345'), isNotNull);
      expect(validatePhone('0112345678'), isNotNull);
    });
  });

  group('Connexion (LoginPage)', () {
    testWidgets('scénarios de la campagne de tests : email et mot de passe', (
      tester,
    ) async {
      definirEcran(tester, const Size(800, 600));
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      // Email vide et mot de passe vide.
      await tester.tap(find.text('Vérifier la saisie'));
      await tester.pump();
      expect(find.text('Email obligatoire'), findsOneWidget);
      expect(find.text('Mot de passe obligatoire'), findsOneWidget);

      // Email sans @ et mot de passe de 4 caractères.
      await tester.enterText(find.byType(TextFormField).at(0), 'abc.emsi.ma');
      await tester.enterText(find.byType(TextFormField).at(1), '1234');
      await tester.tap(find.text('Vérifier la saisie'));
      await tester.pump();
      expect(find.text('Email invalide'), findsOneWidget);
      expect(find.text('Au moins 8 caractères'), findsOneWidget);
      expect(find.textContaining('Saisie valide'), findsNothing);
    });

    testWidgets('tous les champs valides : SnackBar locale sans mot de passe', (
      tester,
    ) async {
      definirEcran(tester, const Size(800, 600));
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      await tester.enterText(
        find.byType(TextFormField).at(0),
        'etudiant@emsi.ma',
      );
      await tester.enterText(find.byType(TextFormField).at(1), 'secret1234');
      await tester.tap(find.text('Vérifier la saisie'));
      await tester.pump();

      expect(
        find.text('Saisie valide (test local) : etudiant@emsi.ma'),
        findsOneWidget,
      );
      expect(
        find.descendant(
          of: find.byType(SnackBar),
          matching: find.textContaining('secret1234'),
        ),
        findsNothing,
      );
    });

    testWidgets('bouton œil : mot de passe visible puis masqué', (
      tester,
    ) async {
      definirEcran(tester, const Size(800, 600));
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      expect(champMasque(tester, 1), isTrue);

      await tester.tap(find.byTooltip('Afficher le mot de passe'));
      await tester.pump();
      expect(champMasque(tester, 1), isFalse);

      await tester.tap(find.byTooltip('Masquer le mot de passe'));
      await tester.pump();
      expect(champMasque(tester, 1), isTrue);
    });

    testWidgets('le lien « Créer un compte » ouvre l\'inscription', (
      tester,
    ) async {
      definirEcran(tester, const Size(800, 600));
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      await tester.tap(find.text('Créer un compte'));
      await tester.pumpAndSettle();
      expect(find.byType(RegisterPage), findsOneWidget);
    });
  });

  group('Inscription (RegisterPage)', () {
    testWidgets('mots de passe différents : message de non-concordance', (
      tester,
    ) async {
      definirEcran(tester, const Size(420, 1000));
      await tester.pumpWidget(const MaterialApp(home: RegisterPage()));

      await tester.enterText(
        find.byType(TextFormField).at(0),
        'Sara El Amrani',
      );
      await tester.enterText(find.byType(TextFormField).at(1), 'sara@emsi.ma');
      await tester.enterText(find.byType(TextFormField).at(2), '0612345678');
      await tester.enterText(find.byType(TextFormField).at(3), 'motdepasse1');
      await tester.enterText(find.byType(TextFormField).at(4), 'motdepasse2');
      await tester.tap(find.text('Créer mon compte'));
      await tester.pump();

      expect(
        find.text('Les mots de passe ne correspondent pas'),
        findsOneWidget,
      );
      expect(find.text('Formulaire valide — compte non créé'), findsNothing);
    });

    testWidgets('tous les champs valides : compte non créé', (tester) async {
      definirEcran(tester, const Size(420, 1000));
      await tester.pumpWidget(const MaterialApp(home: RegisterPage()));

      await tester.enterText(
        find.byType(TextFormField).at(0),
        'Sara El Amrani',
      );
      await tester.enterText(find.byType(TextFormField).at(1), 'sara@emsi.ma');
      await tester.enterText(find.byType(TextFormField).at(2), '0612345678');
      await tester.enterText(find.byType(TextFormField).at(3), 'motdepasse1');
      await tester.enterText(find.byType(TextFormField).at(4), 'motdepasse1');
      await tester.tap(find.text('Créer mon compte'));
      await tester.pump();

      expect(find.text('Formulaire valide — compte non créé'), findsOneWidget);
    });

    testWidgets('bonus : téléphone invalide et compteur de caractères', (
      tester,
    ) async {
      definirEcran(tester, const Size(420, 1000));
      await tester.pumpWidget(const MaterialApp(home: RegisterPage()));

      await tester.enterText(find.byType(TextFormField).at(2), '12345');
      await tester.enterText(find.byType(TextFormField).at(5), 'Bonjour');
      await tester.tap(find.text('Créer mon compte'));
      await tester.pump();

      expect(
        find.text('Numéro marocain à 10 chiffres (ex. 0612345678)'),
        findsOneWidget,
      );
      expect(find.text('7/120'), findsOneWidget);
    });
  });

  group('Adaptation aux écrans', () {
    testWidgets(
      'écran étroit 320 px avec clavier affiché : pas de débordement',
      (tester) async {
        definirEcran(tester, const Size(320, 480));
        tester.view.viewInsets = const FakeViewPadding(bottom: 300);
        addTearDown(tester.view.resetViewInsets);

        await tester.pumpWidget(const MaterialApp(home: LoginPage()));
        expect(tester.takeException(), isNull);

        // Le bouton reste accessible en faisant défiler le formulaire.
        await tester.ensureVisible(find.text('Créer un compte'));
        expect(tester.takeException(), isNull);
      },
    );

    testWidgets('grand écran : formulaire centré et largeur limitée à 420', (
      tester,
    ) async {
      definirEcran(tester, const Size(1024, 768));
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));

      expect(tester.getSize(find.byType(Form)).width, lessThanOrEqualTo(420));
    });

    testWidgets('HomePage : 2 colonnes sur téléphone, 3 sur tablette', (
      tester,
    ) async {
      definirEcran(tester, const Size(320, 640));
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      final delegatTelephone =
          tester.widget<GridView>(find.byType(GridView)).gridDelegate
              as SliverGridDelegateWithFixedCrossAxisCount;
      expect(delegatTelephone.crossAxisCount, 2);

      definirEcran(tester, const Size(1024, 768));
      await tester.pumpWidget(const MaterialApp(home: HomePage()));
      final delegatTablette =
          tester.widget<GridView>(find.byType(GridView)).gridDelegate
              as SliverGridDelegateWithFixedCrossAxisCount;
      expect(delegatTablette.crossAxisCount, 3);
      expect(find.text('Mes tâches'), findsOneWidget);
    });
  });

  group('Thème global (bonus)', () {
    testWidgets(
      'la bascule clair/sombre change le thème de toute l\'application',
      (tester) async {
        addTearDown(() => themeModeNotifier.value = ThemeMode.system);
        definirEcran(tester, const Size(800, 600));
        themeModeNotifier.value = ThemeMode.light;

        await tester.pumpWidget(const MyApp());
        await tester.tap(find.byIcon(Icons.dark_mode));
        await tester.pumpAndSettle();

        expect(themeModeNotifier.value, ThemeMode.dark);
        expect(find.byIcon(Icons.light_mode), findsOneWidget);
        expect(find.byType(ThemeToggleButton), findsOneWidget);
      },
    );
  });
}
