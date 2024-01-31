import 'package:flutter/material.dart';
import 'package:quadro/screens/workshop_screen.dart';

class WorkshopCard extends StatelessWidget {
  const WorkshopCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Colors.grey[400],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.teal,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/workshops/workshop.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Workshop Name',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: const Text(
                'description description description description description',
                style: TextStyle(fontSize: 10),
                maxLines: null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkshopScreen(),
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
                minimumSize: MaterialStateProperty.all(const Size(80, 40.0)),
                // iconColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(Colors.teal),
              ),
              child: const Text(
                'Visit',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          )
        ],
      ),
    );
  }
}
