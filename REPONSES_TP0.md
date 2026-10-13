# TP0 — Installation et prise en main de Flutter

## Installation et exécution

- SDK : `C:\Users\PC\dev\flutter`, canal stable.
- Projet : `D:\Flutter\TP0\trying_flutter`.
- Éditeur : VS Code avec les extensions Flutter et Dart de Dart Code.
- Cible : Chrome. Android et Windows desktop ne sont pas nécessaires pour ce TP Web.

Depuis le dossier `trying_flutter` :

```powershell
flutter --version
dart --version
flutter doctor -v
flutter devices
flutter run -d chrome
```

## Première manipulation et Hot Reload

1. Le compteur initial part de 0. Cinq clics avec `_counter++` donnent 5.
2. Remplacer `_counter++` par `_counter--` change l'action des prochains clics.
3. Le Hot Reload conserve l'état du widget : le compteur reste à 5. Le clic suivant donne 4.
4. `setState()` signale à Flutter que l'état a changé et demande une nouvelle construction de l'interface. Le Hot Restart, contrairement au Hot Reload, réinitialise l'état.
5. L'icône et l'action sont distinctes : une icône `Icons.add` ne garantit pas une incrémentation.

## Personnalisation et remise à zéro

- Le titre de l'AppBar est `EMSI Flutter`.
- Le texte descriptif affiche le prénom.
- Le bouton « Réinitialiser » affecte `_counter = 0` dans `setState()`.
- L'affectation modifie la donnée ; `setState()` demande de reconstruire l'affichage pour qu'il reflète cette donnée.

## Apparence du compteur

1. Le widget `Text` affiche du texte.
2. Sa propriété `style` définit notamment la couleur, la taille, la graisse et la police.
3. Modifier la couleur ou la taille change l'apparence ; modifier la fonction `onPressed` change le comportement.
4. La valeur du compteur est bleue et sa taille est de 40 pixels logiques. L'AppBar possède une couleur de fond explicite. Le bouton flottant utilise `Icons.remove`.

## Incrémentation

1. `_counter++` ou `_counter += 1` augmente le compteur d'une unité.
2. `setState()` demande l'actualisation des widgets dépendant du compteur.
3. Sans `setState()`, la variable change mais l'affichage peut conserver l'ancienne valeur jusqu'à une autre reconstruction.

## Modification du pas

1. `_counter++` ajoute 1 ; `_counter += 5` ajoute 5.
2. À partir de 10, trois décrémentations de 2 donnent : 8, 6, puis **4**.
3. Le bouton d'incrémentation final ajoute 5. Le bouton flottant retire 2. La réinitialisation reste indépendante du pas et affecte 0.

## Empêcher les valeurs négatives

La méthode teste d'abord `if (_counter > 0)`. Si la valeur vaut au moins 2, elle retire 2 ; si elle vaut 1, elle revient à 0. À zéro, elle ne fait rien. Tester seulement `_counter > 0` puis soustraire 2 serait insuffisant : 1 deviendrait −1.

## Message dynamique

1. Une expression conditionnelle choisit le texte :

```dart
_counter == 0 ? 'Compteur à zéro' : 'Compteur positif'
```

2. Le message dépend de `_counter` et est calculé dans `build()`.
3. `setState()` provoque la reconstruction : la valeur affichée et le message sont donc actualisés ensemble.

## Résultat final attendu

| Action | Valeur | Message |
|---|---:|---|
| Démarrage | 0 | Compteur à zéro |
| Incrémenter | 5 | Compteur positif |
| Décrémenter | 3 | Compteur positif |
| Décrémenter | 1 | Compteur positif |
| Décrémenter | 0 | Compteur à zéro |
| Décrémenter à zéro | 0 | Compteur à zéro |
| Incrémenter deux fois | 10 | Compteur positif |
| Réinitialiser | 0 | Compteur à zéro |

Les exemples de Hot Reload ci-dessus expliquent les observations attendues ; les vérifications effectivement réalisées sont consignées dans `VALIDATION.md`.
