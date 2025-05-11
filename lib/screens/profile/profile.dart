import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:hapticfone/controllers/usercontroller.dart';
import 'package:hapticfone/effects/shimmer_effect.dart';
import 'package:hapticfone/widgets/profile_details_container.dart';

class Profile extends StatelessWidget {
  const Profile({super.key, this.sellprofile = false});
  final bool sellprofile;
  @override
  Widget build(BuildContext context) {
    final controlleruser = Get.put(Usercontroller());
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  maxRadius: 80.r,
                  backgroundImage: AssetImage("asset/24.jpg"),
                ),
              ],
            ),
            Obx(() {
              if (controlleruser.proflieLoading.value) {
                return ShimmerEffect(heigth: 20.h, width: 200.w);
              } else {
                return Text(
                  controlleruser.user.value.fullname,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                );
              }
            }),
            Row(
              children: [
                SizedBox(width: 30.w),
                Text(
                  "Account",
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            sellprofile == false
                ? ProfileDetailsContainer()
                : ProfileDetailsContainer(sellprofilescrren: true),
          ],
        ),
      ),
    );
  }
}
