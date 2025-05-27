import 'package:flutter/material.dart';

class Boldtext extends StatelessWidget {
  final String text;
  final double size;
  final Color? colors;
  const Boldtext({
    super.key,
    required this.text,
    this.size = 10,
    this.colors = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: colors,
      ),
    );
  }
}
