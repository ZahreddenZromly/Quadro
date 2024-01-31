import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String hintText;
  final String label;
  final bool obscureText;
  final TextEditingController controller;

  const MyTextField({
    super.key,
    required this.hintText,
    required this.label,
    required this.obscureText,
    required this.controller,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.black)),
          SizedBox(height: 8),
          TextFormField(
            initialValue: hintText,
            obscureText: obscureText,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(20),
              ),
              fillColor: Colors.grey.shade200,
              filled: true,
            ),
            onChanged: (value) {
              // firebase updated value
              print("$label changed to: $value");
            },
          ),
        ],
      ),
    );

  }
}