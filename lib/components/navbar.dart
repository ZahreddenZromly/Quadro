import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:quadro/screens/appointments_screen.dart';
import 'package:quadro/screens/home_screen.dart';
import 'package:quadro/store_system/intro_page.dart';
import 'package:quadro/towing_user/request_towing.dart';

import '../chat_system/chat_details.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static final List<Widget> _widgetOptions = <Widget>[
    // Login(),
    const AppointmentsScreen(),
    const HomeScreen(),
    const ChatDetails(),
    const IntroPage(),
     RequestTowingPage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                const GButton(
                  icon: Icons.calendar_month,
                  text: 'Appointments',
                ),
                const GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                const GButton(
                  icon: Icons.chat,
                  text: 'chat',
                ),
                const GButton(
                  icon: Icons.shopping_bag,
                  text: 'chat',
                ),
                GButton(
                  backgroundColor: Colors.teal,
                  iconColor: Colors.teal,
                  iconActiveColor: Colors.white,
                  textColor: Colors.white,
                  icon: Icons.emergency,
                  text: 'Help',
                  border: Border.all(
                    color: Colors.teal,
                    width: 1.5,
                  ),
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
