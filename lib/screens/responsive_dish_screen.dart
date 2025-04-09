// lib/screens/responsive_dish_screen.dart

import 'package:flutter/material.dart';
import 'package:recettotheque/models/dish.dart';
import 'package:recettotheque/services/data_service.dart';
import 'package:recettotheque/widgets/dish_detail_view.dart';
import 'package:recettotheque/widgets/dish_list_view.dart';

class ResponsiveDishScreen extends StatefulWidget {
  const ResponsiveDishScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ResponsiveDishScreenState createState() => _ResponsiveDishScreenState();
}

class _ResponsiveDishScreenState extends State<ResponsiveDishScreen> {
  final DataService _dataService = DataService();
  late Future<List<Dish>> _futureDishes;
  Dish? selectedDish;

  @override
  void initState() {
    super.initState();
    _futureDishes = _dataService.loadDishes();
  }

  void _onDishSelected(Dish dish) {
    setState(() {
      selectedDish = dish;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Dish>>(
      future: _futureDishes,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(child: Text('Erreur: ${snapshot.error}')),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Scaffold(
            body: Center(child: Text('Aucune recette trouvée')),
          );
        }
        final dishes = snapshot.data!;
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth >= 600) {
              // Mode master-detail pour écrans larges
              return Scaffold(
                appBar: AppBar(title: const Text('Recettes')),
                body: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: DishListView(
                        dishes: dishes, // on passe la liste chargée
                        onDishSelected: _onDishSelected,
                        selectedDish: selectedDish,
                      ),
                    ),
                    const VerticalDivider(width: 1),
                    Expanded(
                      flex: 2,
                      child:
                          selectedDish != null
                              ? DishDetailView(dish: selectedDish!)
                              : const Center(
                                child: Text('Sélectionnez une recette'),
                              ),
                    ),
                  ],
                ),
              );
            } else {
              // Mode écran étroit : navigation classique
              return Scaffold(
                appBar: AppBar(title: const Text('Recettes')),
                body: DishListView(
                  dishes: dishes, // on passe la liste chargée
                  onDishSelected: (dish) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DishDetailView(dish: dish),
                      ),
                    );
                  },
                ),
              );
            }
          },
        );
      },
    );
  }
}
