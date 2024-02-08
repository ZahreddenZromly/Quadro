import 'package:flutter/material.dart';

class OverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overview',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
      ),
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 10,
        margin: EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 400,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Name:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                Text('John Doe'),
                SizedBox(height: 40.0),
                Text(
                  'Contact Details:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height:10.0),
                Text('Email: johndoe@example.com'),
                Text('Phone: +1234567890'),
                SizedBox(height: 40.0),
                Text(
                  'Location:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('City: Tripoli'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

