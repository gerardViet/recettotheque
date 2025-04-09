# recettotheque

Recettotheque est une application de recettes culinaires développée en Flutter. Elle offre une expérience de lecture optimisée grâce à un design responsive qui s'adapte aussi bien aux mobiles qu'aux écrans plus larges (tablettes, ordinateurs).

Description
L'application se concentre sur la lecture et la découverte de recettes. Elle se compose de :

Écran d'accueil : Présente les instructions d'utilisation avec un bouton "Go" pour démarrer.

Liste des recettes : Un écran affichant une ListView de plats (recettes) disponibles.

Détail de recette : Un écran présentant toutes les informations d'un plat sélectionné (recette, nombre de parts, image, niveau de difficulté, liste des ingrédients avec leurs doses, calories, etc.).

Les modèles de données utilisés (Dish et Ingredient) sont conçus pour être stables et pourront être étendus ultérieurement pour intégrer d'autres entités (telles que Diet, Block, Day, Meal).

Structure du Projet

recettotheque/
├── lib/
│   ├── main.dart           # Point d'entrée de l'application
│   ├── models/             # Modèles de données (Dish, Ingredient, etc.)
│   ├── screens/            # Écrans de l'application (HomeScreen, DishScreen, DishDetailScreen)
│   ├── widgets/            # Widgets réutilisables (layout responsive, etc.)
│   └── services/           # Services de gestion des données (ex. intégration Directus)
├── pubspec.yaml            # Configuration du projet Flutter
└── README.md               # Ce fichier
Prérequis
Flutter installé sur votre machine.

Un IDE (VS Code, Android Studio, IntelliJ IDEA, etc.) configuré pour le développement Flutter.

Installation
Cloner le dépôt :
git clone https://github.com/gerardViet/recettotheque.git

Naviguer dans le dossier du projet :

cd recettotheque
Installer les dépendances :
flutter pub get

Lancer l'application :
flutter run

Fonctionnalités
Design Responsive :
Adaptation automatique de l'interface selon la taille de l'écran (affichage en master-detail sur écrans larges, navigation séquentielle sur mobile en portrait).

Navigation Simple et Intuitive :
Un écran d'accueil pour démarrer, une liste de recettes et un écran de détail pour une lecture approfondie.

Modèles de Données Structurés :
Utilisation des classes Dish et Ingredient pour gérer les données des recettes, avec la possibilité d'étendre ces modèles pour intégrer d'autres entités (Diet, Block, Day, Meal).

Perspectives d'Évolution
Intégration avec Directus :
Utilisation de Directus pour la gestion des données, en local dans un premier temps puis sur un serveur distant.

Extension des Fonctionnalités :
Intégration future des modèles complémentaires (Diet, Block, Day, Meal), ajout de la recherche, du filtrage, et d'une gestion d'état plus avancée (ex. avec Provider ou Riverpod).

Licence
Ce projet est distribué sous licence MIT. Consultez le fichier LICENSE pour plus de détails.

Contact
Pour toute question ou suggestion, vous pouvez ouvrir une issue sur GitHub ou me contacter à [slenderline@gmail.com].