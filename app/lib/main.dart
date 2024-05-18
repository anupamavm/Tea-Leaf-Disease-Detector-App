import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:app/core/theme/app_pallete.dart';
import 'package:app/core/theme/theme.dart';
import 'package:app/features/Base/presentation/base_page.dart';
import 'package:app/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Blog App",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightModeTheme,
      // home: AnimatedSplashScreen(
      //     duration: 3000,
      //     splash: Icons.home,
      //     nextScreen: const LoginPage(),
      //     splashTransition: SplashTransition.fadeTransition,
      //     // pageTransitionType: PageTransitionType.scale,
      //     backgroundColor: AppPallete.backgroundColor),
      home: BasePage(),
    );
  }
}
