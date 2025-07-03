import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/common/styles/texts/bold_text.dart';

class OrderStatusSeroivenumberDate extends StatelessWidget {
  const OrderStatusSeroivenumberDate({
    super.key,
    required this.text,
    this.textStyle,
    this.color = Colors.black,
    this.size = 0.0,
  });
  final String text;
  final TextStyle? textStyle;
  final Color? color;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Boldtext(text: text, colors: color, size: size),
        SizedBox(width: 5.h),
      ],
    );
  }
}
