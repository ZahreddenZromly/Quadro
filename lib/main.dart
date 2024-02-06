import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quadro/components/navbar.dart';
import 'package:quadro/login_system/auth_gate.dart';
import 'package:quadro/login_system/auth_service.dart';
import 'package:quadro/login_system/login_screen.dart';
import 'package:quadro/screens/appointment_screen.dart';
import 'package:quadro/screens/towing_screen.dart';
import '../firebase/firebase_options.dart';
import '../screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthService(),
    child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: const Color.fromARGB(255, 232, 234, 222),
      ),

      home: const AuthGate(),
    );
  }
}
