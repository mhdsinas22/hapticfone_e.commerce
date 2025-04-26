import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/colors/appcolors.dart';
import 'package:hapticfone/images/images.dart';
import 'package:hapticfone/repository/authenticationrepository.dart';
import 'package:hapticfone/widgets/boldtext.dart';
import 'package:lottie/lottie.dart';

class SuceesScreen extends StatelessWidget {
  const SuceesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Lottie.asset(
                AppAnimatons.animation1,
                repeat: false,
                width: 400.w,
                height: 400.h,
              ),
              SizedBox(height: 25.h),

              Boldtext(text: "Your Account Successfully", size: 22.sp),
              Boldtext(text: "Created!", size: 22.sp),
              SizedBox(height: 10.h),
              Text(
                "Welcome to Your Ultimate Shopping Destination",
                style: TextStyle(color: Colors.grey[400]),
              ),
              Text(
                "Your Account is Created, Unleash the Joy of",
                style: TextStyle(color: Colors.grey[400]),
              ),
              Text(
                "Seamless Online Shopping!",
                style: TextStyle(color: Colors.grey[400]),
              ),
              SizedBox(height: 15.h),
              Container(
                decoration: BoxDecoration(
                  color: Appcolors.mygreen,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: 350.w,
                height: 60,
                child: TextButton(
                  onPressed: () {
                    Get.off(Authenticationrepository.instance.screenredirect());
                  },
                  child: Boldtext(
                    text: "Continue",
                    size: 15.sp,
                    colors: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
