import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false ,
      body: Column(
        children: [
          Container(
              width: MediaQuery.of(context).size.width * 90,
              child: TextField()),
        ],
      ),
    );
  }
}