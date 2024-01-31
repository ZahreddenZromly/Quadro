import 'package:flutter/material.dart';
import 'package:quadro/components/navbar.dart';

import '../screens/workshop_details.dart';

class LoginType extends StatelessWidget {
  const LoginType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                  MaterialPageRoute(builder: (context) => const NavBar()),
                );
              },
              child: Card(
                elevation: 30 ,
                shape: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    // Title for the Card
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'LogIn As User',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Image and Text content
                    Image.asset(
                      'assets/workshops/workshop.jpeg',
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    //Text('LogIn As User'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0), // Add some spacing between cards
            InkWell(
              onTap: () {
                // Navigate to User Login Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyWorkShop()),
                );
              },
              child: Card(
                elevation: 15,
                shape: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    // Title for the Card
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Login As Car WorkShop',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Image and Text content
                    Image.asset(
                      'assets/workshops/workshop.jpeg',
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    // Text('LogIn As User'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0), // Add some spacing between cards
            InkWell(
              onTap: () {
                // Navigate to User Login Page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NavBar()),
                );
              },
              child: Card(
                elevation: 15,
                shape: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    // Title for the Card
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Login As Tow Car',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Image and Text content
                    Image.asset(
                      'assets/workshops/workshop.jpeg',
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    // Text('LogIn As User'),
                  ],
                ),
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

  const CardWidget({super.key, required this.title, required this.imagePath});

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
              style: const TextStyle(
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
