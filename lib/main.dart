import 'package:ecommerce_app/views/authentication/Home_screen.dart';
import 'package:ecommerce_app/views/authentication/login_page.dart';
import 'package:ecommerce_app/views/authentication/register_page.dart';
import 'package:flutter/material.dart';
import 'themes/themes.dart';
import 'views/landing/Homepage.dart';
import 'views/landing/IntroScreen.dart';
import 'views/authentication/Home_screen.dart';
import 'views/authentication/login_page.dart';
import 'views/authentication/register_page.dart';


final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-COMMERCE',

      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: currentMode,

      initialRoute: '/',
      routes: {
        '/': (context) => const IntroScreen(),
        '/home': (context) => const Homepage(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/homepage': (context) => HomeScreen()
      },
    );
      }
    );
  }
}
