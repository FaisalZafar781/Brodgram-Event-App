import 'package:flutter/material.dart';
import '../screens/Authentication/OnboardingScreen/SigninOnboardingScreen/signin_onboarding_screen.dart';

class PageProvider with ChangeNotifier {
  int _currentPage = 0;

  int get currentPage => _currentPage;

  void updatePage(int page) {
    _currentPage = page;
    notifyListeners();
  }
  void navigateToNextScreen(BuildContext context) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const SigninOnboardingScreen();
          },
        ),
      );

  }
}
