import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quadro/login_system/login_or_register.dart';
import 'package:quadro/login_system/login_type.dart';

import '../screens/home_screen.dart';
import 'login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is loged in
          if(snapshot.hasData){
            return const LoginType();
          }
          //user is not loged in
          else {
            return const LoginOrRegister();
          }
        }
      ),
    );
  }
}
