import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/profile_image.dart';

class YourProfile extends StatefulWidget {
  const YourProfile({super.key});

  @override
  State<YourProfile> createState() => _YourProfileState();
}

class _YourProfileState extends State<YourProfile> {
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            ProfileImage(title: "Your Profile"),
            SizedBox(height: 20,),
            buildTextField('Name', "userProfile.name"),
            SizedBox(height: 20,),
            buildTextField('Phone Number', 'userProfile.phoneNumber'),
            SizedBox(height: 20,),
            buildTextField('Email', "userProfile.email"),
            SizedBox(height: 20,),
            buildTextField('Gender', "userProfile.gender"),
          ],
        ),



      ),
);
  }
  Widget buildTextField(String label, String value) {
    return TextFormField(
      initialValue: value,
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
