import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneSpecifications extends StatelessWidget {
  const PhoneSpecifications({
    super.key,
    required this.phonebrand,
    required this.phonecolor,
    required this.phoneram,
    required this.phonestock,
    required this.phonestorage,
    this.isweb = false,
  });
  final String phoneram;
  final String phonestorage;
  final String phonebrand;
  final String phonecolor;
  final String phonestock;
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: isweb ? 40 : 40),
            Text(
              "Specifications",
              style: TextStyle(
                fontSize: isweb ? 10.sp : 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            SizedBox(width: isweb ? 11.w : 40.w),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: "RAM:",
                    style: TextStyle(
                      fontSize: isweb ? 7.sp : 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  TextSpan(
                    text: phoneram,
                    style: TextStyle(
                      fontSize: isweb ? 7.sp : 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: isweb ? 11.w : 40.w),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: "Stroage:",
                    style: TextStyle(
                      fontSize: isweb ? 7.sp : 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  TextSpan(
                    text: phonestorage,
                    style: TextStyle(
                      fontSize: isweb ? 7.sp : 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: isweb ? 11.w : 40.w),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: "Brand:",
                    style: TextStyle(
                      fontSize: isweb ? 7.sp : 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  TextSpan(
                    text: phonebrand,
                    style: TextStyle(
                      fontSize: isweb ? 7.sp : 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: isweb ? 11.w : 40.w),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: "Color:",
                    style: TextStyle(
                      fontSize: isweb ? 7.sp : 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  TextSpan(
                    text: phonecolor,
                    style: TextStyle(
                      fontSize: isweb ? 7.sp : 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            SizedBox(width: isweb ? 11.w : 40.w),
            RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: "Stock:",
                    style: TextStyle(
                      fontSize: isweb ? 7.sp : 16.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                  TextSpan(
                    text: phonestock,
                    style: TextStyle(
                      fontSize: isweb ? 7.sp : 16.sp,
                      fontWeight: FontWeight.bold,
                      color: phonestock.length <= 1 ? Colors.red : Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
