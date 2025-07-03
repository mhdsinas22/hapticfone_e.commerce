import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';

class Radiopaymentwidget extends StatelessWidget {
  const Radiopaymentwidget({
    super.key,
    required this.title,
    this.subtitle = "XXXXX1456@superyes",
    required this.price,
  });
  final String title;
  final String subtitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            subtitle: Text(subtitle, style: TextStyle(fontSize: 10.sp)),
            title: Text(
              title,
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w700),
            ),
            value: 1,
            groupValue: 2,
            onChanged: (value) {},
            activeColor: Appcolors.appbuttongreen,
            splashRadius: 1,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Text(
            price,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.sp),
          ),
        ),
        SizedBox(width: 10.w),
      ],
    );
  }
}
