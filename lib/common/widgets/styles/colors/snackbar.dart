import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:hapticfone/common/widgets/styles/colors/appcolors.dart';

class Snackbar {
  static waringsnakbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Appcolors.red,
      colorText: Appcolors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(10.r),
    );
  }
}
