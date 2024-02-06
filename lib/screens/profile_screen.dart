import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:quadro/components/profile_options.dart';
import 'package:quadro/screens/settings.dart';
import 'package:quadro/screens/your_profile.dart';

import '../components/profile_image.dart';
import '../login_system/login_screen.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        children: [
          ProfileImage(title: " Profile"),
          const SizedBox(height: 10,),
          Options(
              arrow: Icons.arrow_forward_ios_outlined,
              icon: Icons.account_circle_rounded,
            option: "Your profile",
             onTap: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => const YourProfile()),
               );

                 }
          ),
          Options(
            icon: Icons.settings,
            option: "Settings",
              arrow: Icons.arrow_forward_ios_outlined,
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              }
          ),
          Options.twoArguments("Log out",Icons.logout_rounded ,(){
               showLogoutConfirmationDialog(context);
                }
            ),

            ],
          ),

      ),
    );
  }
}
Future<void> showLogoutConfirmationDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Logout Confirmation'),
        content: const Text('Are you sure you want to log out?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Perform the logout action here
              Navigator.of(context).pop(); // Close the dialog
            },

            child: const Text('Cancel',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 15
            ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Login()));
            } ,
            child: const Text('Logout',
              style: TextStyle(
              color: Colors.teal,
              fontSize: 15
            ),
          ),
          )],
      );
    },
  );
}