import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:hapticfone/controllers/usercontroller.dart';
import 'package:hapticfone/screens/profile/circleimage.dart';

class EditCircleavatar extends StatelessWidget {
  final Widget? child;
  const EditCircleavatar({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    final usercontroller = Get.put(Usercontroller());
    final netweokimahe = usercontroller.user.value.profilepicture;
    final image = netweokimahe.isNotEmpty ? netweokimahe : "asset/24.jpg";
    return Column(
      children: [
        Stack(
          children: [
            Circleimage(image: image),
            // Positioned(
            //   child: InkWell(
            //     onTap: () => usercontroller.updateuserprofile(),
            //     child: Container(
            //       height: 40.h,
            //       width: 150.w,
            //       decoration: BoxDecoration(
            //         shape: BoxShape.circle,
            //         color: Appcolors.appbuttongreen,
            //       ),
            //       child: Icon(Icons.edit, color: Colors.white),
            //     ),
            //   ),
            // ),
          ],
        ),
        InkWell(
          onTap: () => usercontroller.updateuserprofile(),
          child: Text("Edit profle"),
        ),
        SizedBox(height: 10.h),

        Obx(
          () => Text(
            Usercontroller.instance.user.value.fullname,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
        ),
      ],
    );
  }
}
