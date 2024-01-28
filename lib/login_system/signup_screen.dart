// user_signup_screen.dart
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _Formfield = GlobalKey<_SignUpScreenState>();
  bool _isPasswordVisible = false;
  bool isEmailValid = true;
  bool isPasswordValid = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // TextField(
            //   controller: nameController,
            //   decoration: InputDecoration(labelText: 'Name'),
            // ),
            Form(
              key: _Formfield,
              child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration:  InputDecoration(
                  labelText: 'Email',
                  hintText: 'Example@gmail.com',
                  filled: true,
                  fillColor: Colors.white,
                  errorText:  isEmailValid ? null : 'Invalid email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    isEmailValid = isValidEmail(value);
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: isPasswordValid ? null : 'Invalid password',
                prefixIcon: const Icon(Icons.lock),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),

                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              onChanged: (value) {
                setState(() {
                  isPasswordValid = isValidPassword(value);
                });
              },
            ),
            // TextField(
            //   controller: passwordController,
            //   decoration: InputDecoration(labelText: 'Password'),
            //   obscureText: true,
            // ),
            const SizedBox(height: 20),
            const Text(
              '-----Or Sign With-----',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                decoration: TextDecoration.none,
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.facebook_rounded,
                    size: 50,
                    color: Colors.blue,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 25.0),
                  ),
                  Icon(
                    Icons.apple_rounded,
                    size: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 25.0),
                  ),
                  Icon(
                    Icons.email_rounded,
                    size: 50,
                    color: Colors.red,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 25.0),
                  ),
                ],
              ),
            ),
             const SizedBox(height: 60.0),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  _signUp();
                },
                child: const Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // User registration successful
      print('User registered: ${userCredential.user!.uid}');


    } catch (e) {
      // Handle registration errors
      print('Error during registration: $e');
    }
  }
}

bool isValidEmail(String email) {
  if (email.isEmpty) {
    return false;
  }
  final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  return emailRegex.hasMatch(email);
}

bool isValidPassword(String password) {
  if (password.isEmpty) {
    return false;
  }
  return password.length >= 6;
}
