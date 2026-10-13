# TP0 — Installation Flutter

Le projet du TP est dans `trying_flutter`. Le PDF fourni est conservé dans ce dépôt local sur le second disque `D:`.

## Ouvrir et lancer

Ouvrir `trying_flutter` dans VS Code puis appuyer sur F5 (configuration « TP0 - Chrome »), ou double-cliquer sur `LANCER_TP0.cmd`. Fermer l'exécution précédente avant de relancer sur le même port.

```powershell
cd D:\Flutter\TP0\trying_flutter
flutter run -d chrome
```

## Livrables

- `trying_flutter/lib/main.dart` : application finale.
- `REPONSES_TP0.md` : réponses à toutes les questions.
- `VALIDATION.md` : vérifications effectuées et limites.
- `main_initial.dart.txt` : sauvegarde du compteur initial pour reprendre la manipulation pédagogique du Hot Reload.

La version finale utilise un pas de +5 et −2, ne descend jamais sous zéro, affiche le message correspondant à la valeur et conserve les trois boutons. Le prénom « Hatim » a été utilisé provisoirement ; il se remplace dans `lib/main.dart`.

## Vérifier

```powershell
flutter analyze
flutter test
```

Flutter est installé dans `C:\Users\PC\dev\flutter` et ajouté au PATH utilisateur. Le projet VS Code pointe explicitement vers ce SDK, sans deuxième installation.
