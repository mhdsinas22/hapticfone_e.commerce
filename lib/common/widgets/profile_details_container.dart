import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/styles/alertsboxs/logout_alertbox.dart';
import 'package:hapticfone/features/authentication/controllers/authentication_repository.dart';
import 'package:hapticfone/features/store/screens/sell_screen/pickupscreen.dart';
import 'package:hapticfone/responsive_screen/resopive_login_screen.dart';
import 'package:hapticfone/responsive_screen/responsive_address_screen.dart';
import 'package:hapticfone/responsive_screen/responsive_myprofile_screen.dart';
import 'package:hapticfone/responsive_screen/responsive_order_screen.dart';
import 'package:hapticfone/utils/constants/text_strings.dart';

class ProfileDetailsContainer extends StatelessWidget {
  const ProfileDetailsContainer({
    super.key,
    this.sellprofilescrren = false,
    this.isweb = false,
  });
  final bool sellprofilescrren;
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              sellprofilescrren == false
                  ? InkWell(
                    onTap: () => Get.to(() => ResponsiveOrderScreen()),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: isweb ? 200.w : 358.w,
                      height: 70.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: isweb ? 33.w : 30.w),
                          Image.asset(
                            "assets/box (2).png",
                            width: isweb ? 10.w : 29.w,
                            color: Colors.black,
                          ),
                          SizedBox(width: 20.w),
                          Text(
                            "My orders",
                            style: TextStyle(
                              fontSize: isweb ? 7.sp : 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  : InkWell(
                    onTap: () => Get.to(() => PickupScreen()),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 358.w,
                      height: 70.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 30.w),
                          Image.asset(
                            "assets/delivery-location.png",
                            width: isweb ? 20.w : 34.w,
                            color: Colors.black,
                          ),
                          SizedBox(width: 20.w),
                          Text(
                            "My PickUp",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Get.to(ResponsiveMyprofileScreen()),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: isweb ? 200.w : 358.w,
                  height: 70.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 30.w),
                      Icon(Icons.person_rounded, size: isweb ? 15.sp : 30.sp),
                      SizedBox(width: 20.w),
                      Text(
                        "My Profile",
                        style: TextStyle(
                          fontSize: isweb ? 7.sp : 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Get.to(() => ResponsiveAddressScreen()),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: isweb ? 200.w : 358.w,
                  height: 70.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 30.w),
                      Icon(Icons.location_on, size: isweb ? 15.sp : 30.sp),
                      SizedBox(width: 20.w),
                      Text(
                        "Address Book",
                        style: TextStyle(
                          fontSize: isweb ? 7.sp : 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              SizedBox(width: isweb ? 85.w : 1.w),
              Text(
                "Connect",
                style: TextStyle(
                  fontSize: isweb ? 7.sp : 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                width: isweb ? 200.w : 358.w,
                height: 70.h,
                child: InkWell(
                  onTap: () {
                    openwhatsapp();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 30.w),
                      Image.asset(
                        "assets/customer-care.png",
                        width: isweb ? 10.w : 29,
                      ),
                      // Icon(Icons.online_prediction, size: 35.sp),
                      SizedBox(width: 20.w),
                      Text(
                        "Customer Support",
                        style: TextStyle(
                          fontSize: isweb ? 7.sp : 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  openinstagrma();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: isweb ? 200.w : 358.w,
                  height: 70.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 30.w),
                      Image.asset(
                        "assets/instagram.png",
                        width: isweb ? 10.w : 29.w,
                      ),
                      // Icon(Icons.face, size: 35.sp),
                      SizedBox(width: 20.w),
                      Text(
                        "instagram",
                        style: TextStyle(
                          fontSize: isweb ? 7.sp : 19.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              SizedBox(width: isweb ? 85.w : 1.w),
              Text(
                "App",
                style: TextStyle(
                  fontSize: isweb ? 10.sp : 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                width: isweb ? 200.w : 358.w,
                height: 70.h,
                child: InkWell(
                  onTap: () {
                    // LogoutAlertbox object create cheythye ennit athinnte ullu method use cheythu
                    LogoutAlertbox(
                      onpressed:
                          () =>
                              isweb
                                  ? Get.off(ResopiveLoginScreen())
                                  : Authenticationrepository.instance.logout(),
                      tittle: "Log Out?",
                      rightsidebuttontext: "Log Out",
                      leftsidebuttontext: "Cancel",
                      ctxx: context,
                      subtitletext: "Are you sure want to log Out",
                    ).logoualoert(isweb);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 30.w),
                      Icon(Icons.logout, size: isweb ? 15.sp : 30.sp),
                      SizedBox(width: 20.w),
                      Text(
                        "LogOut",
                        style: TextStyle(
                          fontSize: isweb ? 7.sp : 19.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
