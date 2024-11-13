import 'package:flutter/material.dart';

class InputCustomizado extends StatelessWidget {

  final String hintText;
  final Icon icon;
  final bool obscureText;

  const InputCustomizado(
    {
    super.key,
    required this.hintText,
    this.obscureText = false, 
    this.icon = const Icon(Icons.person),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: icon,
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Colors.grey[600],
            fontSize: 18
          )
        ),
      ),
    );
  }
}