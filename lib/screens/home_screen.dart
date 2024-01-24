import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quadro/components/category_tile.dart';
import 'package:quadro/components/search_bar.dart';
import 'package:quadro/components/workshop_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        // leading: Text,
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.category),
            ),
            Text("Home"),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 8),
          QSearchBar(),
          SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(12),
            ),
            height: 200,
            width: MediaQuery.of(context).size.width * .5,
            child: Center(
              child: Text(
                'ورشة السعداوي',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * .04,
            ),
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return const Row(
                  children: [
                    CategryTile(),
                    SizedBox(width: 8),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 16),
          GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 12.0,
              childAspectRatio: 0.72,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (BuildContext context, int index) {
              return WorkshopCard();
            },
          ),
        ],
      ),
    );
  }
}
