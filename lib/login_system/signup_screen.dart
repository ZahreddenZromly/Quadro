// user_signup_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadro/login_system/auth_service.dart';

import '../components/my_button.dart';
import '../components/my_text_feild.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});
//
//   @override
//   _SignUpScreenState createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _isPasswordVisible = false;
//   bool isEmailValid = true;
//   bool isPasswordValid = true;
//   bool isPasswordMatch = true;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         title: Text('Sign Up'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Form(
//               key: _formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextFormField(
//                     keyboardType: TextInputType.emailAddress,
//                     controller: emailController,
//                     decoration: InputDecoration(
//                       labelText: 'Email',
//                       hintText: 'Example@gmail.com',
//                       filled: true,
//                       fillColor: Colors.white,
//                       errorText: isEmailValid ? null : 'Invalid email',
//                       border: const OutlineInputBorder(),
//                       prefixIcon: const Icon(Icons.email),
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide: const BorderSide(color: Colors.grey),
//                       ),
//                       focusedBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey),
//                       ),
//                     ),
//                     onChanged: (value) {
//                       setState(() {
//                         isEmailValid = isValidEmail(value);
//                       });
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   TextFormField(
//                     controller: passwordController,
//                     obscureText: !_isPasswordVisible,
//                     decoration: InputDecoration(
//                       labelText: 'Password',
//                       errorText: isPasswordValid ? null : 'Invalid password',
//                       prefixIcon: const Icon(Icons.lock),
//                       filled: true,
//                       fillColor: Colors.white,
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide: const BorderSide(color: Colors.grey),
//                       ),
//                       focusedBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey),
//                       ),
//                       suffixIcon: IconButton(
//                         icon: Icon(
//                           _isPasswordVisible
//                               ? Icons.visibility
//                               : Icons.visibility_off,
//                         ),
//                         onPressed: () {
//                           setState(() {
//                             _isPasswordVisible = !_isPasswordVisible;
//                           });
//                         },
//                       ),
//                     ),
//                     onChanged: (value) {
//                       setState(() {
//                         isPasswordValid = isValidPassword(value);
//                         isPasswordMatch = passwordController.text == confirmPasswordController.text;
//                       });
//                     },
//                   ),
//                   const SizedBox(height: 20),
//                   TextFormField(
//                     controller: confirmPasswordController,
//                     obscureText: !_isPasswordVisible,
//                     decoration: InputDecoration(
//                       labelText: 'Confirm Password',
//                       errorText: isPasswordMatch ? null : 'Passwords do not match',
//                       prefixIcon: const Icon(Icons.lock),
//                       filled: true,
//                       fillColor: Colors.white,
//                       enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15),
//                         borderSide: const BorderSide(color: Colors.grey),
//                       ),
//                       focusedBorder: const OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.grey),
//                       ),
//                     ),
//                     onChanged: (value) {
//                       setState(() {
//                         isPasswordMatch = passwordController.text == value;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             // ... other widgets ...
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate() && isPasswordMatch) {
//                   _signUp().then((_) {
//                     Navigator.pop(context, MaterialPageRoute(builder: (context) => const Login()));
//                   });
//                 }
//               },
//               child: const Text('Sign Up'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _signUp() async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: emailController.text,
//         password: passwordController.text,
//       );
//
//       // User registration successful
//       print('User registered: ${userCredential.user!.uid}');
//     } catch (e) {
//       // Handle registration errors
//       print('Error during registration: $e');
//     }
//   }
//
//
//   bool isValidEmail(String email) {
//     if (email.isEmpty) {
//       return false;
//     }
//     final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
//     return emailRegex.hasMatch(email);
//   }
//
//   bool isValidPassword(String password) {
//     if (password.isEmpty) {
//       return false;
//     }
//     return password.length >= 6;
//   }
// }

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password do not match"),
          backgroundColor: Colors.teal,
        ),
      );
      return;
    }
    // get the auth service
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailandPassword(
        emailController.text,
        passwordController.text,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                //Logo
                Icon(
                  Icons.lock,
                  size: 100,
                  color: Colors.teal[800],
                ),
                const SizedBox(height: 50),
                //create account message
                const Text(
                  'Lets create an account for you!',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                //email textfeild
                MyTextFeild(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                //password textfeild

                MyTextFeild(
                  controller: passwordController,
                  hintText: 'Paswword',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                //confirm password

                MyTextFeild(
                  controller: confirmPasswordController,
                  hintText: 'Confirm password',
                  obscureText: true,
                ),

                const SizedBox(height: 25),

                //sign Up button
                MyButton(
                  onTap: signUp,
                  text: 'SignUp',
                ),

                const SizedBox(height: 50),

                //not a member register now

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already  a member?'),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'LogIn Now',
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
