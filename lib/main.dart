import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';
import 'package:quadro/cubits/appointments/appointments_cubit.dart';

import 'package:quadro/cubits/towing_request/towing_cubit.dart';
import 'package:quadro/login_system/auth_gate.dart';
import 'package:quadro/login_system/auth_service.dart';
import 'package:quadro/screens/request_appointment_screen.dart';
import '../firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        BlocProvider(create: (_) => TowingCubit()),
        BlocProvider(create: (_) => AppointmentCubit()),
      ],
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
      // home: RequestAppointmentScreen(),
    );
  }
}
