import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/alertsboxs/logout_alertbox.dart';
import 'package:hapticfone/repository/authenticationrepository.dart';
import 'package:hapticfone/screens/adderss_section/addadderss_screen.dart';
import 'package:hapticfone/screens/buy/order.dart';
import 'package:hapticfone/screens/profile/myprofile.dart';
import 'package:hapticfone/screens/sell/pickupscreen.dart';

class ProfileDetailsContainer extends StatelessWidget {
  const ProfileDetailsContainer({super.key, this.sellprofilescrren = false});
  final bool sellprofilescrren;
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
                    onTap: () => Get.to(() => Order()),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 358.w,
                      height: 80.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 30.w),
                          Image.asset(
                            "asset/box (2).png",
                            width: 34.w,
                            color: Colors.black,
                          ),
                          SizedBox(width: 20.w),
                          Text(
                            "My orders",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
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
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 358.w,
                      height: 80.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 30.w),
                          Image.asset(
                            "asset/delivery-location.png",
                            width: 34.w,
                            color: Colors.black,
                          ),
                          SizedBox(width: 20.w),
                          Text(
                            "My PickUp",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
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
                onTap: () => Get.to(Myprofile()),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 358.w,
                  height: 80.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 30.w),
                      Icon(Icons.person_rounded, size: 35.sp),
                      SizedBox(width: 20.w),
                      Text(
                        "My Profile",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
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
                onTap: () => Get.to(() => AddadderssScreen()),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  width: 358.w,
                  height: 80.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 30.w),
                      Icon(Icons.location_on, size: 35.sp),
                      SizedBox(width: 20.w),
                      Text(
                        "Address Book",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
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
              SizedBox(width: 10.w),
              Text(
                "Connect",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 358.w,
                height: 80.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 30.w),
                    Image.asset("asset/customer-care.png", width: 34),
                    // Icon(Icons.online_prediction, size: 35.sp),
                    SizedBox(width: 20.w),
                    Text(
                      "Customer Support",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 358.w,
                height: 80.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 30.w),
                    Image.asset("asset/instagram.png", width: 35.w),
                    // Icon(Icons.face, size: 35.sp),
                    SizedBox(width: 20.w),
                    Text(
                      "instagram",
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              SizedBox(width: 10.w),
              Text(
                "App",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(10),
                ),
                width: 358.w,
                height: 80.h,
                child: InkWell(
                  onTap: () {
                    // LogoutAlertbox object create cheythye ennit athinnte ullu method use cheythu
                    LogoutAlertbox(
                      onpressed:
                          () => Authenticationrepository.instance.logout(),
                      tittle: "Log Out?",
                      rightsidebuttontext: "Log Out",
                      leftsidebuttontext: "Cancel",
                      ctxx: context,
                      subtitletext: "Are you sure want to log Out",
                    ).logoualoert();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 30.w),
                      Icon(Icons.logout, size: 35.sp),
                      SizedBox(width: 20.w),
                      Text(
                        "LogOut",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
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
