// Import necessary packages
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class WorkshopDetailsPage extends StatefulWidget {
  const WorkshopDetailsPage({super.key});

  @override
  _WorkshopDetailsPageState createState() => _WorkshopDetailsPageState();
}

class _WorkshopDetailsPageState extends State<WorkshopDetailsPage> {
   String workshopName ='';
   String phoneNumber ='';
   String address ='';
   String category ='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Workshop Details'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ... (your existing widgets)

              // Form for entering workshop details
              WorkshopDetailsForm(
                onDetailsChanged: (name, phone, addr, cat) {
                  setState(() {
                    workshopName = name;
                    phoneNumber = phone;
                    address = addr;
                    category = cat;
                  });
                },
              ),

              // Display entered details in MyDetailsCard
              MyDetailsCard(
                workshopName: workshopName,
                phoneNumber: phoneNumber,
                address: address,
                category: category,
              ),

              // Star rating for reviews
              const StarRating(),
            ],
          ),
        ),
      ),
    );
  }
}

class WorkshopDetailsForm extends StatefulWidget {
  final Function(String, String, String, String) onDetailsChanged;

  const WorkshopDetailsForm({super.key, required this.onDetailsChanged});

  @override
  _WorkshopDetailsFormState createState() => _WorkshopDetailsFormState();
}

class _WorkshopDetailsFormState extends State<WorkshopDetailsForm> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Enter Workshop Details:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: nameController,
          decoration: const InputDecoration(labelText: 'Workshop Name'),
        ),
        TextField(
          controller: phoneController,
          decoration: const InputDecoration(labelText: 'Phone Number'),
        ),
        TextField(
          controller: addressController,
          decoration: const InputDecoration(labelText: 'Address'),
        ),
        TextField(
          controller: categoryController,
          decoration: const InputDecoration(labelText: 'Category'),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () async {
            // Save details to Firebase
            await _firestore.collection('workshops').add({
              'name': nameController.text,
              'phone': phoneController.text,
              'address': addressController.text,
              'category': categoryController.text,
            });

            // Notify user that details have been saved
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Workshop details saved successfully!'),
              ),
            );

            // Clear text fields
            nameController.clear();
            phoneController.clear();
            addressController.clear();
            categoryController.clear();
          },
          child: const Text('Save Details'),
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}

class MyDetailsCard extends StatelessWidget {
  final String workshopName;
  final String phoneNumber;
  final String address;
  final String category;

  const MyDetailsCard({super.key, 
    required this.workshopName,
    required this.phoneNumber,
    required this.address,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Workshop Details:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('Workshop Name: $workshopName'),
            Text('Phone Number: $phoneNumber'),
            Text('Address: $address'),
            Text('Category: $category'),
          ],
        ),
      ),
    );
  }
}


class StarRating extends StatelessWidget {
  const StarRating({super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 3, // Replace with actual initial rating
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 30.0,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        // Implement logic to handle the rating update
        print(rating);
      },
    );
  }
}