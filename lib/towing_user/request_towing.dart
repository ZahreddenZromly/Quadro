import 'package:flutter/material.dart';

import '../screens/home_screen.dart';




class RequestTowingPage extends StatelessWidget {
  Color containerColor = Color(0xFFE0E0E0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RequestTowingForm(),

    );
  }
}

class RequestTowingForm extends StatefulWidget {
  @override
  _RequestTowingFormState createState() => _RequestTowingFormState();
}

class _RequestTowingFormState extends State<RequestTowingForm> {
  // Variables to store user inputs
  String selectedIssue = 'Engine Failure';
  String location = '';
  String additionalInformation = '';
  Color containerColor = Color(0xFFE0E0E0);
  String? selectedTowingService ;

  // Dropdown menu items
  List<String> issueTypes = ['Flat Tire', 'Engine Failure', 'Out of Fuel', 'Other'];
  String additionalInfo = '';
  List<String> selectedTowTrucks = [];
  TextEditingController CurrentPasswordController = TextEditingController();
  final List<String> towTruckOptions = [
    'Flatbed Tow Truck',
    'Wheel Lift Tow Truck',
    'Integrated Tow Truck',
  ];
  List<Map<String, String>> towingServices = [
    {'name': 'Towing Service Provider A', 'location': '123 Main St', 'contact': '555-1234', 'price':'50 LYD'},
    {'name': 'Towing Service Provider B', 'location': '456 Elm St', 'contact': '555-5678','price':'50 LYD'},
    {'name': 'Towing Service Provider C', 'location': '789 Oak St', 'contact': '555-9012', 'price':'50 LYD'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [ ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text('Request Towing',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: containerColor,

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.directions_car,
                        size: 50,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
                  child: Text('Type of issue', style: TextStyle(fontSize: 15)),
                ),
                SizedBox(height: 20),
                // Type of Issue Dropdown
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: containerColor,
                      filled: true,
                    ),
                    value: selectedIssue,
                    items: issueTypes.map((issue) {
                      return DropdownMenuItem(
                        value: issue,
                        child: Text(issue),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedIssue = value.toString();
                      });
                    },
                  ),
                ),
                SizedBox(height: 20,),
                // Location Map Input (Replace with actual map input widget)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
                  child: Text('Select a Location', style: TextStyle(fontSize: 15)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        location = value;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0,), // Adjust the vertical padding as needed
                      prefixIcon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: containerColor,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 150.0,), // Adjust the right padding to separate icon from text
                        child: Icon(
                          Icons.map,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                // Location Map Input (Replace with actual map input widget)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
                  child: Text('Drop Location', style: TextStyle(fontSize: 15)),
                ),
                // Additional Information Text Area
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        additionalInformation = value;
                      });
                    },
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0,), // Adjust the vertical padding as needed
                      prefixIcon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: containerColor,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 150.0,), // Adjust the right padding to separate icon from text
                        child: Icon(
                          Icons.map,
                          color: Colors.teal,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
                  child: Text('Tow truck options', style: TextStyle(fontSize: 15)),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      fillColor: containerColor,
                      filled: true,
                    ),
                    value: selectedTowTrucks.isNotEmpty ? selectedTowTrucks[0] : null,
                    onChanged: (value) {
                      setState(() {
                        selectedTowTrucks = [value.toString()];
                      });
                    },
                    items: towTruckOptions.map((option) {
                      return DropdownMenuItem(
                        value: option,
                        child: Text(option),
                      );
                    }).toList(),
                    hint: Text('Select Tow Truck'),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
                  child: Text(
                    'Select Towing Service Provider:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: towingServices.map<Widget>((Map<String, String> service)  {
                    return Card(
                      elevation: 10,
                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      child: ListTile(
                        title: Text(service['name']!),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Location: ${service['location']}'),
                            Text('Contact: ${service['contact']}'),
                            Text('price: ${service['price']}'),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            selectedTowingService = service['name']!;
                          });
                        },
                        selected: selectedTowingService == service['name'],
                        selectedTileColor: Colors.blue.withOpacity(0.1),
                      ),
                    );
                  }).toList(),
                ),

              ],
            ),
          ],
        ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: Visibility(
                visible: selectedTowingService != null && selectedTowingService!.isNotEmpty,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Confirm Towing Request"),
                          content: Text("Are you sure you want to request towing?"),
                          actions: <Widget>[
                            TextButton(
                              child: Text("Cancel"),
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                            ),
                            TextButton(
                              child: Text("Confirm"),
                              onPressed: () {
                                // Perform action when confirmed, such as sending request
                                // For demonstration, just closing the dialog
                                Navigator.of(context).push (
                                    MaterialPageRoute(
                                    builder: (BuildContext context) => HomeScreen(),),
                                );
                              },
                            ),
                          ],
                        );
                      },
                    );

                  },
                  child: Text(
                    'Request Towing',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
