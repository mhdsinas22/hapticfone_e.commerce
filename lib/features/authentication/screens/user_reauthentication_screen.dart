import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/common/styles/texts/bold_text.dart';
import 'package:hapticfone/features/authentication/controllers/user_controller.dart';

import 'package:hapticfone/utils/constants/validator.dart';

class UserReauthenticationScreen extends StatelessWidget {
  const UserReauthenticationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final usercontroller = Get.put(Usercontroller());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Re-Authenticate User",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Form(
        key: usercontroller.reauthkey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10.h),

                SizedBox(height: 10.h),
                Padding(
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
                    controller: usercontroller.verfyemail,
                  ),
                ),

                SizedBox(height: 10),
                Padding(
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
                      hintText: "Password",
                      hintStyle: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      prefixIcon: Icon(Icons.password_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: Validator.validatePassword,
                    controller: usercontroller.verefiypassword,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  decoration: BoxDecoration(
                    color: Appcolors.mygreen,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  width: 350.w,
                  height: 60,
                  child: TextButton(
                    onPressed:
                        () => usercontroller.reauthinetcionEmailandpassoeed(),
                    child: Boldtext(
                      text: "Verify",
                      size: 15.sp,
                      colors: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
