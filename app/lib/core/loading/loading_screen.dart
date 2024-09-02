// lib/core/loading/loading_screen.dart
import 'package:app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).go('/login');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          AppPallete.mainGreen, // Set your desired background color here
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: const Icon(
            Icons.scanner,
            size: 100,
            color: AppPallete.whiteColor,
          ),
        ),
      ),
    );
  }
}
