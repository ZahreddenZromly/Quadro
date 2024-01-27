import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quadro/screens/login_screen.dart';
import 'package:quadro/screens/workshop_screen.dart';

import 'components/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        canvasColor: Color.fromARGB(255, 232, 234, 222),
      ),
      // home: NavBar(),
      home: WorkshopScreen(),
    );
  }
}
