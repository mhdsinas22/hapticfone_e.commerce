import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElveationbutton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundcolor;
  final Color? forgroundcolor;
  final bool isweb;
  const CustomElveationbutton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundcolor,
    this.forgroundcolor,
    this.isweb = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: forgroundcolor,
        backgroundColor: backgroundcolor,
      ),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
      ),
    );
  }
}
