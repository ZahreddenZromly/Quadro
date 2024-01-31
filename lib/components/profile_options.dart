import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Options extends StatelessWidget {
  final IconData? icon;
  final IconData? arrow;
  final String option;
  final VoidCallback? onTap;
  Options({required this.icon,required this.option , required this.onTap,  required this.arrow});
  Options.twoArguments( this.option , this.icon , this.onTap ): arrow = null;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: onTap,
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
            Icon(arrow,
                color:Colors.teal
            ),
          ],
        ),
      ),
    );
  }
}


