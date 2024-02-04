import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quadro/screens/workshop_screen.dart';

class WorkshopListTile extends StatelessWidget {
  const WorkshopListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 110,
      decoration: const BoxDecoration(
        color: Colors.white54,
      ),
      child: Row(
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(12),
              color: Colors.teal,
            ),
            child: ClipRRect(
              // borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/workshops/workshop.jpeg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Workshop Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.star_border_outlined, color: Colors.amber),
                  SizedBox(width: 4),
                  Text(
                    '${4.5}',
                    style: TextStyle(color: Colors.black45),
                  ),
                ],
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.location_on_outlined,
                      color: Colors.teal, size: 20),
                  SizedBox(width: 4),
                  Text(
                    'Ain-Zara/Tripoli',
                    // style: TextStyle(color: Colors.black45),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WorkshopScreen(),
                ),
              );
            },
            icon: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(40),
              ),
              child: const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
