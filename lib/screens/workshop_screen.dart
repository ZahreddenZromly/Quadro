import 'package:flutter/material.dart';
import 'package:quadro/components/review_tile.dart';
import 'package:quadro/screens/request_appointment_screen.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

import '../towing_user/workshop_location.dart';

class WorkshopScreen extends StatelessWidget {
  WorkshopScreen({super.key});
  final List<Chip> chips = [
    const Chip(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      label: Text('Category'),
    ),
    const Chip(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      label: Text('Category'),
    ),
    const Chip(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      label: Text('Category'),
    ),
    const Chip(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      label: Text('Category'),
    ),
    const Chip(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      label: Text('Category'),
    ),
    const Chip(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      label: Text('Category'),
    ),
    const Chip(
      backgroundColor: Color.fromARGB(255, 245, 245, 245),
      label: Text('Category'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3), // Shadow color
              spreadRadius: 5, // Spread radius
              blurRadius: 7, // Blur radius
              offset: const Offset(0, 3), // Offset in x and y direction
            ),
          ],
        ),
        child: BottomAppBar(
          height: 85,
          surfaceTintColor: Colors.grey,
          // elevation: 1000,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RequestAppointmentScreen(),
                    ),
                  );
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(const EdgeInsets.all(4)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(const Size(350, 60.0)),
                  // iconColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.teal),
                ),
                child: const Text(
                  'Ask For Appointment',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              padding: const EdgeInsets.all(2),
              // color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.grey[100],
                ),
                child: const Icon(Icons.arrow_back),
              ),
            ),
            backgroundColor: const Color.fromARGB(225, 0, 150, 135),
            pinned: true,
            expandedHeight: 320,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/workshops/workshop.jpeg',
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Container(
                height: 60,
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12)),
                  color: Colors.grey[100],
                ),
                width: double.maxFinite,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'New Workshop',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text(
                          '4.5',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black45,
                          ),
                        ),
                        Text(
                          ' (365 Reviews)',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black45,
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   child: SingleChildScrollView(
                    //     scrollDirection: Axis.horizontal,
                    //     child: Row(
                    //       children: List.generate(
                    //         5,
                    //         (index) => Icon(Icons.star),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
              ),
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: [
                    const TabBar(
                      dividerColor: Colors.black12,
                      indicatorColor: Colors.teal,
                      labelColor: Colors.teal,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        SizedBox(
                          height: 40,
                          // width: double.maxFinite,
                          child: Center(
                            child: Text('About'),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Center(
                            child: Text('Info'),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Center(
                            child: Text('Reviews'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: double.maxFinite,
                      child: TabBarView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'About Workshop',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const ReadMoreText(
                                  'Welcome to [Workshop Name], where precision meets passion in automotive care! At [Workshop Name], we\'re not just your average garage; we\'re a team of dedicated automotive enthusiasts committed to providing top-notch service and expertise to keep your vehicle running smoothly on the road. With years of experience under our belt, our highly skilled technicians specialize in everything from routine maintenance to complex repairs for all makes and models. Whether it\'s a simple oil change, brake repair, engine diagnostics, or a complete overhaul, we\'ve got you covered. Customer satisfaction is our top priority, which is why we strive to deliver exceptional service, transparent communication, and fair pricing on every job. We believe in building lasting relationships with our clients based on trust, reliability, and a genuine passion for all things automotive.',
                                  trimLines: 2,
                                  colorClickableText: Colors.pink,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: 'Show more',
                                  trimExpandedText: 'Show less',
                                  moreStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Divider(
                                //   color: Color.fromARGB(59, 0, 150, 135),
                                // ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Categories',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),

                                Wrap(
                                  children: [
                                    for (Chip chip in chips)
                                      Padding(
                                        padding: const EdgeInsets.all(4),
                                        child: chip,
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Info',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.call),
                                        TextButton(
                                            onPressed: () async {
                                              final url = Uri(
                                                  scheme: 'tel',
                                                  path: '+218920000000');
                                              if (await canLaunchUrl(url)) {
                                                print('hellllllllo');
                                                launchUrl(url);
                                              }
                                            },
                                            child: const Text('092-0000000')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.message),
                                        TextButton(
                                            onPressed: () {},
                                            child:
                                                const Text('Send a message')),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(builder: (context) => WrokshopLocation()));
                                            },
                                            child:
                                                const Text('AinZara/Tripoli')),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.message),
                                        TextButton(
                                            onPressed: () {},
                                            child:
                                                const Text('Send a message')),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Reviews ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '(45)',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.teal,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16),
                                ReviewTile(),
                                ReviewTile(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
