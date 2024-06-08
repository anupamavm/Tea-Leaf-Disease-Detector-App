// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Simulate a login process
            GoRouter.of(context).go('/');
          },
          child: Text('Login'),
        ),
      ),
    );
  }
}
