import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:quadro/components/navbar.dart';
import 'package:quadro/login_system/login_screen.dart';
import 'package:quadro/screens/appointment_screen.dart';
import 'package:quadro/screens/towing_screen.dart';
import '../firebase/firebase_options.dart';
import '../screens/splash.dart';
=======
import 'firebase/firebase_options.dart';
import 'screens/splash.dart';
>>>>>>> d99a1332decfe87ff2983190722a28bf33979fd6

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
<<<<<<< HEAD
      home: SplashScreen(),
// <<<<<<< HEAD:lib/main.dart
      // home: RequestAppointmentScreen(),
// =======
=======
      home: const SplashScreen(),
>>>>>>> d99a1332decfe87ff2983190722a28bf33979fd6

// >>>>>>> 08c83b1e4cc8aa4f443ff836f3794aad02303ffa:lib/widgets/main.dart
    );
  }
}
