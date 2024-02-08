import 'package:flutter/material.dart';

class WorkshopCards extends StatelessWidget {
  final String title;
  final IconData iconData; // Add this line to store the icon data
  VoidCallback?  call ;
  WorkshopCards({super.key, required this.title, required this.iconData, required this.call});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: call,
      child: SizedBox(
        width: 175, // Set your desired width
        height: 150, // Set your desired height
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Make the card rounder
          ),
          elevation: 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 48.0, // Adjust the icon size as needed
                color: Colors.teal, // Adjust the icon color as needed
              ),
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
