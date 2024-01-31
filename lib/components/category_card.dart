import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[100],
      child: const Column(
        children: [
          Icon(Icons.car_crash, size: 70),
          SizedBox(height: 16),
          Text('Category',
              style: TextStyle(
                fontSize: 23,
              )),
        ],
      ),
    );
  }
}
