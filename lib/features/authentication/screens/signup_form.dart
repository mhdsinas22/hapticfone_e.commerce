import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/container/rectangle_container.dart';
import 'package:hapticfone/features/authentication/controllers/login_controller.dart';
import 'package:hapticfone/features/authentication/controllers/signup_contoller.dart';
import 'package:hapticfone/responsive_screen/resopive_login_screen.dart';
import 'package:hapticfone/termsandcondtions/terms_condtions.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/utils/constants/images_strings.dart';

import 'package:hapticfone/utils/constants/validator.dart';

class Signupform extends StatelessWidget {
  const Signupform({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Signupcontoller());
    final logincontroller = Get.put(Logincontroller());
    return Form(
      key: controller.signupform,
      child: RectangleContainer(
        // boxDecoration: BoxDecoration(color: Appcolors.appbuttongreen),
        width: 330,
        heigth: MediaQuery.of(context).size.height,

        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                Text(
                  "Full Name",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            SizedBox(height: 5.h),
            SizedBox(
              child: TextFormField(
                controller: controller.fullname,
                validator:
                    (value) => Validator.validateEmptyText("Full Name", value),
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
                Text(
                  "Email",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 5),

            SizedBox(
              child: TextFormField(
                controller: controller.email,
                validator: (value) => Validator.validateEmail(value),
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
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "PhoneNumber",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 5),
            SizedBox(
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: controller.phonenumber,
                validator: (value) => Validator.validatePhoneNumber(value),
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
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Password",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 5),
            SizedBox(
              child: Obx(
                () => TextFormField(
                  obscureText: controller.hidepassword.value,
                  controller: controller.password,
                  validator: (value) => Validator.validatePassword(value),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed:
                          () =>
                              controller.hidepassword.value =
                                  !controller.hidepassword.value,
                      icon: Icon(
                        // ignore: unrelated_type_equality_checks
                        controller.hidepassword == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                    filled: true,
                    fillColor: const Color.fromARGB(255, 216, 246, 180),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(height: 5),
            Row(children: [Termsandcondtions()]),
            SizedBox(height: 21),

            SizedBox(
              width: 400,
              child: ElevatedButton(
                onPressed: () {
                  controller.signup();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                    Color.fromARGB(255, 188, 234, 114),
                  ),
                ),
                child: Text("Sign Up", style: TextStyle(color: Colors.white)),
              ),
            ),
            SizedBox(height: 20.h),
            InkWell(
              onTap: () {
                logincontroller.googlesignin();
              },
              child: Image.asset(
                ImagesStrings.googlelogo,
                width: 80.w,
                height: 80.h,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Appcolors.appgrey),
                ),

                GestureDetector(
                  onTap: () {
                    Get.to(ResopiveLoginScreen());
                  },
                  child: Text(
                    "Sign in",
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
