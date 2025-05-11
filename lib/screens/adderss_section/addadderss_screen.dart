import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:hapticfone/colors/appcolors.dart';
import 'package:hapticfone/screens/adderss_section/addadderss_formscreen.dart';
import 'package:hapticfone/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/widgets/textbutton_customized.dart';

class AddadderssScreen extends StatelessWidget {
  const AddadderssScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarcustomized(title: "ADDRESS", centertile: false),
      body: Column(
        children: [
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextbuttonCustomized(
                width: 300,
                heigth: 70,
                text: "Add a new Address",
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                onpressed: () => Get.to(() => AddadderssFormscreen()),
                boxDecoration: BoxDecoration(
                  color: Appcolors.mygreen,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Row(
              children: [
                SizedBox(width: 10.w),
                Text(
                  "MANGE ADDRESS",
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
