import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:hapticfone/common/widgets/profile_details_container.dart';
import 'package:hapticfone/features/authentication/controllers/user_controller.dart';
import 'package:hapticfone/common/styles/effects/shimmer_effect.dart';

class WebProfile extends StatelessWidget {
  const WebProfile({super.key, this.sellprofile = false});
  final bool sellprofile;

  @override
  Widget build(BuildContext context) {
    final usercontroller = Get.put(Usercontroller());
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
                Obx(() {
                  final profilepicture =
                      usercontroller.user.value.profilepicture;
                  if (usercontroller.proflieLoading.value) {
                    return ShimmerEffect(heigth: 50.h, width: 50.w);
                  } else {
                    return CircleAvatar(
                      maxRadius: 80.r,
                      backgroundImage:
                          profilepicture.isEmpty
                              ? AssetImage("assets/24.jpg")
                              : NetworkImage(
                                usercontroller.user.value.profilepicture,
                              ),
                    );
                  }
                }),
              ],
            ),
            Obx(() {
              if (controlleruser.proflieLoading.value) {
                return ShimmerEffect(heigth: 10.h, width: 50.w);
              } else {
                return Text(
                  controlleruser.user.value.fullname,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                );
              }
            }),
            Row(
              children: [
                SizedBox(width: 90.w),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 8.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            sellprofile == false
                ? ProfileDetailsContainer(isweb: true)
                : ProfileDetailsContainer(sellprofilescrren: true),
          ],
        ),
      ),
    );
  }
}
