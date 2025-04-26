import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:hapticfone/colors/appcolors.dart';
import 'package:hapticfone/controllers/verifyemailaddress.dart';
import 'package:hapticfone/images/images.dart';
import 'package:hapticfone/screens/forgotpassword/forgotpassword_contriller.dart';
import 'package:hapticfone/screens/loginscrren.dart';
import 'package:hapticfone/widgets/boldtext.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String? email;
  const ResetPasswordScreen({super.key, this.email});
  @override
  Widget build(BuildContext context) {
    Get.put(VerifyEmailAddress());
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
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

              Boldtext(text: "Password Reset Email Sent", size: 22.sp),
              Text(
                email ?? "email",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),
              Text(
                "Your Account Security is Our Primary We've Sent You a",
                style: TextStyle(color: Colors.grey[400], fontSize: 13.sp),
              ),
              Text(
                "Secure Link to Safety Change Your Password and Keep",
                style: TextStyle(color: Colors.grey[400], fontSize: 13.sp),
              ),
              Text(
                "Your Account Protected.",
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
                    Get.offAll(LoginScreen());
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
                onPressed:
                    () => ForgotpasswordContriller.instance
                        .resendresetpassoedrestemail(
                          email ?? "No Email Get to Sent to Verfication",
                        ),
                child: Text(
                  "Resend Email",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
