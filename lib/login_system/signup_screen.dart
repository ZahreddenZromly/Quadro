import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadro/login_system/auth_service.dart';
import '../components/my_button.dart';
import '../components/my_text_feild.dart';

// Define an enum to represent different types of users
enum UserType {
  User,
  Workshop,
  Tow,
}

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  UserType? selectedUserType;
  late final String userType;

  void signUp() async {
    if (selectedUserType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select user type"),
          backgroundColor: Colors.teal,
        ),
      );
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Passwords do not match"),
          backgroundColor: Colors.teal,
        ),
      );
      return;
    }

    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      var userCredential = await authService.signUpWithEmailandPassword(
        emailController.text,
        passwordController.text,
        selectedUserType.toString(),
      );

      var user = userCredential.user;
      if (user != null) {
        String uid = user.uid;
        String collectionName;
        switch (selectedUserType) {
          case UserType.User:
            collectionName = 'normal_user';
            break;
          case UserType.Workshop:
            collectionName = 'workshop_user';
            break;
          case UserType.Tow:
            collectionName = 'tow_user';
            break;
          default:
            throw Exception("Invalid user type");
        }

        await FirebaseFirestore.instance
            .collection(collectionName)
            .doc(uid)
            .set({
          'email': emailController.text,
          'password': passwordController.text,
          'role': selectedUserType.toString().split('.').last,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Sign up successful"),
            backgroundColor: Colors.teal,
          ),
        );

        // Delay navigation back to login page after 3 seconds
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.of(context)
              .pushNamed('/login_or_register'); // Pop to login page
        });
      }
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                const SizedBox(height: 50),
                // Logo
                Icon(
                  Icons.lock,
                  size: 100,
                  color: Colors.teal[800],
                ),
                const SizedBox(height: 50),
                // Create account message
                const Text(
                  'Lets create an account for you!',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                // Email text field
                MyTextFeild(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                // Password text field
                MyTextFeild(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // Confirm password
                MyTextFeild(
                  controller: confirmPasswordController,
                  hintText: 'Confirm password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),
                const Text(
                  "Please Select What You Want to login for!",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10),
                // Chips for user type selection
                Center(
                  child: Row(
                    children: [
                      buildUserTypeChip(UserType.User, 'normal User'),
                      const SizedBox(width: 10.0),
                      // Add some spacing between chips
                      buildUserTypeChip(UserType.Workshop, 'WorkShop'),
                      const SizedBox(width: 10.0),
                      // Add some spacing between chips
                      buildUserTypeChip(UserType.Tow, 'Tow'),
                    ],
                  ),
                ),

                const SizedBox(height: 25),
                // Sign Up button
                MyButton(
                  onTap: signUp,
                  text: 'SignUp',
                ),

                const SizedBox(height: 50),

                // Not a member register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already a member?'),
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

  Widget buildUserTypeChip(UserType type, String label) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedUserType = type;
        });
      },
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: selectedUserType == type ? Colors.white : Colors.black,
          ),
        ),

        backgroundColor:
            selectedUserType == type ? Colors.teal : Colors.grey.shade300,
        side: const BorderSide(color: Colors.teal),
      ),
    );
  }
}
