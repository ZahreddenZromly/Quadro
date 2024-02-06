import 'package:flutter/material.dart';

import 'Workshop_Details_screen.dart';

class MyWorkShop extends StatelessWidget {
  const MyWorkShop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                BackGroundContainer(
                  title: 'WorkShop User Main',
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 110),
                    MyDetails(
                      title: 'My WorkShop',
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 30.0), // Add spacing between cards
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WorkshopCard(
                    title: 'السيارات قيد التصليح',
                    iconData: Icons.work_history_outlined, // Replace with the desired icon
                  ),
                  WorkshopCard(
                    title: 'السيارات التي لم يتم قبولها',
                    iconData: Icons.downloading_outlined, // Replace with the desired icon
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0), // Add spacing between rows
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WorkshopCard(
                    title: 'السيارات التي تم اصلاحها',
                    iconData: Icons.done_all_outlined, // Replace with the desired icon
                  ),
                  WorkshopCard(
                    title: 'اااااااااااااااااااااا',
                    iconData: Icons.build, // Replace with the desired icon
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BackGroundContainer extends StatelessWidget {
  final String title;

  const BackGroundContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        // Adjust padding as needed
        height: 180,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0), // Adjust the radius as needed
            bottomRight: Radius.circular(20.0), // Adjust the radius as needed
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white, // You can adjust the text color
              fontSize: 20, // You can adjust the font size
            ),
          ),
        ),
      ),
    );
  }
}

// Inside your existing code
class MyDetails extends StatelessWidget {
  final String title;

  const MyDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the WorkshopDetailsPage when the card is tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const WorkshopDetailsPage(),
          ),
        );
      },
      child: Center(
        child: Card(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: 350,
            height: 180,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class WorkshopCard extends StatelessWidget {
  final String title;
  final IconData iconData; // Add this line to store the icon data

  const WorkshopCard({super.key, required this.title, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to another page when the card is tapped
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AnotherPage(title: title)));
      },
      child: SizedBox(
        width: 150, // Set your desired width
        height: 150, // Set your desired height
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 48.0, // Adjust the icon size as needed
                color: Colors.teal, // Adjust the icon color as needed
              ),
              const SizedBox(height: 8.0),
              Text(
                title,
                style: const TextStyle(fontSize: 12.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnotherPage extends StatelessWidget {
  final String title;

  const AnotherPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Text(
          'Details for $title',
          style: const TextStyle(fontSize: 20.0),
        ),
      ),
    );
  }
}


