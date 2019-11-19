import 'package:flutter/material.dart';

class RedToken extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.redAccent,
            border: Border.all(width: 2, color: Colors.pink)),
      ),
    );
  }
}