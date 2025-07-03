import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hapticfone/common/styles/spacing_styles.dart';

import 'package:hapticfone/features/authentication/screens/signup_form.dart';

class Signupscreen extends StatelessWidget {
  const Signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160.h),
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
                      fontSize: 32.sp,
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
            // SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Signupform()],
            ),
            // SizedBox(height: 10),
            Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     Text(
                //       "____________________",
                //       style: TextStyle(color: Appcolors.appgrey),
                //     ),
                //     Text(
                //       " Or Log in With ",
                //       style: TextStyle(color: Appcolors.appgrey),
                //     ),
                //     Text(
                //       "_________________",
                //       style: TextStyle(color: Appcolors.appgrey),
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
