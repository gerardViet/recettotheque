import 'package:recettotheque/models/ingredient.dart';

class Dish {
  final int id;
  final String name;
  final String recipeText; // explication de la recette
  final String photoPath; // chemin de la photo (URL ou asset)
  final List<Ingredient> ingredients; // liste des ingrédients associés
  final List<int> weights; // liste des poids des ingrédients
  final int servings; // nombre de parts

  Dish({
    required this.id,
    required this.name,
    required this.recipeText,
    required this.photoPath,
    required this.ingredients,
    required this.weights,
    required this.servings,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    // On convertit la liste d'ingrédients en appelant Ingredient.fromJson pour chacun
    var ingredientsList = <Ingredient>[];
    if (json['ingredients'] != null) {
      ingredientsList =
          (json['ingredients'] as List)
              .map((ing) => Ingredient.fromJson(ing))
              .toList();
    }
    // Convertir la liste des poids (on s'assure qu'il s'agit de int)
    var weightsList = <int>[];
    if (json['weights'] != null) {
      weightsList =
          (json['weights'] as List)
              .map((w) => w is int ? w : int.parse(w.toString()))
              .toList();
    }

    return Dish(
      id: json['id'],
      name: json['name'],
      recipeText: json['recipeText'],
      photoPath: json['photoPath'],
      servings: json['servings'],
      ingredients: ingredientsList,
      weights: weightsList,
    );
  }
}
