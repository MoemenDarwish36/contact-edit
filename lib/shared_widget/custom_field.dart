import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  IconData icon;
  String hint;
  TextEditingController controller;

  ///this function to check in validator
  String? Function(String?) validator;

  CustomField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.icon,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    /// i used (TextFormField) to make validation
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(

          ///to style message in validator
          errorStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(24)),

          ///this 2 parameter (filled,fillColor)
          ///to choice a color and display it
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Icon(
            icon,
            color: Colors.blue,
          ),
          hintText: hint),
    );
  }
}
