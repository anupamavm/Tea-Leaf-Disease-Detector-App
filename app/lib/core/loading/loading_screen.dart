import 'package:Drtealeaf/core/theme/app_pallete.dart';
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

    // Navigate to the login screen after 3 seconds
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
      backgroundColor: AppPallete.mainGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Fade transition for the logo
            FadeTransition(
              opacity: _animation,
              child: Image.asset(
                'assets/logo.png', // Path to your PNG logo
                width: 100, // Set the desired width
                height: 100, // Set the desired height
              ),
            ),
            const SizedBox(height: 16), // Space between logo and text

            // Fade transition for the text
            FadeTransition(
              opacity: _animation,
              child: const Text(
                'Dr.TeaLeaf',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppPallete.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
