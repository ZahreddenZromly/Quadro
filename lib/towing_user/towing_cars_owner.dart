import 'package:flutter/material.dart';
import 'package:quadro/towing_user/profile_settings.dart';
import 'package:quadro/towing_user/requests.dart';

import 'availability_page.dart';
import 'dashboard_card.dart';
import 'overview_page.dart';


class MyTowing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DashboardScreen();

  }
}

class DashboardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
        ),
       body: ListView(
         children:[
           Center(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Stack(
                   children: [
                     BackGroundContainer(),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         SizedBox(height: 50),
                         MyDetails(
                           title: 'My WorkShop',
                         ),
                       ],
                     ),
                   ],
                 ),
               ],
             ),
           ),
           Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [

             SizedBox(height: 50,),

             Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child:
                   WorkshopCard(
                     title: "View Requests",
                     iconData: Icons.downloading_outlined,
                     call: () =>  Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => ViewServiceRequestsPage())),
                   ),
                 ),
                 WorkshopCard(
                   title: "Overview",
                   iconData: Icons.remove_red_eye,
                   call: () =>  Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => OverviewPage())),
                 ),
               ],
             ),

             SizedBox(height: 10.0),
             Row(

               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: WorkshopCard(
                     title:"Availability Update" ,
                     iconData: Icons.lock_clock,
                     call: () =>  Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => AvailabilityPage())),
                   ),
                 ),
                 WorkshopCard(
                   call: () =>  Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => ProfileSettingsPage())),
                   title: "Profile Settings",
                   iconData: Icons.settings,
                 )
               ],
             ),

           ],
         ),
      ],
       ),
    );
  }
}

class MyDetails extends StatelessWidget {
  final String title;

  const MyDetails({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0), // Make the card rounder
          ),
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0), // Adjust the radius as needed
                  bottomRight: Radius.circular(20.0),
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
              ),
              image: DecorationImage(
                image: AssetImage('assets/towing/towingCar.jpg'),
                fit: BoxFit.contain, // Adjust the fit as needed
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class BackGroundContainer extends StatelessWidget {

  const BackGroundContainer({super.key, });

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

      ),
    );
  }
}

class WorkshopCard extends StatelessWidget {
  final String title;
  final IconData iconData; // Add this line to store the icon data
  VoidCallback?  call ;
  WorkshopCard({super.key, required this.title, required this.iconData, required this.call});

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
                padding: const EdgeInsets.all(8.0),
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