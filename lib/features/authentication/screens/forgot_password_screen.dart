import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/utils.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/common/styles/texts/bold_text.dart';
import 'package:hapticfone/features/authentication/controllers/forgotpassword_contriller.dart';
import 'package:hapticfone/utils/constants/validator.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final String? email;
  const ForgotPasswordScreen({super.key, this.email});

  @override
  Widget build(BuildContext context) {
    final controlerrespasseord = Get.put(ForgotpasswordContriller());
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(12.r),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10.h),
                        Text(
                          "Forgot Password",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "Don't worry sometimes people can forget too, enter your",
                      style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10.w),
                        Text(
                          "email and we will send you a password reset link",
                          style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),

              SizedBox(height: 10.h),
              Form(
                key: controlerrespasseord.forgotemail,
                child: Padding(
                  padding: EdgeInsets.all(12.r),
                  child: TextFormField(
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Appcolors.appbuttongreen),
                      ),
                      hintText: "E-Mail",
                      hintStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      prefixIcon: Icon(Icons.send),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: Validator.validateEmail,
                    controller: controlerrespasseord.email,
                  ),
                ),
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
                    controlerrespasseord.sendrestpasswordresendemail();
                  },
                  child: Boldtext(
                    text: "Submit",
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
