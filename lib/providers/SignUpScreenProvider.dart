import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../screens/Home/HomeScreen/home_screen.dart';
import '../services/Services/Authentication/authentication.dart';

class SignUpScreenProvider extends ChangeNotifier {
  bool _isPasswordVisible = false;
  final Authentication _authentication = Authentication();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }
  //
  // Future<User?> registerWithEmailAndPassword(
  //     String email, String password, BuildContext context, String role, String phoneNo) async {
  //   _isLoading = true;
  //   notifyListeners();
  //   try {
  //     User? user = await _authentication.registerWithEmailAndPassword(
  //         email, password, context, role,phoneNo );
  //     _isLoading = false;
  //     notifyListeners();
  //     return user;
  //   } catch (e) {
  //     _isLoading = false;
  //     notifyListeners();
  //     print('Error during registration: $e');
  //     return null;
  //   }
  // }
}