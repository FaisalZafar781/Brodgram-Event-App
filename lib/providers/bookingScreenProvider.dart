import 'package:flutter/material.dart';

class Bookingscreenprovider extends ChangeNotifier {
  int selectedToggleIndex = 0;

  void updateSelectedToggle(int index) {
    selectedToggleIndex = index;
    notifyListeners();
  }
}
