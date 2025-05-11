import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:hapticfone/colors/appcolors.dart';
import 'package:hapticfone/screens/buy/checkout/checkout.dart';
import 'package:hapticfone/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/widgets/cart_widgtes.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarcustomized(title: "Cart"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CartWidgtes(),
            SizedBox(height: 350.h),
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Material(
                borderRadius: BorderRadius.circular(12.r),
                elevation: 10,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  width: 370.w,
                  height: 93.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          SizedBox(height: 30.h),
                          Text(
                            "TOTAL",
                            style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w800,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "₹44999",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 60.w),
                      Container(
                        decoration: BoxDecoration(
                          color: Appcolors.mygreen,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        width: 140.w,
                        height: 38.h,
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Get.to(Checkout());
                            },
                            child: Text(
                              "CheckOut(1 items)",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
