import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:hapticfone/colors/appcolors.dart';
import 'package:hapticfone/controllers/verifyemailaddress.dart';
import 'package:hapticfone/images/images.dart';
import 'package:hapticfone/screens/loginscrren.dart';
import 'package:hapticfone/widgets/boldtext.dart';

class EmailScreen extends StatelessWidget {
  final String? email;
  const EmailScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    final controlleremail = Get.put(VerifyEmailAddress());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(LoginScreen());
            },
            icon: Icon(CupertinoIcons.clear),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 12.h),
              Padding(
                padding: EdgeInsets.all(12.r),
                child: Image.asset(Appimage.image1),
              ),
              SizedBox(height: 25.h),

              Boldtext(text: "Verify Your email address! ", size: 20.sp),
              Text(
                email ?? "email",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                "Congratulations Your Account Awaits : Verify Your Email",
                style: TextStyle(color: Colors.grey[400], fontSize: 13.sp),
              ),
              Text(
                "to Start Shopping and Experience a World of Unrivaled",
                style: TextStyle(color: Colors.grey[400], fontSize: 13.sp),
              ),
              Text(
                "Deals and Personalized Offers.",
                style: TextStyle(color: Colors.grey[400], fontSize: 13.sp),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Appcolors.mygreen,
                  borderRadius: BorderRadius.circular(12),
                ),
                width: 350.w,
                height: 60,
                child: TextButton(
                  onPressed: () {
                    controlleremail.checkEmailverficationStatus();
                  },
                  child: Boldtext(
                    text: "Continue",
                    size: 15.sp,
                    colors: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () => controlleremail.sendEmailVerfication(),
                child: Text("Resend Email", style: TextStyle()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
