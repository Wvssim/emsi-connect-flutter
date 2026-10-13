# Vérifications du TP0 — 13 octobre 2026

## Environnement

- Flutter **3.47.7**, canal stable ; Dart **3.13.5**.
- SDK unique : `C:\Users\PC\dev\flutter`, PATH utilisateur configuré.
- Extensions VS Code Flutter et Dart de Dart Code déjà installées.
- `flutter doctor -v` : Flutter, Chrome, Visual Studio, appareils et réseau validés. SDK Android absent ; ce point ne bloque pas le TP sur Chrome.
- `flutter devices` : Chrome, Edge et Windows détectés.

## Code et exécution

- `flutter analyze` : **No issues found**.
- `flutter test` : **All tests passed**.
- Le test vérifie les trois boutons, les messages, les pas +5 et −2, la borne à zéro (y compris à partir de 1), la remise à zéro et le résultat 10 − 2 − 2 − 2 = 4.
- Application lancée par `flutter run -d chrome --web-port 7357`.
- Hot Reload exécuté avec succès dans la session Flutter. Une modification de la structure de classe a été rejetée, puis corrigée en conservant le champ `title` ; le rechargement suivant a réussi.
- Vérification visuelle et clics dans Chrome : 0 → 5 → 3 → 1 → 0 ; plusieurs clics de décrémentation à zéro conservent 0 ; un nouveau clic d'incrémentation donne 5 et « Réinitialiser » ramène à 0.
- Interface vérifiée : titre EMSI Flutter, prénom provisoire Hatim, AppBar bleue, valeur bleue à 40 pixels logiques, icône de soustraction, trois boutons et message dynamique.
- Capture finale : `capture_TP0.png`.

## Manipulation pédagogique initiale

Le compteur d'origine a été créé, lancé et conservé dans `main_initial.dart.txt`. La session de Hot Reload a été vérifiée, mais la séquence pédagogique exacte « cinq clics, changement ++ en --, valeur conservée à 5 puis clic donnant 4 » n'a pas été observée de bout en bout dans le même onglet de débogage. Les valeurs et leur explication figurent dans les réponses comme résultats attendus, et non comme mesures effectuées.

Pour reproduire cette manipulation, sauvegarder le fichier final, reprendre le code initial dans `lib/main.dart`, lancer Chrome depuis VS Code, cliquer cinq fois, remplacer `_counter++` par `_counter--`, puis utiliser Hot Reload sans recharger la page du navigateur. Restaurer ensuite le fichier final.

Le prénom reste à confirmer par l'étudiant. Aucun dépôt distant n'a été créé ni publié.
