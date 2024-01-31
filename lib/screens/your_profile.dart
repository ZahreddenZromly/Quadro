import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/profile_image.dart';
import '../components/text_field.dart';

class YourProfile extends StatefulWidget {
  const YourProfile({super.key});

  @override
  State<YourProfile> createState() => _YourProfileState();
}

class _YourProfileState extends State<YourProfile> {
    final String userName = "Mohamed";
    final String phoneNamber ="0910097738";
    final String Email ="jbbhvj@vyy.com";
    TextEditingController userNameController = TextEditingController();
    TextEditingController phoneNumberdController = TextEditingController();
    TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileImage(title: "Your Profile"),
              SizedBox(height: 20,),
              MyTextField(hintText: userName, obscureText: false,label: "Name", controller: userNameController,),
              SizedBox(height: 20,),
              MyTextField(hintText: phoneNamber, obscureText: false, label: "Phone Number", controller: phoneNumberdController,),
          
              SizedBox(height: 20,),
              MyTextField(hintText: Email, obscureText: false, label: "Email", controller: emailController, ),
            ],
          ),
        ),



      ),
);
  }

}
