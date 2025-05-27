import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/styles/colors/appcolors.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/common/widgets/guildens.dart';
import 'package:hapticfone/common/widgets/paymetradioselcteccustom_widget.dart';
import 'package:hapticfone/common/widgets/pickupconfirmation_headside.dart';
import 'package:hapticfone/common/widgets/textbutton_customized.dart';
import 'package:hapticfone/screens/sell/sell_details.dart';

class Paymentprocssingscreen extends StatelessWidget {
  const Paymentprocssingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 10.0, offset: Offset(5, 0))],
        ),
        height: 70.h,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "₹29999",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
            ),
            TextbuttonCustomized(
              width: 162,
              heigth: 44,
              text: "Sell Now",
              textStyle: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              onpressed: () => Get.offAll(() => SellDetails()),
              boxDecoration: BoxDecoration(
                color: Appcolors.appbuttongreen,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ],
        ),
      ),
      appBar: Appbarcustomized(
        title: "Pick-up Confirmation",
        centertile: false,
        fontsize: 20.sp,
        fontweight: FontWeight.w700,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PickupconfirmationHeadside(
              step1completed: true,
              step2completed: true,
            ),
            SizedBox(height: 8.h),
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(width: 20.w),
                Text(
                  "UPI",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Radiopaymentwidget(title: "Upi", price: "₹29999"),
            SizedBox(height: 8.h),
            Divider(color: Colors.black),
            Column(
              children: [
                SizedBox(height: 10.h),
                Row(
                  children: [
                    SizedBox(width: 20.w),
                    Text(
                      "Liquid",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Radiopaymentwidget(title: "Liquid", price: "₹29999"),
            SizedBox(height: 8.h),
            Divider(color: Colors.black),
            Guildens(),
          ],
        ),
      ),
    );
  }
}
