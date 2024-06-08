import 'package:app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../routes/app_route_constant.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  final Widget child;
  const ScaffoldWithNavBar({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              print("Navigating to home");
              context.goNamed(AppRouteConstants.homeRouteName);
              break;
            case 1:
              print("Navigating to scan");
              context.goNamed(AppRouteConstants.scanRouteName);
              break;
            case 2:
              print("Navigating to map");
              context.goNamed(AppRouteConstants.mapRouteName);
              break;
            case 3:
              print("Navigating to settigs");
              context.goNamed(AppRouteConstants.settingsRouteName);
              break;
          }
        },
        selectedItemColor: AppPallete.blackColor,
        unselectedItemColor: AppPallete.whiteColor,
        backgroundColor: AppPallete.mainGreen,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
