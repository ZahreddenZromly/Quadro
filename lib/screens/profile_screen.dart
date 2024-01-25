import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../components/profile_options.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  File? _image;
  Future getImage() async {
    final XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Profile",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.teal,
                    radius: 80,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? Icon(
                      Icons.person,
                      size: 80,
                      color: Colors.white,
                    )
                        : null,
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: getImage,
                    child: Text('Change Profile Image',
                    style:TextStyle(
                      color: Colors.teal,
                    ),
                    ),
                  ),
                  SizedBox(height: 30,),

                  Text(
                    "Mohamed",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              ]
              ),
          SizedBox(height: 10,),
          Options(
            icon: Icons.account_circle_rounded,
            option: "Your profile",
             onTap: (){
                Navigator.pushNamed(context, "/");
              }
          ),
          Options(
            icon: Icons.settings,
            option: "Settings",
              onTap: (){
                Navigator.pushNamed(context, "/");
              }
          ),
          Options(
            icon: Icons.logout_rounded,
            option: "Log out",
              onTap: (){
                Navigator.pushNamed(context, "/");
              }
          ),
            ],
          ),

      ),
    );
  }
}
