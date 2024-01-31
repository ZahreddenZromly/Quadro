import 'package:flutter/material.dart';
import 'package:quadro/components/category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Colors.grey[100],
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(top: 32),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_circle_left_outlined, size: 40),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 32),
          child: Text(
            'Categories',
            style: TextStyle(
              fontSize: 32,
              color: Colors.black,
            ),
          ),
        ),
        // Other AppBar properties...
      ),
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns
          crossAxisSpacing: 10, // Spacing between columns
          mainAxisSpacing: 10, // Spacing between rows
          childAspectRatio: 1, // Aspect ratio of each grid item
        ),
        itemCount: 10, // Number of items in the grid
        itemBuilder: (BuildContext context, int index) {
          // Build each grid item here
          return const CategoryCard();
        },
      ),
    );
  }
}
