import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(title: const Text('Profile')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(radius: 50, backgroundColor: Theme.of(context).primaryColor, child: Icon(Icons.person, size: 50, color: Colors.white)),
            const SizedBox(height: 20),
            Text('John Doe', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text('user@example.com', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 30),
            ListTile(
              leading: Icon(Icons.settings, color: Theme.of(context).primaryColor),
              title: const Text('Account Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Theme.of(context).primaryColor),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
