import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/controllers/usercontroller.dart';

class Myprofilewidgtes extends StatelessWidget {
  final Widget? child;
  const Myprofilewidgtes({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final usercontrollerrs = Get.put(Usercontroller());
    return Column(
      children: [
        CircleAvatar(
          maxRadius: 80.r,
          backgroundImage: AssetImage("asset/24.jpg"),
        ),
        SizedBox(height: 10),
        Obx(
          () => Text(
            usercontrollerrs.user.value.fullname,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
        ),
      ],
    );
  }
}
