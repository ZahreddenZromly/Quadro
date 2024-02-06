import 'package:flutter/material.dart';


class DashboardCard extends StatelessWidget {
  Color containerColor = Color(0xFF93DAD3);
  VoidCallback?  call ;
  String text;
  String imagePath;
  DashboardCard({required this.text, required this.call, required this.imagePath  });
  @override
  Widget build(BuildContext context) {
    // Implement UI for Overview Section
    return InkWell(
        onTap: call ,

        child: Card(
          elevation: 10.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          color: containerColor,
          child: Container(
            height: 150,
            width: 175,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        text,
                        maxLines: null, // Set to null to allow unlimited lines
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: Container(
                          width: 60, // Set your desired width
                          height: 60, // Set your desired height
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: containerColor, // Set your desired border color
                              width: 2.0, // Set your desired border width
                            ),
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              imagePath, // Replace with your image URL
                              fit: BoxFit.cover,

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),// Add any other child widgets here
                ],
              ),
            ),
          ),
        )

    );
  }
}
