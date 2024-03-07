import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore package
import '../components/profile_image.dart';
import '../components/text_field.dart';

class YourProfile extends StatefulWidget {
  const YourProfile({Key? key}) : super(key: key);

  @override
  State<YourProfile> createState() => _YourProfileState();
}

class _YourProfileState extends State<YourProfile> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProfileImage(title: "Your Profile"),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: userNameController,
                  decoration:   InputDecoration(
                    labelText: 'Username', // Label text
                    hintText: 'Enter your username',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,// Hint text
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(

                  controller: phoneNumberController,
                  decoration:   InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'Enter your phone number',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                  ),
                ),
              ),
              const SizedBox(height: 20,),

              ElevatedButton(
                onPressed: () {
                  _saveUserData(); // Call method to save user data
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveUserData() async {
    try {
      // Access Firestore instance
      final firestoreInstance = FirebaseFirestore.instance;

      // Get user input from text controllers
      final userName = userNameController.text;
      final phoneNumber = phoneNumberController.text;
      final email = emailController.text;

      // Save user data to Firestore collection
      await firestoreInstance.collection('normal_user').add({
        'userName': userName,
        'phoneNumber': phoneNumber,
        'email': email,
      });

      // Show success message or navigate to next screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('User data saved successfully!')),
      );
    } catch (error) {
      // Handle errors
      print('Error saving user data: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error saving user data')),
      );
    }
  }
}
