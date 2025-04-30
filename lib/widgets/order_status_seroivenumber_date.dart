import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderStatusSeroivenumberDate extends StatelessWidget {
  const OrderStatusSeroivenumberDate({
    super.key,
    required this.text,
    this.textStyle,
  });
  final String text;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Row(children: [Text(text, style: textStyle), SizedBox(width: 5.h)]);
  }
}
