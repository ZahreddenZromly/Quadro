import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  // instance of auth
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // signin
  Future<UserCredential> signInWithEmailandPassword(
      String email, String password,) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Create new document in Firestore with user information including role
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        // Add role to user document
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // create user
  Future<UserCredential> signUpWithEmailandPassword(
      String email, String password, String role) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Create new document in Firestore with user information including role
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
        'role': role, // Add role to user document
      });

      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }



// sign out
  Future<void> SignOut() async {
    return await FirebaseAuth.instance.signOut();
  }

  // Get user role
  Future<String?> getUserRole() async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        DocumentSnapshot userDoc =
        await _firestore.collection('users').doc(user.uid).get();
        if (userDoc.exists) {
          // Retrieve user role from Firestore document
          return userDoc.get('role');
        }
      }
      return null; // User not found or user document doesn't exist
    } catch (e) {
      // Handle any errors
      print("Error getting user role: $e");
      return null;
    }
  }
}
