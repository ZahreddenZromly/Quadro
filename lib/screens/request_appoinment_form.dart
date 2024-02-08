import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quadro/components/navbar.dart';
import 'package:quadro/cubits/appointments/appointments_cubit.dart';
import 'package:quadro/cubits/appointments/appointments_state.dart';
import 'package:quadro/cubits/towing_request/towing_cubit.dart';
import 'package:quadro/cubits/towing_request/towing_request_model.dart';
import 'package:quadro/cubits/towing_request/towing_state.dart';

class RequestAppointmentForm extends StatelessWidget {
  RequestAppointmentForm({super.key, required this.state});
  // final db = FirebaseFirestore.instance;
  // final TowingCubit? cubit;
  final AppointmentStateLoaded? state;

  String? selectedBrand;
  String? selectedModel;
  String? _selectedType;
  List<String>? brands;
  List<String>? models;

  final TextEditingController descriptionController = TextEditingController();
  File? _image;

  Future getImage() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      _image = File(image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    // final brands = context.read<TowingCubit>().state.fetchedBrands;
    final cubit = context.read<AppointmentCubit>();
    brands = state!.brands;
    models = state!.models;
    selectedBrand = state!.selectedBrand;
    selectedModel = state!.selectedModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, size: 30),
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Request an\nAppointment',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

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
                        icon: const Icon(Icons.expand_more),
                        isExpanded: true,
                        value: selectedBrand,
                        style: TextStyle(fontSize: 22, color: Colors.black),
                        iconSize: 35,
                        items: brands!.map((brand) {
                          return DropdownMenuItem(
                              child: Text(brand), value: brand);
                        }).toList(),
                        onChanged: (value) {
                          cubit.getCarModels(value!);
                        }),
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
                      value: selectedModel, // Initially selected option
                      onChanged: (value) => {
                        cubit.select_a_model(value!),
                      },
                      // onChanged: (newModel) => setState(() {
                      //   selectedModel = newModel!;
                      // }),

                      style: TextStyle(fontSize: 22, color: Colors.black),
                      iconSize: 35,
                      items:
                          models!.map<DropdownMenuItem<String>>((String value) {
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
                maxLength: 350,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                maxLines: null, // Allow for indefinite number of lines
              ),
            ),

            SizedBox(height: 32),
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
            const SizedBox(height: 32),

            ElevatedButton(
              onPressed: () {
                cubit.createAppoinmentRequest(
                  brand: selectedBrand,
                  model: selectedModel,
                  description: descriptionController.text,
                );
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: Colors.grey[100],
                    actions: [
                      TextButton(
                          onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NavBar(),
                                ),
                              ),
                          child: Text(
                            'Done',
                            style: TextStyle(fontSize: 17),
                          )),
                    ],
                    title: Center(
                        child: Text(
                      'Request Submitted.',
                      style: TextStyle(fontSize: 23),
                    )),
                    contentPadding: EdgeInsets.all(20),
                  ),
                );
              },
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(const Size(362, 60.0)),
                // iconColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.teal),
              ),
              child: const Text(
                'Submit',
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
