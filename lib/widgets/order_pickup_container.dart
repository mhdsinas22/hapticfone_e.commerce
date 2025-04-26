import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/colors/appcolors.dart';

class OrderPickupContainer extends StatelessWidget {
  final BoxDecoration? boxdecoration;
  final double width;
  final double height;
  final Color backgroundcolor;
  final String orderandpicktext;
  final String dateandtimetext;
  final String phoenimage;
  final String orderid;
  final String orderorsellamount;
  final String price;
  const OrderPickupContainer({
    super.key,
    this.boxdecoration,
    this.width = 510,
    this.height = 220,
    this.backgroundcolor = Colors.white,
    this.orderandpicktext = "Ordertext",
    this.dateandtimetext = "dateandtime",
    this.phoenimage = "asset/17.png",
    this.orderid = "orderid",
    this.orderorsellamount = "order or sell amount",
    this.price = "price",
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.all(10.r),
          child: Material(
            elevation: 10,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              width: width.w,
              height: height.h,
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      SizedBox(width: 10.w),
                      Container(
                        width: 25.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          color: Appcolors.appbuttongreen,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.done_outlined,
                          size: 25.sp,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        orderandpicktext,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  Row(children: [SizedBox(width: 50.w), Text(dateandtimetext)]),
                  SizedBox(height: 10.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 4.w),
                      Container(width: 330.w, height: 1.h, color: Colors.black),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(phoenimage, width: 110.w, height: 82.h),
                      Column(
                        children: [
                          SizedBox(height: 20.h),
                          Text(
                            "Order ID:$orderid",
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Text(
                                "Apple iphone 13 pro",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18.sp,
                                ),
                              ),
                              SizedBox(width: 10.w),
                            ],
                          ),

                          Row(
                            children: [
                              Text(
                                "256 GB",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(width: 120.w),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 4.w),
                      Container(width: 330.w, height: 1.h, color: Colors.black),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      SizedBox(width: 12.w),
                      Text(
                        orderorsellamount,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(width: 150.w),
                      Text(
                        price,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
