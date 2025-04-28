import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/colors/appcolors.dart';

class RedioWidget extends StatelessWidget {
  final int selectvalue;
  final String title;
  final bool value;
  const RedioWidget({
    super.key,
    required this.selectvalue,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
      ),
      value: value,
      activeColor: Appcolors.appbuttongreen,
      onChanged: (value) {},
      groupValue: selectvalue,
    );
  }
}
