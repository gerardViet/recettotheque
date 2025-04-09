import 'package:flutter/material.dart';
import 'package:recettotheque/screens/responsive_dish_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Par exemple, on peut utiliser un Stack pour l'image de fond et le contenu
      body: Stack(
        children: [
          // Image de fond
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/recette_book.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay pour améliorer la lisibilité (facultatif)
          // ignore: deprecated_member_use
          Container(color: Colors.black.withOpacity(0.3)),
          // Contenu centré : texte explicatif et bouton GO
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Bienvenue dans Recettotheque !\nDécouvrez vos recettes favorites.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Navigation vers l'écran de liste des recettes
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResponsiveDishScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 15,
                      ),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Text('GO'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
