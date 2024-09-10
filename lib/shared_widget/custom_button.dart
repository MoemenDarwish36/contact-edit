import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  VoidCallback onTap;

  CustomButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      child: const Text(
        "Add",
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
