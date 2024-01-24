import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quadro/components/category_tile.dart';
import 'package:quadro/components/search_bar.dart';
import 'package:quadro/components/workshop_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        // leading: Text,
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.category),
            ),
            Text("Home"),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          QSearchBar(),
          SizedBox(height: 16),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverFixedExtentList(
                  itemExtent: 200,
                  delegate: SliverChildListDelegate(
                    [
                      Padding(
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width * .03),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: 200,
                          width: MediaQuery.of(context).size.width * .5,
                          child: Center(
                            child: Text(
                              'ورشة السعداوي',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverFixedExtentList(
                  itemExtent: 40,
                  delegate: SliverChildListDelegate(
                    [
                      Container(
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * .05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Most Categories",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text("See All"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  sliver: SliverFixedExtentList(
                    itemExtent: 50,
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * .04,
                          ),
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            itemBuilder: (BuildContext context, int index) {
                              return const Row(
                                children: [
                                  CategryTile(),
                                  SizedBox(width: 8),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                  padding: EdgeInsets.only(top: 12),
                  sliver: SliverFixedExtentList(
                    itemExtent: 40,
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          // margin: EdgeInsets.only(top: 12, bottom: 8),
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * .05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Popular Workshops",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text("See All"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverGrid(
                  // padding: const EdgeInsets.symmetric(horizontal: 4),
                  delegate: SliverChildBuilderDelegate(
                    childCount: 8,
                    (context, index) {
                      return Padding(
                        padding: index / 2 == 0
                            ? EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * .03)
                            : EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * .03),
                        child: WorkshopCard(),
                      );
                    },
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 2,
                    childAspectRatio: .72,
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
