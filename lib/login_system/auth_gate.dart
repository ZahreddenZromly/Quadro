import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quadro/login_system/login_or_register.dart';


class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is loged in
          if(snapshot.hasData){
            return const LoginOrRegister();
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
