import 'package:app/core/theme/app_pallete.dart';
import 'package:app/features/auth/presentation/pages/login_page.dart';
import 'package:app/features/home/presentation/home_screen.dart';

import 'package:app/features/info/data/disease_data.dart' as diseases;

import 'package:app/features/map/presentation/map_screen.dart';
import 'package:app/features/scan/presentation/scan_screen.dart';

import 'package:app/features/settings/presentation/settings_screen.dart';
import 'package:app/core/loading/loading_screen.dart'; // Add this import
import 'package:app/features/info/presentation/all_diseases_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/loading',
  routes: [
    GoRoute(
      path: '/loading',
      pageBuilder: (context, state) => NoTransitionPage(child: LoadingScreen()),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => NoTransitionPage(child: LoginPage()),
    ),
    ShellRoute(
      navigatorKey: _rootNavigatorKey,
      builder: (context, state, child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: HomeScreen()),
        ),
        GoRoute(
          path: '/scan',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: ScanScreen()),
        ),
        GoRoute(
          path: '/map',
          pageBuilder: (context, state) => NoTransitionPage(child: MapScreen()),
        ),
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: SettingsScreen()),
        ),
        GoRoute(
          path: '/all_products',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: AllDiseasesScreen()),
        ),
      ],
    ),
  ],
);

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavBar({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 16, 63, 86),
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/scan');
              break;
            case 2:
              context.go('/map');
              break;
            case 3:
              context.go('/settings');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: AppPallete.mainGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scanner),
            label: 'Scan',
            backgroundColor: AppPallete.mainGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
            backgroundColor: AppPallete.mainGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: AppPallete.mainGreen,
          ),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location == '/scan') {
      return 1;
    }
    if (location == '/map') {
      return 2;
    }
    if (location == '/settings') {
      return 3;
    }
    return 0;
  }
}
