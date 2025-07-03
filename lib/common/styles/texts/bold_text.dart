import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Boldtext extends StatelessWidget {
  final String text;
  final double size;
  final Color? colors;
  final int maxlines;
  const Boldtext({
    super.key,
    required this.text,
    this.size = 10,
    this.colors = Colors.black,
    this.maxlines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxlines,
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size.sp,
        color: colors,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
