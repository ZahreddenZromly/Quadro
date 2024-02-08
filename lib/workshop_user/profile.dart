import 'package:flutter/material.dart';


class WorkshopProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   WorkshopDetailsPage();
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
  String description = '';
  List<String> selectedCategories = [];
  List<String> workingHoursOptions = [
    '9 AM - 5 PM',
    '8 AM - 4 PM',
    '10 AM - 6 PM',
  ];
  List<String> categoryOptions = ["Engine repairs",'Cooling system servicing', 'Fuel system cleaning',
    'Brake pad replacement', 'Electrical system repairs',"Brake system repairs",""];
  List<String> addressOptions = ['Tripoli', 'Benghazi'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Workshop Details',style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Workshop Name",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10,),
            TextField(
                decoration: InputDecoration(
                  hintText: 'Write a name...',
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey.shade200),
              ),
              focusedBorder:   OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.white,
                ),
              ),
              fillColor: Colors.grey[100],
              filled: true,),
              onChanged: (value) {
                setState(() {
                  workshopName = value;
                });
              },
            ),
            SizedBox(height: 12.0),
            Text("Contact Information",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              decoration: InputDecoration(

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                focusedBorder:   OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                fillColor: Colors.grey[100],
                filled: true,),
              onChanged: (value) {
                setState(() {
                  contactInfo = value;
                });
              },
            ),
            SizedBox(height: 12.0),
            Text("Description",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(16.0, 20.0, 20.0, 50.0),
                hintText: 'Write a description...',

                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey.shade200),
                ),
                focusedBorder:   OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: Colors.white,
                  ),
                ),
                fillColor: Colors.grey[100],
                filled: true,),
              maxLines: null, // Allows for multiline input
              onChanged: (value) {
                setState(() {
                  description = value;
                });
              },
            ),
            SizedBox(height: 12.0),
            Text("Location",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
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

            SizedBox(height: 20,),
            Text('Working Hours:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
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
            SizedBox(height: 12.0),
            Card(
              elevation: 5,
              child: Column(
                children: [
                  ListTile(
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
                // Save workshop details
                // You can implement your logic here to save the details
                print('Workshop Name: $workshopName');
                print('Address: $address');
                print('Contact Information: $contactInfo');
                print('Services Offered: $servicesOffered');
                print('Working Hours: $selectedWorkingHours');
                print('Additional Information: $additionalInfo');
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('Save',
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