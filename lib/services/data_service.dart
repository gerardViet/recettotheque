// lib/services/data_service.dart
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:recettotheque/models/dish.dart';

class DataService {
  Future<List<Dish>> loadDishes() async {
    //print("Début du chargement du JSON");
    final String jsonString = await rootBundle.loadString(
      'assets/data/dishes.json',
    );
    //print("JSON chargé : $jsonString");
    final List<dynamic> jsonData = jsonDecode(jsonString);
    // print("Nombre de recettes dans le JSON : ${jsonData.length}");
    return jsonData.map((dishJson) => Dish.fromJson(dishJson)).toList();
  }
}
