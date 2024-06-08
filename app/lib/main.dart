import 'package:app/screens/all_products_screen.dart';
import 'package:app/screens/home_screen.dart';
import 'package:app/screens/profile_screen.dart';
import 'package:app/screens/settings_screen.dart';
import 'package:app/screens/loading_screen.dart'; // Add this import
import 'package:app/screens/login_screen.dart'; // Add this import
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
      pageBuilder: (context, state) => NoTransitionPage(child: LoginScreen()),
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
          path: '/profile',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: ProfileScreen()),
        ),
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: SettingsScreen()),
        ),
        GoRoute(
          path: '/all-products',
          pageBuilder: (context, state) =>
              NoTransitionPage(child: AllProductsScreen()),
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
        backgroundColor: Colors.blueGrey,
        currentIndex: _calculateSelectedIndex(context),
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/');
              break;
            case 1:
              context.go('/profile');
              break;
            case 2:
              context.go('/settings');
              break;
            case 3:
              context.go('/all-products');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.list), label: 'All Products'),
        ],
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location == '/profile') {
      return 1;
    }
    if (location == '/settings') {
      return 2;
    }
    if (location == '/all-products') {
      return 3;
    }
    return 0;
  }
}
