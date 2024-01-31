// // user_signup_screen.dart
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class UserSignUpScreen extends StatefulWidget {
//   @override
//   _UserSignUpScreenState createState() => _UserSignUpScreenState();
// }
//
// class _UserSignUpScreenState extends State<UserSignUpScreen> {
//   // TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   // TextEditingController phoneController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Sign Up'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // TextField(
//             //   controller: nameController,
//             //   decoration: InputDecoration(labelText: 'Name'),
//             // ),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
//             ),
//             // TextField(
//             //   controller: phoneController,
//             //   decoration: InputDecoration(labelText: 'Phone Number'),
//             // ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             SizedBox(height: 20.0),
//             ElevatedButton(
//               onPressed: () {
//                 _signUp();
//               },
//               child: Text('Sign Up'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _signUp() async {
//     // Implement Firebase signup logic for user
//     try {
//       UserCredential userCredential =
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//
//       // User registration successful
//       print('User registered: ${userCredential.user!.uid}');
//
//
//     } catch (e) {
//       // Handle registration errors
//       print('Error during registration: $e');
//     }
//   }
// }
//
