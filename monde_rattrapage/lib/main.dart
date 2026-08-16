import 'package:flutter/material.dart';
import 'package:monde_rattrapage/screens/home_monde.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal Le Monde',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(146, 72, 172, 235),
        ),
      ),
      home: const HomeMonde(),
    );
  }
}
