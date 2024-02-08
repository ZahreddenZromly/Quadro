import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore



class WorkshopProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WorkshopDetailsPage();
  }
}

class WorkshopDetailsPage extends StatefulWidget {
  @override
  _WorkshopDetailsPageState createState() => _WorkshopDetailsPageState();
}

class _WorkshopDetailsPageState extends State<WorkshopDetailsPage> {
  // Define variables to hold workshop details
  String workshopName = '';
  String address = '';
  String contactInfo = '';
  String servicesOffered = '';
  String selectedWorkingHours = 'Select working hours';
  String additionalInfo = '';
  String selectedAddress = 'Tripoli';
  List<String> selectedCategories = [];
  List<String> workingHoursOptions = [
    '9 AM - 5 PM',
    '8 AM - 4 PM',
    '10 AM - 6 PM',
  ];
  List<String> categoryOptions = ['Repair', 'Maintenance', 'Customization', 'Cleaning'];
  List<String> addressOptions = ['Tripoli', 'Benghazi'];

  // Firebase Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Workshop Details', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Workshop Name",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                fillColor: Colors.grey[100],
                filled: true,
              ),
              onChanged: (value) {
                setState(() {
                  workshopName = value;
                });
              },
            ),
            SizedBox(height: 12.0),
            Text(
              "Contact Information",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                fillColor: Colors.grey[100],
                filled: true,
              ),
              onChanged: (value) {
                setState(() {
                  contactInfo = value;
                });
              },
            ),
            SizedBox(height: 12.0),
            Text(
              "Location",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButtonFormField<String>(
                value: selectedAddress,
                onChanged: (value) {
                  setState(() {
                    selectedAddress = value!;
                  });
                },
                items: addressOptions.map((String address) {
                  return DropdownMenuItem<String>(
                    value: address,
                    child: Text(address),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Working Hours:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text(selectedWorkingHours),
              trailing: Icon(Icons.arrow_drop_down),
              onTap: () async {
                final selectedOption = await _showSliceMenu(context, workingHoursOptions);
                if (selectedOption != null) {
                  setState(() {
                    selectedWorkingHours = selectedOption;
                  });
                }
              },
            ),
            SizedBox(height: 12.0),
            Card(
              elevation: 5,
              child: Column(
                children: [
                  const ListTile(
                    title: Text(
                      'Categories :',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: categoryOptions.length,
                    itemBuilder: (BuildContext context, int index) {
                      final category = categoryOptions[index];
                      return CheckboxListTile(
                        title: Text(category),
                        value: selectedCategories.contains(category),
                        onChanged: (bool? value) {
                          setState(() {
                            if (value!) {
                              selectedCategories.add(category);
                            } else {
                              selectedCategories.remove(category);
                            }
                          });
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
              ),
              onPressed: () {
                // Save workshop details to Firestore
                _saveWorkshopDetails();
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to save workshop details to Firestore
  Future<void> _saveWorkshopDetails() async {
    try {
      // Add a new document with auto-generated ID
      await _firestore.collection('workshops').add({
        'workshopName': workshopName,
        'address': address,
        'contactInfo': contactInfo,
        'servicesOffered': servicesOffered,
        'workingHours': selectedWorkingHours,
        'additionalInfo': additionalInfo,
        'categories': selectedCategories,
      });

      // Show success message or navigate to another screen
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Workshop details saved successfully')));

      // Clear input fields after saving
      setState(() {
        workshopName = '';
        address = '';
        contactInfo = '';
        servicesOffered = '';
        selectedWorkingHours = 'Select working hours';
        additionalInfo = '';
        selectedAddress = 'Tripoli';
        selectedCategories.clear();
      });
    } catch (e) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to save workshop details')));
      print(e.toString());
    }
  }

  Future<String?> _showSliceMenu(BuildContext context, List<String> options) async {
    return await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          shrinkWrap: true,
          children: options.map((String option) {
            return ListTile(
              title: Text(option),
              onTap: () {
                Navigator.pop(context, option);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
