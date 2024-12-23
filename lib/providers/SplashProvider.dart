import 'package:flutter/material.dart';

import '../screens/Authentication/OnboardingScreen/OnboardingScreen/OnboardingScreen.dart';

class SplashScreenProvider with ChangeNotifier {
  void navigateToNextScreen(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const OnboardingScreen();
          },
        ),
      );
    });
  }

}
