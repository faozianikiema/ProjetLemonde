import 'package:flutter/material.dart';
import 'package:monde_rattrapage/provider/rss_provider.dart';
import 'package:monde_rattrapage/screens/home_monde.dart';
import 'package:provider/provider.dart';

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
          seedColor: const Color.fromARGB(0, 251, 252, 255),
        ),
      ),
      home: ChangeNotifierProvider(
        create: (context) => RssProvider(),
        child: const HomeMonde(),
      ),
    );
  }
}
