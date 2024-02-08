import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quadro/components/category_tile.dart';
import 'package:quadro/components/search_bar.dart';
import 'package:quadro/components/workshop_card.dart';
import 'package:quadro/screens/categories_screen.dart';
import 'package:quadro/screens/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CategoriesScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.category),
            ),
            const Text("Home"),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Profile()),
                );
              },
              icon: const Icon(Icons.person),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          const QSearchBar(),
          const SizedBox(height: 16),
          Expanded(
            child: CustomScrollView(
              slivers: [
                // Your other Slivers here
                SliverPadding(
                  padding: EdgeInsets.only(top: 8.0),
                  sliver: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('workshops')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const SliverToBoxAdapter(
                          child: Center(child: CircularProgressIndicator()),
                        );
                      }
                      if (snapshot.hasError) {
                        return SliverToBoxAdapter(
                          child:
                              Center(child: Text('Error: ${snapshot.error}')),
                        );
                      }
                      final workshops = snapshot.data!.docs;
                      return SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final workshop = workshops[index];
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: WorkshopCard(
                                workshopName: workshop['workshopName'],
                                address: workshop['address'],
                                contactInfo: workshop['contactInfo'],
                                workingHours: '',
                                categories: [],
                              ),
                            );
                          },
                          childCount: workshops.length,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          childAspectRatio: 0.72,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
