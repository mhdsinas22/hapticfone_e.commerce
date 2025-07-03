import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hapticfone/common/styles/spacing_styles.dart';

import 'package:hapticfone/features/authentication/screens/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenwidth = MediaQuery.of(context).size.width;
    // double screenheight = MediaQuery.of(context).size.height;
    // final logincontrllor = Get.put(Logincontroller());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200.h),
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
                  // SizedBox(height: 30.h),
                  Text(
                    "Log In Account",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Hello, Welcome back to our account!",
                    style: TextStyle(
                      fontSize: 16.sp,
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
          children: [
            // SizedBox(height: 100.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [LoginForm()],
                ),
              ],
            ),

            // SizedBox(height: 20.h),
            // SizedBox(
            //   // width: 350.w,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         "______________",
            //         style: TextStyle(color: Appcolors.appgrey),
            //       ),
            //       Text(
            //         " Or Log in With ",
            //         style: TextStyle(color: Appcolors.appgrey),
            //       ),
            //       Text(
            //         "______________",
            //         style: TextStyle(color: Appcolors.appgrey, fontSize: 10.sp),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
