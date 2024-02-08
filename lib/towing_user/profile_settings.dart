import 'package:flutter/material.dart';

class ProfileSettingsPage extends StatefulWidget {
  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _businessDetailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Settings'),
      ),
      body: SingleChildScrollView(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 10,
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Contact Details',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  controller: _contactController,
                  decoration: InputDecoration(
                    hintText: 'Enter your contact details',
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Location',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(
                    hintText: 'Enter your location',
                  ),
                ),
                SizedBox(height: 20.0),


                SizedBox(height: 20.0),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal, // Change the background color here
                      elevation: 10,
                    ),
                    onPressed: () {
                      // Update profile information
                      _updateProfile();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Update Profile', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 15 )),
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
    // Fetch values from controllers and update profile information
    String name = _nameController.text;
    String contactDetails = _contactController.text;
    String location = _locationController.text;
    String businessDetails = _businessDetailsController.text;

    // Here you can implement your logic to update the profile information
    // For now, let's just print the values
    print('Name: $name');
    print('Contact Details: $contactDetails');
    print('Location: $location');
    print('Business Details: $businessDetails');
  }
}

