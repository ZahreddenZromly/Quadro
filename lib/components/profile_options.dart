import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Options extends StatelessWidget {
  final IconData icon;
  final String option;
  final VoidCallback? onTap;
  Options({required this.icon,required this.option , required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Icon(icon,
          size: 40,
          color:Colors.teal ,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(option,
                style: TextStyle(fontSize: 20, ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.arrow_forward_ios_outlined,
                color:Colors.teal
            ),
          ),
        ],
      ),
    );
  }
}
