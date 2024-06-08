import 'package:app/core/theme/app_pallete.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'settings_screen.dart';
import '../../disease-profiles/presentation/scan_screen.dart';
import '../../distribution-profile/presentation/map_screen.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: const [
          // HomeScreen(),
          ScanScreen(),
          MapScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: AppPallete.mainGreen,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
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
        currentIndex: _selectedIndex,
        selectedItemColor: AppPallete.blackColor,
        unselectedItemColor: AppPallete.whiteColor,
        backgroundColor: AppPallete.mainGreen,
        type: BottomNavigationBarType.shifting,
        onTap: _onItemTapped,
      ),
    );
  }
}
