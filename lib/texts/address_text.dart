import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Addresstext extends StatelessWidget {
  const Addresstext({super.key, this.width = 300});
  final double width;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Container(
        width: width.w,
        height: 200.h,
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.r),
              child: Row(children: [Text("Order Address")]),
            ),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Sinas",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "yesbpude,cor,Near pub,bangalore,Karnataka,560001",
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "ph:1234567890",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Order Date &Time",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.w),
                  Row(
                    children: [
                      Icon(Icons.calendar_month),
                      Text("10 Apr 2025", style: TextStyle(fontSize: 10.sp)),
                    ],
                  ),
                  // Row(children: [Text("Order Date &Time")]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
