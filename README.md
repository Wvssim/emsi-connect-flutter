# EMSI Connect

EMSI Connect est une application Flutter conçue pour centraliser les principaux services de la vie étudiante dans une interface simple et adaptée aux petits écrans.

L’application propose actuellement un tableau de bord donnant accès aux cours, au planning, au profil et aux tâches. Un écran de profil étudiant est également disponible dans le code et servira de base aux prochaines fonctionnalités.

## Fonctionnalités

- Tableau de bord responsive organisé en quatre rubriques.
- Présentation des cours, du planning, du profil et des tâches.
- Écran de profil avec les informations essentielles de l’étudiant.
- Interface Material Design compatible avec les écrans mobiles et le Web.
- Actions préparées pour les notifications et l’ajout de fonctionnalités.

## Technologies

- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- Material Design

## Structure du projet

```text
assets/
  images/
lib/
  main.dart
  screens/
    home_page.dart
    profile_page.dart
test/
  widget_test.dart
web/
pubspec.yaml
```

`main.dart` initialise l’application. Les écrans sont isolés dans `lib/screens` afin de faciliter l’ajout de nouvelles pages et de futures routes de navigation.

## Installation

Prérequis : une installation fonctionnelle de Flutter sur le canal stable.

```bash
git clone https://github.com/Wvssim/emsi-connect-flutter.git
cd emsi-connect-flutter
flutter pub get
flutter run
```

Pour lancer directement la version Web :

```bash
flutter run -d chrome
```

## Vérification

```bash
flutter analyze
flutter test
```

## Évolution prévue

- Navigation entre les différentes rubriques.
- Données étudiantes dynamiques.
- Gestion du planning et des tâches.
- Authentification et persistance des données.
