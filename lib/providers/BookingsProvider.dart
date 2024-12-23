import 'package:brogam/screens/Home/EventBookingScreens/BookingSuccessScreen/booking_success_screen.dart';
import 'package:flutter/material.dart';

import '../screens/Home/Profile/ProfileDetails/ProfileDetails.dart';

class BookingProvider with ChangeNotifier {
  bool _isOngoing = true;

  bool get isOngoing => _isOngoing;

  void setOngoing(bool value) {
    _isOngoing = value;
    notifyListeners();
  }

  void navigateToTicket(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return BookingSuccessScreen();
          },
        ),
      );
    });
  }

  void navigateToProfile(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return ProfileDetailsScreen();
          },
        ),
      );
    });
  }
}
