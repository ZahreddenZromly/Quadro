import 'package:flutter/material.dart';
import 'package:quadro/components/navbar.dart';

class LoginType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Two Cards Layout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                // Navigate to User Login Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NavBar()),
                );
              },
              child: CardWidget(
                title: 'LogIn As User',
                imagePath: 'assets/card1.jpg', // Replace with your image path
              ),
            ),
            SizedBox(height: 16.0), // Add some spacing between cards
            InkWell(
              onTap: () {
                // Navigate to Business User Login Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NavBar()),
                );
              },
              child: CardWidget(
                title: 'LogIn As Business User',
                imagePath: 'assets/card2.jpg', // Replace with your image path
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String imagePath;

  CardWidget({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Image.asset(
            imagePath,
            fit: BoxFit.cover,
            height: 150, // Adjust the height as needed
          ),
        ],
      ),
    );
  }
}

// class UserLoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('User Login Page'),
//       ),
//       body: Center(
//         child: Text('This is the User Login Page'),
//       ),
//     );
//   }
// }
//
// class BusinessUserLoginPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Business User Login Page'),
//       ),
//       body: Center(
//         child: Text('This is the Business User Login Page'),
//       ),
//     );
//   }
// }
