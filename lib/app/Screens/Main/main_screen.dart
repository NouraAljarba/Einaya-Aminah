import 'package:einayaaminah/app/Screens/Preference/preference_screen.dart';
import 'package:flutter/material.dart';
import '../../core/utilities/Constants/spacing.dart';
import '../Home/home_screen.dart';
import '../Settings/settings_screen.dart';

/// Represents the main screen with a floating navigation bar.
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedPageIndex = 0;
  final _pageViewController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _createPageView(),
          _createFloatingNavBar(),
          _createCenterNavigationButton(),
        ],
      ),
    );
  }

  /// Creates the main content using a PageView.
  Widget _createPageView() {
    return PageView(
      controller: _pageViewController,
      onPageChanged: (index) {
        setState(() {
          _selectedPageIndex = index;
        });
      },
      children: const [
        HomeScreen(),
        PreferenceScreen(),
        SettingsScreen(),
      ],
    );
  }

  /// Creates the floating navigation bar.
  Widget _createFloatingNavBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.black,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _createNavigationItem(Icons.settings, 2),
              ResponsiveSpacing.width(context, small),
              _createNavigationItem(Icons.person, 1),
            ],
          ),
        ),
      ),
    );
  }

  /// Creates an individual navigation item.
  Widget _createNavigationItem(IconData icon, int index) {
    return IconButton(
      iconSize: 40,
      icon: Icon(icon,
          color: _selectedPageIndex == index
              ? Theme.of(context).primaryColor
              : Colors.white),
      onPressed: () {
        _pageViewController.jumpToPage(index);
      },
    );
  }

  /// Creates the central navigation button.
  Widget _createCenterNavigationButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black, width: 2),
          ),
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () {
              _pageViewController.jumpToPage(0);
            },
            child: const Icon(Icons.qr_code_scanner, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
