import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quadro/components/my_button.dart';
import 'package:quadro/components/my_text_feild.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({Key? key, required this.onTap}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    try {
      // Sign in with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Retrieve the user's document based on email
      DocumentSnapshot userDoc = await _firestore
          .collection('normal_user')
          .doc(userCredential.user!.uid)
          .get();

      // Check if the user exists in the normal_user collection
      if (userDoc.exists) {
        Navigator.pushReplacementNamed(context, '/navbar');
        return;
      }

      // Retrieve the user's document based on email
      userDoc = await _firestore
          .collection('workshop_user')
          .doc(userCredential.user!.uid)
          .get();

      // Check if the user exists in the workshop_user collection
      if (userDoc.exists) {
        Navigator.pushReplacementNamed(context, '/workshop_home_screen');
        return;
      }

      // Retrieve the user's document based on email
      userDoc = await _firestore
          .collection('tow_user')
          .doc(userCredential.user!.uid)
          .get();

      // Check if the user exists in the tow_user collection
      if (userDoc.exists) {
        Navigator.pushReplacementNamed(context, '/request_towing');
        return;
      }

      // If user doesn't exist in any collection, show error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text("User not found"),
        ),
      );

    } catch (e) {
      // Handle sign-in errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                Icon(
                  Icons.lock,
                  size: 100,
                  color: Colors.teal[800],
                ),
                const SizedBox(height: 50),
                const Text(
                  'Welcome back you`ve been missed',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                MyTextFeild(
                  controller: emailController,
                  hintText: "Email",
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextFeild(
                  controller: passwordController,
                  hintText: "Password",
                  obscureText: true,
                ),
                const SizedBox(height: 25),
                MyButton(
                  onTap: signIn,
                  text: 'LogIn',
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Not a member?'),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'SignUp Now',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
