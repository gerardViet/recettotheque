// lib/services/data_service.dart

import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:recettotheque/models/dish.dart';

class DataService {
  Future<List<Dish>> loadDishes() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/dishes.json',
    );
    return parseDishes(jsonString);
  }

  // Extraction de la logique de parsing pour faciliter les tests
  List<Dish> parseDishes(String jsonString) {
    final List<dynamic> jsonData = jsonDecode(jsonString);
    return jsonData.map((dishJson) => Dish.fromJson(dishJson)).toList();
  }
}
