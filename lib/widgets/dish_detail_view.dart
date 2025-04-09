import 'package:flutter/material.dart';
import 'package:recettotheque/models/dish.dart';

class DishDetailView extends StatelessWidget {
  final Dish dish;

  const DishDetailView({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(dish.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (dish.photoPath.isNotEmpty)
              Image.asset(dish.photoPath, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text('Recette :', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(dish.recipeText),
            const SizedBox(height: 16),
            Text(
              'Nombre de parts : ${dish.servings}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Ingrédients :',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: dish.ingredients.length,
              itemBuilder: (context, index) {
                final ingredient = dish.ingredients[index];
                final weight = dish.weights[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2.0,
                  ), // Espacement réduit
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          ingredient.name,
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        '$weight g',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
