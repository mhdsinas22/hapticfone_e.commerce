import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/features/authentication/controllers/user_controller.dart';
import 'package:hapticfone/common/styles/effects/shimmer_effect.dart';

class Profilenameetc extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isweb;
  const Profilenameetc({
    super.key,
    required this.title,
    required this.subtitle,
    this.isweb = false,
  });

  @override
  Widget build(BuildContext context) {
    final usercontroller = Get.put(Usercontroller());
    // final scrrenwitdth = MediaQuery.of(context).size.height;
    return Obx(() {
      if (usercontroller.proflieLoading.value) {
        return ShimmerEffect(heigth: 84.h, width: 347.w);
      } else {
        return Container(
          width: 347.w,
          height: isweb ? 80.h : 84.h,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: isweb ? 5.sp : 20.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Obx(() {
                        if (usercontroller.proflieLoading.value) {
                          return ShimmerEffect(heigth: 40, width: 200);
                        } else {
                          return Text(
                            subtitle,
                            style: TextStyle(
                              fontSize: isweb ? 4.sp : 15.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                      }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      }
    });
  }
}
