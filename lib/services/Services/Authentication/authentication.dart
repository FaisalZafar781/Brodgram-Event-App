

import 'package:brogam/screens/Home/HomeScreen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../models/UserModel/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addUserToFirestore(UserModel user) async {
    try {
      await firestore.collection('users').doc(user.id).set(user.toMap());
    } catch (e) {
      print('Error adding user to Firestore: $e');
      throw e;
    }
  }

  Future<User?> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential = await _auth.signInWithCredential(credential);
        User? user = userCredential.user;
        print('User signed in: ${user?.displayName}');
        return user;
      }
    } catch (e) {
      print('Error signing in with Google: $e');
      return null;
    }
  }

  Future<User?> registerWithEmailAndPassword(
      String email,
      String password,
      BuildContext context,
      String role,
      String phoneNo,
      ) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      User? user = result.user;

      if (user != null) {
        UserModel userModel = UserModel(
            id: user.uid,
            name: user.displayName  ?? "",
            email: email,
            role: role,
            phoneNo: phoneNo
        );
        await addUserToFirestore(userModel);
        print('User created and added to Firestore: ${user.displayName}');
        return user;
      } else {
        print('User creation failed.');
        return null;
      }
    } catch (e) {
      print('Error during user registration: $e');
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(String email, String password, BuildContext context) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      print("logged in user");
      print(FirebaseAuth.instance.currentUser);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}

