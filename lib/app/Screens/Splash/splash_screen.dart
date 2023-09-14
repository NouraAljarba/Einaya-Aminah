import 'package:einayaaminah/app/Screens/Main/main_screen.dart';
import 'package:einayaaminah/app/core/utilities/Shared/shared_pref/shared_data.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../OnBoarding/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  bool _isLoaded = false;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(microseconds: 750));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isLoaded = true;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: _isLoaded
            ? CasheData.getData(key: 'isLoggedIn') ?? false //if the user is logged in before skip the onboarding
                ? const MainScreen()
                : const OnBording()
            : Lottie.asset('assets/animation/logo.json',
                controller: _controller, onLoaded: (comp) {
                _controller.duration = comp.duration;
                _controller.forward();
              }),
      ),
    );
  }
}
