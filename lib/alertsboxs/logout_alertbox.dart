import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/repository/authenticationrepository.dart';

class LogoutAlertbox {
  final VoidCallback? onpressed;
  final String tittle;
  final String subtitletext;
  final String leftsidebuttontext;
  final String rightsidebuttontext;
  final BuildContext ctxx;
  final signoutcontroler = Get.put(Authenticationrepository());
  LogoutAlertbox({
    required this.ctxx,
    required this.subtitletext,
    required this.leftsidebuttontext,
    required this.rightsidebuttontext,
    required this.tittle,
    this.onpressed,
  });
  Future logoualoert() => showDialog(
    context: ctxx,
    builder:
        (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          backgroundColor: Colors.white,
          content: SizedBox(
            width: 250.w,
            height: 120.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  subtitletext,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey[300],
                      ),
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          leftsidebuttontext,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 100.w,
                      height: 40.h,
                      decoration: BoxDecoration(color: Colors.red),
                      child: TextButton(
                        onPressed: onpressed,
                        child: Text(
                          rightsidebuttontext,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          title: Text(tittle, style: TextStyle(color: Colors.black)),
        ),
  );
}
