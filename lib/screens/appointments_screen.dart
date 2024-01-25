import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quadro/screens/login_screen.dart';

import 'home_screen.dart';

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
                builder: (context) => Login(),
              ),
            );
          },
          child: Text('LogIn'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var snackBar = const SnackBar(
            backgroundColor: Colors.teal,
            content: Center(
              child: Text('Do You Want To Logout?'),
            ),
            closeIconColor: Colors.red,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}
