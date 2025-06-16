import 'package:flutter/material.dart';

class ModeButton extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onTap;

  const ModeButton({
    required this.color,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: Size(200, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: onTap,
      child: Text(title, style: TextStyle(fontSize: 18, color: Colors.white)),
    );
  }
}
