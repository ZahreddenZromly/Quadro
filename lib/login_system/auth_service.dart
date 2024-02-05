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
      String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      // add a new user document fot the user in users collection if it doesnt already exist
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      }, SetOptions(merge: true));

      return userCredential;
      // catch any error
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  // create user
  Future<UserCredential> signUpWithEmailandPassword(
      String email, password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      // create new doc in fire store
      _firestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
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
}
