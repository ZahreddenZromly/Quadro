import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterComponent extends StatefulWidget {
  const FilterComponent({super.key});

  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.only(top: 0),
      height: MediaQuery.of(context).size.height * .8,
      width: double.maxFinite,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .43,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Filter',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.maxFinite,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FilterChip(
                            backgroundColor: Colors.grey[100],
                            selectedColor: Colors.teal,
                            label: Text('Category'),
                            selected: isSelected,
                            onSelected: (bool value) {
                              setState(() {
                                isSelected = !isSelected;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'City',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.maxFinite,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FilterChip(
                            backgroundColor: Colors.grey[100],
                            selectedColor: Colors.teal,
                            label: Text('City'),
                            selected: isSelected,
                            onSelected: (bool value) {
                              setState(() {
                                isSelected = !isSelected;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Brand',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.maxFinite,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FilterChip(
                            backgroundColor: Colors.grey[100],
                            selectedColor: Colors.teal,
                            label: Text('Brand'),
                            selected: isSelected,
                            onSelected: (bool value) {
                              setState(() {
                                isSelected = !isSelected;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  for (int i = 0; i < 5; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              for (int j = 5 - i; j > 0; j--)
                                Icon(Icons.star, color: Colors.amber),
                            ],
                          ),
                          Checkbox(value: false, onChanged: (bool) {})
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                child: Text(
                  'Reset',
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 22,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(4)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width * .4, 50.0)),
                  // iconColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(
                    Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                child: Text(
                  'Apply',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.all(4)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(
                      Size(MediaQuery.of(context).size.width * .4, 50.0)),
                  // iconColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                ),
              ),
            ],
          ),
          SizedBox(height: 4),
        ],
      ),
    );
  }
}
