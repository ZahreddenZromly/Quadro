import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final IconData? icon;
  final IconData? arrow;
  final String option;
  final VoidCallback? onTap;
  const Options({super.key, required this.icon,required this.option , required this.onTap,  required this.arrow});
  const Options.twoArguments( this.option , this.icon , this.onTap, {super.key} ): arrow = null;

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
                  style: const TextStyle(fontSize: 20, ),
              ),
            ),
            const Spacer(),
            Icon(arrow,
                color:Colors.teal
            ),
          ],
        ),
      ),
    );
  }
}


