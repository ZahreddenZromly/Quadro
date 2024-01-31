import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/text_field.dart';

class PasswordManager extends StatefulWidget {
  const PasswordManager({super.key});

  @override
  State<PasswordManager> createState() => _PasswordManagerState();
}

class _PasswordManagerState extends State<PasswordManager> {
 String password ="jvy" ;
 TextEditingController CurrentPasswordController = TextEditingController();
 TextEditingController NewPasswordController = TextEditingController();
 TextEditingController ConfirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Password Manager")
            ],
          ),
            SizedBox(height: 20,),
            MyTextField(obscureText: true,hintText: password,
              controller:CurrentPasswordController,label: "Current Password",  ),
            SizedBox(height: 20,),
            Row(
              children: [
                Spacer(),
                InkWell(
                  child: Text("Forgot Password?",
                    style: TextStyle(
                      color: Colors.teal
                    ),
        
                  ),
                )
              ],
            ),
            MyTextField(obscureText: true,hintText:" ",
              controller:NewPasswordController,label: "New Password",  ),
            SizedBox(height: 20,),
            MyTextField(obscureText: true,hintText:" ",
              controller:ConfirmPasswordController,label: "Confirm New Password",  ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
        
                ),
                onPressed: () {
                  // Your button action goes here
                },
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text('change Password',
                  style: TextStyle(
                    color: Colors.white
                  ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
