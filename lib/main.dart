import 'package:flutter/material.dart';
import 'package:recettotheque/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recettotheque',
      theme: ThemeData(primarySwatch: Colors.blue),
      // Définir la page d'accueil
      home: const HomeScreen(),
    );
  }
}
