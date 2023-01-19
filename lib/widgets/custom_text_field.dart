import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.text,
    required this.prefixIcon,
    this.controller,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  final String text;
  final IconData prefixIcon;
  final TextEditingController? controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 8,
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            hintText: text,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue.shade300, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
