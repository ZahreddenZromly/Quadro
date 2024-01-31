import 'package:flutter/material.dart';
import 'package:quadro/login_system/login_screen.dart';


class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            );
          },
          child: const Text('LogIn'),
        ),
      ),
    );
  }
}
