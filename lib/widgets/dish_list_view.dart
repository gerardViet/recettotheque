// lib/widgets/dish_list_view.dart

import 'package:flutter/material.dart';
import 'package:recettotheque/models/dish.dart';

class DishListView extends StatelessWidget {
  final List<Dish> dishes; // liste des recettes chargées depuis le JSON
  final ValueChanged<Dish> onDishSelected;
  final Dish? selectedDish; // optionnel pour marquer la sélection

  const DishListView({
    super.key,
    required this.dishes,
    required this.onDishSelected,
    this.selectedDish,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dishes.length,
      itemBuilder: (context, index) {
        final dish = dishes[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ListTile(
            leading:
                dish.photoPath.isNotEmpty
                    ? Image.asset(
                      dish.photoPath,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )
                    : null,
            title: Text(dish.name),
            subtitle: Text("${dish.servings} parts"),
            selected: selectedDish != null && selectedDish!.id == dish.id,
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              onDishSelected(dish);
            },
          ),
        );
      },
    );
  }
}
