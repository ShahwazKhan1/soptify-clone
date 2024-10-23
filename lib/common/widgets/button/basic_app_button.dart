import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget{
  final VoidCallback onPressed;
  final double ? height;
  final String title;

  const BasicAppButton({
    required this.onPressed,
    required this.title,
    this.height,
    super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize:  Size.fromHeight(height ?? 80)
        ),
        child: Text(title,style: TextStyle(color: Colors.white),)
    );
  }
}