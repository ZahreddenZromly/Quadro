import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:quadro/components/profile_options.dart';
import 'package:quadro/login_system/auth_service.dart';
import 'package:quadro/screens/settings.dart';
import 'package:quadro/screens/your_profile.dart';
import '../components/profile_image.dart';

import '../login_system/login_or_register.dart';
import '../login_system/login_screen.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
  File? _image;

  void signOut(){
    final authService =Provider.of<AuthService>(context , listen: false);
    authService.SignOut();
  }
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
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  LoginOrRegister()));
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

