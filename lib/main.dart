import 'package:flutter/material.dart';
import 'views/landing/Homepage.dart';
import 'views/landing/IntroScreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-COMMERCE',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const IntroScreen(),
        '/home': (context) => const Homepage(),
      },
    );
  }
}
