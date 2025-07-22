import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(decoration: InputDecoration(labelText: 'Username')),
              const SizedBox(height: 15),
              TextFormField(decoration: InputDecoration(labelText: 'Email')),
              const SizedBox(height: 15),
              TextFormField(obscureText: true, decoration: InputDecoration(labelText: 'Password')),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
                child: Text('Register'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
