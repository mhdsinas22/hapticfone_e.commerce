import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/styles/alertsboxs/logout_alertbox.dart';
import 'package:hapticfone/common/widgets/custom_bottomnavgitonbar/custom_bottomnavgtionbar_home.dart';
import 'package:hapticfone/responsive_screen/responsive_editprofile.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/common/widgets/container/profile_name_etc_container.dart';
import 'package:hapticfone/common/widgets/myprofile_widgtes.dart';
import 'package:hapticfone/common/widgets/textbutton_customized.dart';
import 'package:hapticfone/features/authentication/controllers/user_controller.dart';

class Myprofile extends StatelessWidget {
  const Myprofile({super.key});

  @override
  Widget build(BuildContext context) {
    final usercontroller = Get.put(Usercontroller());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.offAll(() => CustomBottomnavgtionbarhome(selectedindex: 4));
          },
          icon: Icon(Icons.arrow_back),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(10.h),
          child: Container(height: 1, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        title: Text(
          "MY PROFILE",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 35.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Myprofilewidgtes()],
            ),
            SizedBox(height: 10.h),
            Obx(
              () => Profilenameetc(
                title: "NAME",
                subtitle: usercontroller.user.value.fullname,
              ),
            ),
            SizedBox(height: 12.h),
            Obx(
              () => Profilenameetc(
                title: "ACCOUNT INFORMATION",
                subtitle: usercontroller.user.value.email,
              ),
            ),
            SizedBox(height: 12.h),
            Obx(
              () => Profilenameetc(
                title: "PHONE NUMBER",
                subtitle: usercontroller.user.value.phonenumber,
              ),
            ),
            SizedBox(height: 15.h),
            TextbuttonCustomized(
              boxDecoration: BoxDecoration(
                color: Appcolors.appbuttongreen,
                borderRadius: BorderRadius.circular(10),
              ),
              text: "Edit Profile",
              onpressed:
                  () => Get.to(
                    ResponsiveEditprofile(
                      imageurl: usercontroller.user.value.profilepicture,
                    ),
                  ),
              textStyle: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10.h),
            TextbuttonCustomized(
              boxDecoration: BoxDecoration(
                color: const Color.fromARGB(255, 241, 29, 14),
                borderRadius: BorderRadius.circular(10),
              ),
              text: "DELETE ACCOUNT ",
              onpressed: () {
                LogoutAlertbox(
                  onpressed: () => usercontroller.deleteUserAccount(),
                  ctxx: context,
                  tittle: "Delete Account",
                  subtitletext: "Are you sure want to Delete Account",
                  leftsidebuttontext: "Cancel",
                  rightsidebuttontext: "Delete",
                ).logoualoert(false);
              },
              textStyle: TextStyle(
                fontSize: 15.sp,
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
