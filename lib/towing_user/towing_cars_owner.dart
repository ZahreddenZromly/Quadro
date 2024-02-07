import 'package:flutter/material.dart';
import 'package:quadro/towing_user/profile_settings.dart';
import 'package:quadro/towing_user/requests.dart';

import '../components/workshop_card.dart';
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
                   WorkshopCards(
                     title: "View Requests",
                     iconData: Icons.downloading_outlined,
                     call: () =>  Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => ViewServiceRequestsPage())),
                   ),
                 ),
                 WorkshopCards(
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
                   child: WorkshopCards(
                     title:"Availability Update" ,
                     iconData: Icons.lock_clock,
                     call: () =>  Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => AvailabilityPage())),
                   ),
                 ),
                 WorkshopCards(
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

  const MyDetails({super.key});

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
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0), // Adjust the radius as needed
                  bottomRight: Radius.circular(20.0),
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/towing/towingCar.jpg',
                fit: BoxFit.contain,
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

