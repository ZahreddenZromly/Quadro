import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:image_picker/image_picker.dart';
import 'package:quadro/components/navbar.dart';
import 'package:quadro/cubits/towing_request/towing_cubit.dart';
import 'package:quadro/cubits/towing_request/towing_request_model.dart';
import 'package:quadro/cubits/towing_request/towing_state.dart';
import 'package:quadro/screens/request_towing_map.dart';

import '../components/payment_page.dart';
import 'home_screen.dart';

class RequestTowingForm extends StatelessWidget {
  RequestTowingForm({super.key, required this.state});
  // final db = FirebaseFirestore.instance;
  // final TowingCubit? cubit;
  final TowingStateLoaded? state;

  String? selectedBrand;
  String? selectedModel;
  String? _selectedType;
  List<String>? brands;
  List<String>? models;
  String _currentPaymentMethod = 'نقداً';
  List<String> _paymentOptions = [
    'نقداً',
    'محفظة',
    'سداد',
    'البطاقة المصرفية اونلاين',
    'ادفعلي',
    'تداول',
    'موبي كاش'
  ];

  List<IconData> _paymentIcons = [
    Icons.money,
    Icons.account_balance_wallet,
    Icons.payment,
    Icons.credit_card,
    Icons.payment,
    Icons.attach_money,
    Icons.payment
  ];


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
    final cubit = context.read<TowingCubit>();
    brands = state!.brands;
    models = state!.models;
    selectedBrand = state!.selectedBrand;
    selectedModel = state!.selectedModel;
    _selectedType = state!.type;
    // selectedBrand = state!.selectedBrand;
    // final state = context.watch<TowingCubit>().state;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Request a\nTowing',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(
              width: 350,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Towing Type',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                ],
              ),
            ),
            InnerShadow(
              shadows: [
                Shadow(
                    color: Colors.black.withOpacity(0.25),
                    blurRadius: 1,
                    offset: const Offset(3, 2))
              ],
              child: Container(
                margin: EdgeInsets.only(top: 8),
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(
                      2,
                      (int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Color.fromARGB(69, 0, 0, 0),
                                  offset: Offset(2, 3),
                                  spreadRadius: 1,
                                  blurRadius: 7)
                            ]),
                            child: ChoiceChip(
                              onSelected: (bool value) {
                                cubit.select_a_type(
                                    TowingType.values[index].name);
                              },
                              selected: _selectedType ==
                                  TowingType.values[index].name,
                              labelPadding: EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 8),
                              backgroundColor: Colors.grey[100],
                              showCheckmark: false,
                              padding: EdgeInsets.all(8),
                              label: Row(
                                children: [
                                  Icon(
                                    Icons.car_crash,
                                    size: 30,
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    TowingType.values[index].name,
                                    style: TextStyle(
                                      letterSpacing: 1,
                                      fontSize: 22,
                                      color: _selectedType ==
                                              TowingType.values[index].name
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              selectedColor: Colors.teal,
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),
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
            const SizedBox(height: 20),
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

            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

              ],
            ),
            // if (_image != null) Image.file(_image!),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TowingLocator()));
              },
              child: Container(
                width: 350,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black38),
                    borderRadius: BorderRadius.circular(8)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Select Your Location',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Icon(Icons.location_on_outlined),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return PaymentSheet();
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.teal, // Change the background color of the button
              ),
                child: Text(
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
class PaymentSheet extends StatefulWidget {
  @override
  _PaymentSheetState createState() => _PaymentSheetState();
}

class _PaymentSheetState extends State<PaymentSheet> {
  String _currentPaymentMethod = 'نقداً';
  List<String> _paymentOptions = [
    'نقداً',
    'محفظة',
    'سداد',
    'البطاقة المصرفية اونلاين',
    'ادفعلي',
    'تداول',
    'موبي كاش'
  ];

  List<IconData> _paymentIcons = [
    Icons.money,
    Icons.account_balance_wallet,
    Icons.payment,
    Icons.credit_card,
    Icons.payment,
    Icons.attach_money,
    Icons.payment
  ];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 1,
      minChildSize: 0.5,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: _paymentOptions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 5,
                      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        leading: Icon(_paymentIcons[index]),
                        title: Text(
                          _paymentOptions[index],
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: _currentPaymentMethod ==
                            _paymentOptions[index]
                            ? CircleAvatar(
                          backgroundColor: Colors.teal,
                          radius: 10,
                          child: Icon(
                            Icons.check,
                            size: 15,
                            color: Colors.white,
                          ),
                        )
                            : null,
                        onTap: () {
                          setState(() {
                            _currentPaymentMethod = _paymentOptions[index];
                          });
                        },
                        selected: _currentPaymentMethod ==
                            _paymentOptions[index],
                      ),
                    );
                  },
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.teal), // Change the background color here
                ),
                onPressed: () {
                  // Implement logic for confirming the selection
                  print('Selected payment method: $_currentPaymentMethod');
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) => NavBar(),
                      ),);
                },
                child: Text('Confirm', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      },
    );
  }
}