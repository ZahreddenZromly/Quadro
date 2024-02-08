import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class ProfileSettingsPage extends StatefulWidget {
  const ProfileSettingsPage({super.key});

  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _businessDetailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Settings'),
      ),
      body: SingleChildScrollView(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 10,
          margin: const EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your name',
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Contact Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  controller: _contactController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your contact details',
                  ),
                ),
                const SizedBox(height: 20.0),
                const Text(
                  'Location',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  controller: _locationController,
                  decoration: const InputDecoration(
                    hintText: 'Enter your location',
                  ),
                ),
                const SizedBox(height: 20.0),


                const SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      // Change the background color here
                      elevation: 10,
                    ),
                    onPressed: () {
                      // Update profile information
                      _updateProfile();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          'Update Profile', style: TextStyle(color: Colors
                          .white, fontWeight: FontWeight.bold, fontSize: 15)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateProfile() {
    String name = _nameController.text;
    String contactDetails = _contactController.text;
    String location = _locationController.text;
    String businessDetails = _businessDetailsController.text;

    // Access Firestore instance
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Add data to 'tow_user' collection
    firestore.collection('tow_user').add({
      'name': name,
      'contactDetails': contactDetails,
      'location': location,
      'businessDetails': businessDetails,
    }).then((value) {
      // Data added successfully
      print('Profile information added to Firestore');
    }).catchError((error) {
      // Error handling
      print('Failed to add profile information: $error');
    });
  }
}
