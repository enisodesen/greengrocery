import 'package:flutter/material.dart';

class GestureDetectorButton extends StatelessWidget {
  const GestureDetectorButton({
    Key? key,
    this.onPressed,
    required this.text,
  }) : super(key: key);
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: GestureDetector(
        onTap: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
