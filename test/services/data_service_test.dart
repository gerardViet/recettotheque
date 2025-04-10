// test/services/data_service_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:recettotheque/models/dish.dart';
import 'package:recettotheque/services/data_service.dart';

void main() {
  group('DataService', () {
    test(
      'parseDishes should convert valid JSON string into list of Dishes',
      () {
        // Exemple de chaîne JSON de test
        final jsonString = '''
      [
        {
          "id": 1,
          "name": "Salade Caprese",
          "recipeText": "Coupez les tomates et la mozzarella en tranches.\\nDisposez-les sur une assiette.\\nAjoutez quelques feuilles de basilic.",
          "photoPath": "assets/images/caprese.jpg",
          "servings": 2,
          "ingredients": [
            {"id": 1, "name": "Tomate"},
            {"id": 2, "name": "Mozzarella"},
            {"id": 3, "name": "Basilic"}
          ],
          "weights": [100, 150, 5]
        },
        {
          "id": 2,
          "name": "Salade Caesar",
          "recipeText": "Préparez la sauce.\\nFaites cuire le poulet.\\nAssemblez le tout.",
          "photoPath": "assets/images/saladeCaesar.jpg",
          "servings": 4,
          "ingredients": [
            {"id": 1, "name": "salade verte"},
            {"id": 2, "name": "viande de poulet"},
            {"id": 3, "name": "pain de mie"},
            {"id": 4, "name": "yaourt nature"}
          ],
          "weights": [300, 300, 120, 180]
        }
      ]
      ''';

        final dataService = DataService();
        final dishes = dataService.parseDishes(jsonString);

        expect(dishes, isA<List<Dish>>());
        expect(dishes.length, equals(2));
        expect(dishes[0].name, equals("Salade Caprese"));
        expect(dishes[1].servings, equals(4));
      },
    );
  });
}
