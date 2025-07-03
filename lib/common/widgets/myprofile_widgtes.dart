import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/features/authentication/controllers/user_controller.dart';

class Myprofilewidgtes extends StatelessWidget {
  final Widget? child;
  const Myprofilewidgtes({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final usercontrollerrs = Get.put(Usercontroller());
    return Obx(
      () => Column(
        children: [
          CircleAvatar(
            maxRadius: 80.r,
            backgroundImage: NetworkImage(
              usercontrollerrs.user.value.profilepicture,
            ),
          ),
          SizedBox(height: 10),
          Obx(
            () => Text(
              usercontrollerrs.user.value.fullname,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
            ),
          ),
        ],
      ),
    );
  }
}
