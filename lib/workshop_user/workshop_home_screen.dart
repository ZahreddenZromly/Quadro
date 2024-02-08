import 'package:flutter/material.dart';
import 'package:quadro/workshop_user/profile.dart';
import 'package:quadro/workshop_user/review.dart';

import '../screens/profile_screen.dart';
import '../store_system/intro_page.dart';
import '../towing_user/availability_page.dart';
import '../towing_user/dashboard_card.dart';
import '../towing_user/overview_page.dart';
import '../towing_user/profile_settings.dart';
import '../towing_user/requests.dart';
import '../screens/Workshop_Details_screen.dart';
import 'appointments.dart';
import 'overview.dart';
// Navigator.push(   // Myworkshop
//           context,
//           MaterialPageRoute(
//             builder: (context) => const WorkshopDetailsPage(),
//           ),

class MyWorkShop extends StatelessWidget {
  const MyWorkShop({super.key});

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
                      title: "Appointments",
                      iconData: Icons.downloading_outlined,
                      call: () =>  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Appointments())),
                    ),
                  ),
                  WorkshopCards(
                    title: "Overview",
                    iconData: Icons.remove_red_eye,
                    call: () =>  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WorkshopOverviewPage())),
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
                      title:"Reviews" ,
                      iconData: Icons.reviews,
                      call: () =>  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ReviewsPage())),
                    ),
                  ),
                  WorkshopCards(
                    call: () =>  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WorkshopProfile())),
                    title: "Profile",
                    iconData: Icons.settings,
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: WorkshopCards(
                      call: () =>  Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => WorkshopProfile())),
                      title: "messages",
                      iconData: Icons.message,
                    ),
                  ),
                  WorkshopCards(
                    title: "Store",
                    iconData: Icons.store,
                    call: () =>  Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => IntroPage())),
                  ),
                ],
              )

            ],
          ),
        ],
      ),
    );
  }
}

class MyDetails extends StatelessWidget {

  const MyDetails({super.key,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
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
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/workshops/mechanic.jpg',
                fit: BoxFit.cover,
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





