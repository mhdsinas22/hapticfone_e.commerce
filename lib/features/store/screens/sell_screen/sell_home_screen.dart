import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hapticfone/common/widgets/textbutton_customized.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/common/widgets/custom_bottomnavgitonbar/custom_bottomnavgtionbar_home.dart';
import 'package:hapticfone/common/widgets/custom_elveationbutton.dart';
import 'package:hapticfone/utils/constants/images_strings.dart';
import 'package:lottie/lottie.dart';

class Sellhomescreen extends StatelessWidget {
  const Sellhomescreen({super.key, this.isweb = false});
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(isweb ? 10.h : 20.h),
          child: Container(color: Colors.black, height: 1.h),
        ),
        title: Center(
          child:
              isweb
                  ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap:
                            () =>
                                Get.offAll(() => CustomBottomnavgtionbarhome()),
                        child: TextbuttonCustomized(
                          heigth: isweb ? 35 : 50,
                          width: 30,
                          text: "Buy",
                          onpressed:
                              () => Get.offAll(
                                () => CustomBottomnavgtionbarhome(),
                              ),
                          textStyle: TextStyle(
                            color: Appcolors.black,
                            fontSize: isweb ? 5.sp : 8.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          boxDecoration: BoxDecoration(
                            color: Appcolors.appgrey,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      InkWell(
                        onTap: () {},
                        child: TextbuttonCustomized(
                          heigth: isweb ? 35 : 50,
                          width: 30,
                          text: "Sell",
                          onpressed: () {},
                          textStyle: TextStyle(
                            color: Appcolors.white,
                            fontSize: 5.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          boxDecoration: BoxDecoration(
                            color: Appcolors.appbuttongreen,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ],
                  )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomElveationbutton(
                        text: "Buy",
                        onPressed: () {
                          Get.off(CustomBottomnavgtionbarhome());
                        },
                        backgroundcolor: Colors.grey[400],
                        forgroundcolor: Colors.black,
                      ),
                      SizedBox(width: 10),
                      CustomElveationbutton(
                        text: "Sell",
                        onPressed: () {},
                        backgroundcolor: Appcolors.appbuttongreen,
                        forgroundcolor: Colors.white,
                      ),
                    ],
                  ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AppAnimatons.workinganimatinblackcolor),
            SizedBox(height: 10),
            Text(
              "Selling made easy — Coming Soon!",
              style: TextStyle(
                fontSize: isweb ? 8.sp : 18.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      // body: Column(
      //   children: [
      //     SizedBox(height: 10.h),
      //     SerachTextfiled(
      //       labeltext: "Search the Phone",
      //       prefix: Icon(Icons.search),
      //     ),
      //     Image.asset("asset/WhatsApp Image 2025-04-07 at 15.36.44.jpeg"),
      //     Expanded(
      //       child: Column(
      //         children: [
      //           Text(
      //             "Got an old Phone? Want Ready Cash Today",
      //             style: TextStyle(
      //               color: Colors.grey,
      //               fontSize: 30.sp,
      //               fontWeight: FontWeight.w700,
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
    );
  }
}
