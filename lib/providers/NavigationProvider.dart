import 'package:brogam/screens/Home/BookingsScreen/BookingsScreen.dart';
import 'package:brogam/screens/Home/ExploreScreen/ExploreScreen.dart';
import 'package:brogam/screens/Home/HomeScreen/home_screen.dart';
import 'package:brogam/screens/Home/Profile/ProfileDetails/ProfileDetails.dart';
import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Widget getCurrentScreen() {
    switch (_currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ExploreScreen();
      case 2:
        return const BookingsScreen();
      case 3:
        return ProfileDetailsScreen();
      default:
        return const HomeScreen();
    }
  }

}
