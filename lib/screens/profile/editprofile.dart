import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/colors/appcolors.dart';
import 'package:hapticfone/controllers/updatename_controller.dart';
import 'package:hapticfone/screens/profile/eidtciecleavatar.dart';
import 'package:hapticfone/screens/profile/eidtfiled_widgets.dart';
import 'package:hapticfone/widgets/textbutton_customized.dart';

class Editprofile extends StatelessWidget {
  const Editprofile({super.key});

  @override
  Widget build(BuildContext context) {
    final updateusercontroller = Get.put(UpdateUserdetailsController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.h),
          child: Container(height: 1, color: Colors.black),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.r),
            child: Row(
              children: [
                SizedBox(width: 10.w),
                Text(
                  "UPLOAD IMAGE",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          EditCircleavatar(),
          EidtfiledWidgets(),
          SizedBox(height: 30.h),
          TextbuttonCustomized(
            boxDecoration: BoxDecoration(
              color: Appcolors.appbuttongreen,
              borderRadius: BorderRadius.circular(10),
            ),
            text: "Save ",
            onpressed: () => updateusercontroller.updateuserdeatils(),
            textStyle: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
