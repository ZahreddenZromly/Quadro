import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quadro/login_system/signup_screen.dart';

import 'login_type.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

Future<FirebaseApp> _initializeFirebase() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  return firebaseApp;
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: FutureBuilder(
      future: _initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return const LoginPage();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ),
  );
}

class _LoginPageState extends State<LoginPage> {
  final _Formfield = GlobalKey<_LoginPageState>();
  bool _isPasswordVisible = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isEmailValid = true;
  bool isPasswordValid = true;

  static Future<User?> LoginUsinfEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user not found') {
        print('no user found for tha email');
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            print('heeeeeeeere: ${MediaQuery.of(context)}');
            // Navigator.pop(context); // Add navigation functionality here
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => NavBar(),
            //   ),
            // );
          },
        ),
        backgroundColor: Colors.teal,
        
        title: const Center(
          child: Text(
            'Sign In',
            style: TextStyle(
              fontSize: 32,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            key: _Formfield,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _usernameController,
                decoration:  InputDecoration(
                  labelText: 'Email',
                 hintText: 'Example@gmail.com',
                  filled: true,
                  fillColor: Colors.white,
                  errorText:  isEmailValid ? null : 'Invalid email',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.email),
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
              const SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
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
              const SizedBox(height: 10),
              const Row(
                children: [
                  Text(
                    'Forget password',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange.shade400,
                  ),
                  onPressed: () async {
                    if (isEmailValid && isPasswordValid) {
                      User? user = await LoginUsinfEmailPassword(
                          email: (_usernameController.text),
                          password: _passwordController.text,
                          context: context);
                      print(user);
                      if (user != null) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) =>  const LoginType(),
                          ),
                        );
                      }
                    }
                    else {
                      print('login falied');
                    }
        
                    // Add your authentication logic here
                    // For simplicity, always navigate to the second page
        
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => HomeScreen(),
                    //   ),
                    // );
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // const Text(
              //   '-----Or Sign With-----',
              //   style: TextStyle(
              //     color: Colors.grey,
              //     fontSize: 16,
              //     decoration: TextDecoration.none,
              //   ),
              // ),
              // const SizedBox(height: 40),
              // const Center(
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Icon(
              //         Icons.facebook_rounded,
              //         size: 50,
              //         color: Colors.blue,
              //       ),
              //       Padding(
              //         padding: EdgeInsets.only(right: 25.0),
              //       ),
              //       Icon(
              //         Icons.apple_rounded,
              //         size: 50,
              //       ),
              //       Padding(
              //         padding: EdgeInsets.only(right: 25.0),
              //       ),
              //       Icon(
              //         Icons.email_rounded,
              //         size: 50,
              //         color: Colors.red,
              //       ),
              //       Padding(
              //         padding: EdgeInsets.only(right: 25.0),
              //       ),
              //     ],
              //   ),
              // ),
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  'Don`t have an account?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool isValidEmail(String email) {
  // Implement your email validation logic here
  // For simplicity, a basic check is done here
  final RegExp emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  return emailRegex.hasMatch(email);

}
bool isValidPassword(String password) {
  // Implement your password validation logic here
  // For simplicity, a basic check is done here
  return password.length >= 6;
}
