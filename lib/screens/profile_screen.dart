import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:quadro/components/profile_options.dart';
import 'package:quadro/screens/your_profile.dart';

import '../components/profile_image.dart';

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
          SizedBox(height: 10,),
          Options(
              arrow: Icons.arrow_forward_ios_outlined,
              icon: Icons.account_circle_rounded,
            option: "Your profile",
             onTap: (){
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => YourProfile()),
               );

                 }
          ),
          Options(
            icon: Icons.settings,
            option: "Settings",
              arrow: Icons.arrow_forward_ios_outlined,
              onTap: (){
                Navigator.pushNamed(context, "/");
              }
          ),
          Options.twoArguments("Log out",Icons.logout_rounded ,(){
                  Navigator.pushNamed(context, "/");
                }
            ),

            ],
          ),

      ),
    );
  }
}
