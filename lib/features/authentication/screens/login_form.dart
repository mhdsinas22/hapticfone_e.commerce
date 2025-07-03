import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/container/rectangle_container.dart';
import 'package:hapticfone/features/authentication/screens/forgot_password_screen.dart';
import 'package:hapticfone/features/authentication/controllers/login_controller.dart';
import 'package:hapticfone/responsive_screen/resopnsive_signup_screen.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/utils/constants/images_strings.dart';
import 'package:hapticfone/utils/constants/validator.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key, this.isweb = false});
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.put(Logincontroller());
    return Form(
      key: logincontroller.loginform,
      child: RectangleContainer(
        // boxDecoration: BoxDecoration(color: Appcolors.appbuttongreen),
        heigth: isweb ? 500.h : MediaQuery.of(context).size.height * 0.8,
        width:
            isweb
                ? MediaQuery.of(context).size.width
                : MediaQuery.of(context).size.width * 0.8,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100.h),
            Row(
              children: [
                SizedBox(width: isweb ? 85.w : null),
                Text(
                  "Email or Username",
                  style: TextStyle(
                    fontSize: isweb ? null : 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: isweb ? 5.h : 5.h),
            SizedBox(
              width: isweb ? 200.w : null,
              child: TextFormField(
                validator: (value) => Validator.validateEmail(value),
                controller: logincontroller.email,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(255, 216, 246, 180),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                SizedBox(width: isweb ? 85.w : null),
                Text(
                  "Password",
                  style: TextStyle(
                    fontSize: isweb ? null : 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.h),
            SizedBox(
              width: isweb ? 200.w : null,
              child: Obx(
                () => TextFormField(
                  validator:
                      (value) => Validator.validateEmptyText("Password", value),
                  controller: logincontroller.password,
                  obscureText:
                      logincontroller.hidepassword.value ? true : false,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        logincontroller.hidepassword.value =
                            !logincontroller.hidepassword.value;
                      },
                      icon: Icon(
                        logincontroller.hidepassword.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 216, 246, 180),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.h),
            Obx(
              () => Row(
                mainAxisAlignment:
                    isweb
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: isweb ? 35.w : null),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: logincontroller.remberme.value ? false : true,
                        onChanged: (value) {
                          logincontroller.remberme.value =
                              !logincontroller.remberme.value;
                        },
                      ),
                      Text(
                        "Remember Me",
                        style: TextStyle(
                          fontSize: isweb ? null : 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  isweb ? Container() : Spacer(),
                  SizedBox(width: isweb ? null : 20.w),
                  GestureDetector(
                    onTap: () => Get.to(() => ForgotPasswordScreen()),
                    child: Text(
                      "forgot password?",
                      style: TextStyle(
                        fontSize: isweb ? null : 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(width: isweb ? 30.w : 20.w),
                ],
              ),
            ),
            SizedBox(height: 21.h),
            SizedBox(
              width: isweb ? 200.w : 333.w,
              child: ElevatedButton(
                onPressed: () => logincontroller.login(isweb),
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Color.fromARGB(255, 188, 234, 114),
                  ),
                ),
                child: Text("login", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 50.h),
            InkWell(
              onTap: () {
                logincontroller.googlesignin();
              },
              child: Image.asset(
                ImagesStrings.googlelogo,
                width: isweb ? 60.w : 80.w,
                height: isweb ? 60.h : 80.h,
              ),
            ),
            SizedBox(height: isweb ? 30.h : 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don’t Have An Account?",
                  style: TextStyle(color: Appcolors.appgrey),
                ),

                GestureDetector(
                  onTap: () {
                    Get.offAll(ResopnsiveSignupScreen());
                  },
                  child: Text(
                    " Sign Up",
                    style: TextStyle(
                      color: Appcolors.fontcolourgreen,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
