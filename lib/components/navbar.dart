import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:quadro/screens/appointments_screen.dart';
import 'package:quadro/screens/help_screen.dart';
import 'package:quadro/screens/home_screen.dart';
import 'package:quadro/screens/login_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static  List<Widget> _widgetOptions = <Widget>[
    Login(),
    AppointmentsScreen(),
    HomeScreen(),
    HelpScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 20,
      //   title: const Text('GoogleNavBar'),
      // ),
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
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: [
                GButton(
                  icon: Icons.calendar_month,
                  text: 'Appointments',
                ),
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  backgroundColor: Colors.red,
                  iconColor: Colors.red,
                  iconActiveColor: Colors.white,
                  textColor: Colors.white,
                  icon: Icons.emergency,
                  text: 'Help',
                  border: Border.all(
                    color: const Color.fromRGBO(244, 67, 54, 1),
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
