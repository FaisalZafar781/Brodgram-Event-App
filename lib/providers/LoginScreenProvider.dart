import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../screens/Home/HomeScreen/home_screen.dart';
import '../services/Services/Authentication/authentication.dart';

class LoginScreenProvider extends ChangeNotifier {
  bool _isPasswordVisible = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;
  User? get user => _user;
  bool get isPasswordVisible => _isPasswordVisible;
  bool loader = false;
  bool isLoadingSignIn = false;

  final Authentication _authentication = Authentication();
  Authentication authentication = Authentication();

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    loader = true;
    try {
      _user = await _authentication.signInWithGoogle(context);
      if (_user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
      loader = false;
      notifyListeners();
    } catch (e) {
      loader = false;
      notifyListeners();
    }
  }

  Future<User?> signInWithEmailAndPassword(String email, String password, BuildContext context) async {
    try {
      isLoadingSignIn = true;
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      _user = result.user;
      isLoadingSignIn = false;
      notifyListeners();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      return _user;
    } catch (e) {
      print("Error signing in: ${e.toString()}");
      return null;
    }
  }
}