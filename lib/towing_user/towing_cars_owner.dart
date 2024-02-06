import 'package:flutter/material.dart';
import 'package:quadro/towing_user/profile_settings.dart';
import 'package:quadro/towing_user/requests.dart';

import 'availability_page.dart';
import 'dashboard_card.dart';
import 'overview_page.dart';


class MyTowing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
       body: SingleChildScrollView(
         padding: EdgeInsets.all(10.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             SizedBox(height: 50,),
             Container(
               height: 200,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage('lib/towing_car_assets/towingCar.jpg'),
                   fit: BoxFit.cover, // Adjust the fit as needed
                 ),
               ),
             ),
             SizedBox(height: 80,),
             Row(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child:
                   DashboardCard(//notifications_active
                     imagePath:"lib/towing_car_assets/new_request.jpg",
                     text: "View Requests",
                     call: () =>  Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => ViewServiceRequestsPage())),
                   ),
                 ),
                 DashboardCard(
                     imagePath:"lib/towing_car_assets/new_overview.jpg",
                   text: "Overview",
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
                   child: DashboardCard(
                     imagePath:"lib/towing_car_assets/availability.jpg",
                     text: "Availability Update",
                     call: () =>  Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => AvailabilityPage())),
                   ),
                 ),
                 DashboardCard(
                   imagePath:"lib/towing_car_assets/settings.jpg",
                   text: "Profile Settings",
                   call: () =>  Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => ProfileSettingsPage())),
                 ),
               ],
             ),

           ],
         ),
       ),
    );
  }
}

