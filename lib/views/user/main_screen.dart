// import 'package:flutter/material.dart';
// import 'home_page.dart';
// import 'settings_page.dart';
// import 'profile_page.dart';

// class MainScreen extends StatefulWidget {
//   const MainScreen({Key? key}) : super(key: key);

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;

//   final List<Product> products = const [
//     Product(
//       name: 'Hoodie Yellow',
//       price: 69,
//       image: 'https://via.placeholder.com/200',
//       description: 'Cozy yellow hoodie.',
//     ),
//     Product(
//       name: 'iPhone 12',
//       price: 765,
//       image: 'https://via.placeholder.com/200',
//       description: 'Apple iPhone 12.',
//     ),
//     // Add more products here if needed
//   ];

//   late final List<Widget> _pages;

//   @override
//   void initState() {
//     super.initState();
//     _pages = [
//       HomePage(products: products),
//       const SettingsPage(),
//       const ProfilePage(),
//     ];
//   }

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Online Shop'),
//       ),
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
//         ],
//       ),
//     );
//   }
// }
