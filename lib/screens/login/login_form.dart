import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/screens/forgotpassword/forgotpasswordscreen.dart';
import 'package:hapticfone/screens/login/logincontroller.dart';
import 'package:hapticfone/utils/validators/validator.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.put(Logincontroller());
    return Form(
      key: logincontroller.loginform,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: 30.sp),
              Text(
                "Email or Username",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 5.h),
          SizedBox(
            width: 322.w,
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
              SizedBox(width: 30.w),
              Text(
                "Password",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(height: 5.h),

          SizedBox(
            width: 322.w,
            child: Obx(
              () => TextFormField(
                validator:
                    (value) => Validator.validateEmptyText("Password", value),
                controller: logincontroller.password,
                obscureText: logincontroller.hidepassword.value ? true : false,
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
              children: [
                SizedBox(width: 10),
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
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(width: 60.w),
                GestureDetector(
                  onTap: () => Get.to(() => ForgotPasswordScreen()),
                  child: Text(
                    "forgot password?",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
              ],
            ),
          ),

          SizedBox(height: 21.h),
          SizedBox(
            width: 333.w,
            child: ElevatedButton(
              onPressed: () => logincontroller.login(),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Color.fromARGB(255, 188, 234, 114),
                ),
              ),
              child: Text("login", style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
