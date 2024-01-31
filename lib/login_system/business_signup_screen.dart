// // business_signup_screen.dart
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class BusinessSignUpScreen extends StatefulWidget {
//   @override
//   _BusinessSignUpScreenState createState() => _BusinessSignUpScreenState();
// }
//
// class _BusinessSignUpScreenState extends State<BusinessSignUpScreen> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController companyNameController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController companyTypeController = TextEditingController();
//   TextEditingController locationController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Business Sign Up'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: nameController,
//               decoration: InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: companyNameController,
//               decoration: InputDecoration(labelText: 'Company Name'),
//             ),
//             TextField(
//               controller: phoneController,
//               decoration: InputDecoration(labelText: 'Phone Number'),
//             ),
//             TextField(
//               controller: passwordController,
//               decoration: InputDecoration(labelText: 'Password'),
//               obscureText: true,
//             ),
//             TextField(
//               controller: companyTypeController,
//               decoration: InputDecoration(labelText: 'Company Type'),
//             ),
//             TextField(
//               controller: locationController,
//               decoration: InputDecoration(labelText: 'Location'),
//             ),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(labelText: 'Email'),
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
//     // Implement Firebase signup logic for business
//     try {
//       UserCredential userCredential =
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//
//       // Business registration successful
//       print('Business registered: ${userCredential.user!.uid}');
//
//       // You can also store additional business information in Firestore
//       // Firestore.instance.collection('businesses').doc(userCredential.user.uid).set({
//       //   'name': nameController.text,
//       //   'companyName': companyNameController.text,
//       //   'phone': phoneController.text,
//       //   'companyType': companyTypeController.text,
//       //   'location': locationController.text,
//       //   'email': emailController.text,
//       // });
//
//       // Navigate to another screen or perform any post-registration logic
//     } catch (e) {
//       // Handle registration errors
//       print('Error during registration: $e');
//     }
//   }
// }
