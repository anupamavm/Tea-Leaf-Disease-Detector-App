// lib/screens/loading_screen.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulate a loading process
    Future.delayed(Duration(seconds: 3), () {
      // Assume the user is not logged in
      GoRouter.of(context).go('/login');
    });

    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
