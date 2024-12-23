import 'package:brogam/screens/Authentication/LoginScreen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../screens/Home/HomeScreen/home_screen.dart';
import '../services/Services/Authentication/authentication.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool loader = false;
  bool isLoadingSignUp = false;

  final Authentication _authentication = Authentication();

  User? get user => _user;

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

  Future<User?> registerWithEmailAndPassword(
      String email, String password, BuildContext context, String role, String phoneNo) async {
    isLoadingSignUp = true;
    notifyListeners();

    try {
       await _authentication.registerWithEmailAndPassword(
          email, password, context, role, phoneNo ).then((value) {
         isLoadingSignUp = false;
         Navigator.pushReplacement(
           context,
           MaterialPageRoute(builder: (context) => LoginScreen()),
         );
          },);
      notifyListeners();
      // return user;
    } catch (e) {
      isLoadingSignUp = false;
      notifyListeners();
      print('Error during registration: $e');
      return null;
    }
  }
}
