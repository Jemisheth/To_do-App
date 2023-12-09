import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DButtons extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  DButtons({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(text),
      color: Colors.blue.shade200,
    );
  }
}
