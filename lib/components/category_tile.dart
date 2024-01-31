import 'package:flutter/material.dart';

// List<string> categories = [],

class CategryTile extends StatelessWidget {
  const CategryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        padding: MaterialStateProperty.all(const EdgeInsets.all(12)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
            Size(MediaQuery.of(context).size.width * .10, 50.0)),
        iconColor: MaterialStateProperty.all(Colors.black),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.category),
          SizedBox(width: 4),
          Text('Category'),
        ],
      ),
    );
  }
}
