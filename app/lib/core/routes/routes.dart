import 'package:Drtealeaf/core/loading/loading_screen.dart';
import 'package:Drtealeaf/core/theme/app_pallete.dart';
import 'package:Drtealeaf/features/auth/presentation/pages/login_page.dart';
import 'package:Drtealeaf/features/home/presentation/home_screen.dart';

import 'package:Drtealeaf/features/info/presentation/all_diseases_screen.dart';
import 'package:Drtealeaf/features/map/presentation/history.dart';
import 'package:Drtealeaf/features/map/presentation/map_screen.dart';
import 'package:Drtealeaf/features/scan/presentation/scan_screen.dart';
import 'package:Drtealeaf/features/settings/presentation/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/info/presentation/user_guides_screen.dart';

import '../../features/info/presentation/disease_detail_screen.dart'; // Import the DiseaseDetailScreen
import '../../features/info/data/disease_data.dart'; // Import the Disease class

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: '/loading',
  routes: [
    GoRoute(
      path: '/loading',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: LoadingScreen()),
    ),
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: LoginPage()),
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
              const NoTransitionPage(child: HomeScreen()),
        ),
        GoRoute(
          path: '/scan',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ScanScreen()),
        ),
        GoRoute(
          path: '/map',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: MapScreen()),
        ),
        GoRoute(
          path: '/settings',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: SettingsScreen()),
        ),
        GoRoute(
          path: '/all_diseases',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: AllDiseasesScreen()),
        ),
        GoRoute(
          path: '/user_guide',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: UserGuidesScreen()),
        ),
        GoRoute(
          path: '/history',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HistoryScreen()),
        ),
        GoRoute(
          path: '/disease_detail',
          pageBuilder: (context, state) {
            final disease =
                state.extra as Disease; // Get the disease from extra
            return NoTransitionPage(
                child: DiseaseDetailScreen(disease: disease));
          },
        ),
      ],
    ),
  ],
);

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppPallete.mainGreen,
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //   label: 'Settings',
          //   backgroundColor: AppPallete.mainGreen,
          // ),
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
    if (location == '/profile') {
      return 4;
    }
    return 0;
  }
}
