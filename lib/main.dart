import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:quadro/components/navbar.dart';
import 'package:quadro/login_system/login_screen.dart';
import 'package:quadro/screens/request_appointment_screen.dart';
import 'package:quadro/screens/towing_screen.dart';
import '../firebase/firebase_options.dart';
import '../screens/splash.dart';
import 'firebase/firebase_options.dart';
import 'screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
      // home: RequestAppointmentScreen(),
      home: TowingScreen(),
    );
  }
}
