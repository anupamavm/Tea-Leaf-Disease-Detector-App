import '../routes/app_route_constant.dart';
import 'package:app/features/Base/presentation/home_screen.dart';
import 'package:app/features/Base/presentation/settings_screen.dart';
import 'package:app/features/auth/presentation/pages/login_page.dart';
import 'package:app/features/disease-profiles/presentation/scan_screen.dart';
import 'package:app/features/diseases/presentation/all_diseases.dart';
import 'package:app/features/distribution-profile/presentation/map_screen.dart';
import '../nav/ScaffoldWithNavBar.dart'; // Ensure this import path is correct
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/', // Set the initial location to /home
    routes: [
      GoRoute(
        name: AppRouteConstants.authRouteName,
        path: '/a',
        pageBuilder: (context, state) {
          print("Navigating to:  ");
          return const MaterialPage(child: LoginPage());
        },
      ),
      GoRoute(
        name: AppRouteConstants.homeRouteName,
        path: '/',
        pageBuilder: (context, state) {
          print("Loading home");
          return MaterialPage(
            child: ScaffoldWithNavBar(child: HomeScreen()),
          );
        },
      ),
      GoRoute(
        name: AppRouteConstants.scanRouteName,
        path: '/scan',
        pageBuilder: (context, state) {
          print("Loading scan");
          return MaterialPage(
            child: ScaffoldWithNavBar(child: ScanScreen()),
          );
        },
      ),
      GoRoute(
        name: AppRouteConstants.mapRouteName,
        path: '/map',
        pageBuilder: (context, state) {
          print("Loading map");
          return MaterialPage(
            child: ScaffoldWithNavBar(child: MapScreen()),
          );
        },
      ),
      GoRoute(
        name: AppRouteConstants.settingsRouteName,
        path: '/settings',
        pageBuilder: (context, state) {
          print("Loading settings");
          return MaterialPage(
            child: ScaffoldWithNavBar(child: SettingsScreen()),
          );
        },
      ),
      GoRoute(
        name: AppRouteConstants.allDiseasesRouteName,
        path: '/all_diseases',
        pageBuilder: (context, state) {
          print("Loading all diseases");
          return MaterialPage(
            child: ScaffoldWithNavBar(child: AllDiseases()),
          );
        },
      ),
    ],
  );
}
