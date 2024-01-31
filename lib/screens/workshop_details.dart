import 'package:flutter/material.dart';

class MyWorkShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyDetails(title: 'My WorkShop'),
          const SizedBox(height: 16.0), // Add spacing between cards
          Expanded(
            child: GridView.count(
              crossAxisCount: 2, // Number of columns in the grid
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: [
                WorkshopCard(title: 'السيارات قيد التصليح'),
                WorkshopCard(title: 'السيارات التي لم يتم قبولها'),
                WorkshopCard(title: 'السيارات التي تم اصلاحها'),
                WorkshopCard(title: 'اااااااااااااااااااااا'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MyDetails extends StatelessWidget {
  final String title;

  MyDetails({required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to another page when the card is tapped
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AnotherPage(title: title)));
      },
      child: Card(
        child: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          height: 150,
          child: Text(
            title,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class WorkshopCard extends StatelessWidget {
  final String title;

  WorkshopCard({required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to another page when the card is tapped
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AnotherPage(title: title)));
      },
      child: Card(
        child: Container(

          padding: EdgeInsets.all(16.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  final String title;

  AnotherPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
      ),
      body: Center(
        child: Text(
          'Details for $title',
          style: TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}
