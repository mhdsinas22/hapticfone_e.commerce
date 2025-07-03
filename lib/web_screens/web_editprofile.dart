import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/common/widgets/textbutton_customized.dart';
import 'package:hapticfone/features/authentication/controllers/updatename_controller.dart';
import 'package:hapticfone/features/store/screens/profile/eidt_avatar.dart';
import 'package:hapticfone/features/store/screens/profile/edit_filed_widgets.dart';

class WebEditprofile extends StatelessWidget {
  const WebEditprofile({super.key, required this.imageurl});
  final String imageurl;

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
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Row(
                children: [
                  SizedBox(width: 2.w),
                  Text(
                    "UPLOAD IMAGE",
                    style: TextStyle(
                      // fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            EditCircleavatar(imageurl: imageurl, isweb: true),
            EidtfiledWidgets(isweb: true),
            SizedBox(height: 30.h),
            TextbuttonCustomized(
              boxDecoration: BoxDecoration(
                color: Appcolors.appbuttongreen,
                borderRadius: BorderRadius.circular(10),
              ),
              text: "Save ",
              onpressed: () {
                updateusercontroller.updateuserdeatils();
              },
              textStyle: TextStyle(
                // fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
