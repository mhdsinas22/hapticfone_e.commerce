import 'package:flutter/material.dart';

class TcircularIcon extends StatelessWidget {
  const TcircularIcon({
    super.key,
    this.height,
    this.width,
    this.size,
    required this.icon,
    this.color,
    this.backgroudcolor,
    this.onPressed,
  });
  final double? height, width, size;
  final IconData icon;
  final Color? color;
  final Color? backgroudcolor;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroudcolor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, color: color, size: size),
      ),
    );
  }
}
