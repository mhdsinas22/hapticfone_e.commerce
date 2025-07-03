import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/styles/spacing_styles.dart';
import 'package:hapticfone/responsive_screen/resopive_login_screen.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/features/authentication/screens/signup_form.dart';
import 'package:hapticfone/utils/constants/images_strings.dart';

class WebSignupscreen extends StatelessWidget {
  const WebSignupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(210.h),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    const Color.fromARGB(255, 242, 252, 232),
                    const Color.fromARGB(255, 236, 245, 225),
                  ],
                ),
              ),
            ),
            Padding(
              padding: SpacingStyles.paddingwithappbarheight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Text(
                    "Sign Up Account",
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Hello, Welcome back to our account!",
                    style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFA8A6A6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.all(10.0), child: Signupform()),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "____________________",
                  style: TextStyle(color: Appcolors.appgrey),
                ),
                Text(
                  " Or Log in With ",
                  style: TextStyle(color: Appcolors.appgrey),
                ),
                Text(
                  "_________________",
                  style: TextStyle(color: Appcolors.appgrey),
                ),
              ],
            ),
            SizedBox(height: 50),
            Image.asset(ImagesStrings.googlelogo, width: 80.w, height: 80.h),
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
                    " Sign in",
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
