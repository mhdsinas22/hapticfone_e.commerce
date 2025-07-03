import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/styles/texts/bold_text.dart';
import 'package:hapticfone/common/widgets/textbutton_customized.dart';
import 'package:hapticfone/features/store/screens/adderss_section/addadderss_formscreen.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/utils/constants/images_strings.dart';
import 'package:lottie/lottie.dart';

class CustomAlertbox {
  final WidgetBuilder builder;
  CustomAlertbox({required this.builder});
  static noaddressAlertbox(context, bool isweb) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            InkWell(
              onTap: () {
                Get.to(() => AddadderssFormscreen());
              },

              child: TextbuttonCustomized(
                width: 250,
                heigth: isweb ? 100.h : 50,
                text: "📍 Add Delivery Address",
                textStyle: TextStyle(
                  fontSize: isweb ? 10.sp : 16.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                onpressed: () => Get.to(() => AddadderssFormscreen()),
                boxDecoration: BoxDecoration(
                  color: Appcolors.mygreen,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
          backgroundColor: Appcolors.white,
          content: SizedBox(
            height: isweb ? 500.h : 180.h,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(AppAnimatons.nofoundloading, width: 30.w),
                  Boldtext(text: "🏠 No address found ", size: isweb ? 10 : 16),
                  Boldtext(
                    text: "Please add a delivery address.",
                    size: isweb ? 8 : 14,
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
