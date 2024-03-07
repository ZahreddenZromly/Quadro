import 'package:flutter/material.dart';
import 'package:quadro/workshop_user/profile.dart';
import 'package:quadro/workshop_user/review.dart';
import '../chat_system/chat_details.dart';
import '../login_system/login_or_register.dart';
import '../screens/chat-screen.dart';
import '../store_system/intro_page.dart';
import '../towing_user/dashboard_card.dart';
import 'appointments.dart';
import 'overview.dart';


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
        leading: IconButton(
          icon: Icon(Icons.logout), // Add your desired icon here
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (BuildContext context) => LoginOrRegister(),
                ),
            );// Add onPressed logic if you want the icon to be interactive
          },
        ),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children:[
          const Center(
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
                          MaterialPageRoute(builder: (context) => ChatDetails())),
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






