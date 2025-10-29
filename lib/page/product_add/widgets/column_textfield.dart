import 'package:flutter/material.dart';

class ColumnTextfield extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final int maxLines;

  const ColumnTextfield({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    this.maxLines = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.grey, fontSize: 18)),
        SizedBox(height: 10),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[300],
              fontSize: 18,
              fontWeight: FontWeight.w300,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFF77A9), width: 1.5),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFFFF77A9), width: 2),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ],
    );
  }
}
