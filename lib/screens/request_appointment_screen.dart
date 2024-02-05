import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quadro/components/image_picker.dart';
import 'package:quadro/my_flutter_app_icons.dart';

enum towingType { Tug, Pull }

class RequestAppointmentScreen extends StatefulWidget {
  RequestAppointmentScreen({super.key});

  @override
  State<RequestAppointmentScreen> createState() =>
      _RequestAppointmentScreenState();
}

class _RequestAppointmentScreenState extends State<RequestAppointmentScreen> {
  // final ChipThemeData customTheme = ChipThemeData.fromDefaults(
  //   shape: RoundedRectangleBorder(side: BorderSide.none),
  // );
  File? _image;
  Future getImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  List<String> brands = ['Toyota', 'Hyundai'];
  late String selectedBrand;
  int _selectedType = -1;

  final TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedBrand = brands[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Request an\nAppointment',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            const SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Car Model',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 0.5,
                          color:
                              Colors.black), // Adjust width and color as needed
                    ),
                  ),
                  height: 60,
                  width: 150,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.grey[100],
                      icon: Icon(Icons.expand_more),
                      isExpanded: true,
                      value: selectedBrand, // Initially selected option
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedBrand = newValue!;
                        });
                      },

                      style: TextStyle(fontSize: 22, color: Colors.black),
                      iconSize: 35,
                      items:
                          brands.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center(child: Text(value)),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(width: 32),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                          width: 0.5,
                          color:
                              Colors.black), // Adjust width and color as needed
                    ),
                  ),
                  height: 60,
                  width: 150,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.grey[100],
                      icon: Icon(Icons.expand_more),
                      // hint: Text('brand'),
                      isExpanded: true,
                      // itemHeight: 80,
                      value: selectedBrand, // Initially selected option
                      onChanged: (String? newValue) {
                        // Handle dropdown selection here
                        setState(() {
                          selectedBrand = newValue!;
                        });
                      },

                      style: TextStyle(fontSize: 22, color: Colors.black),
                      iconSize: 35,
                      items:
                          brands.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Center(child: Text(value)),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Descreption',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 350,
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black26),
                  hintText: 'Descreption about your car.',
                  border: InputBorder.none,
                ),
                controller: descriptionController,
                maxLength: 1000,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLines: null, // Allow for indefinite number of lines
              ),
            ),

            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => getImage(),
                  child: Container(
                    width: 350,
                    // height: 50,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black38),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Upload Car Images',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Icon(Icons.add_a_photo_outlined),
                          ],
                        ),
                        if (_image != null)
                          Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                margin: EdgeInsets.only(top: 12),
                                decoration: BoxDecoration(
                                  // borderRadius: BorderRadius.circular(0),
                                  color: Colors.teal,
                                ),
                                child: ClipRRect(
                                  // borderRadius: BorderRadius.circular(12),
                                  child: Image.file(
                                    _image!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // if (_image != null) Image.file(_image!),

            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => WorkshopScreen(),
                //   ),
                // );
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(const Size(350, 60.0)),
                // iconColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.teal),
              ),
              child: const Text(
                'Send Request',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
