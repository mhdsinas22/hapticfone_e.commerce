import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';
import 'package:hapticfone/common/widgets/tanimationloader_widget.dart';

class Tfullscreenloader {
  final bool isneedextraloding;
  Tfullscreenloader({required this.isneedextraloding});
  static void openLoadingDialog(String text, String animation, bool isweb) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder:
          (_) => PopScope(
            canPop: false,
            child: Container(
              color: Colors.white,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 250.h),
                  Tanimationloaderwidget(
                    text: text,
                    animation: animation,
                    isweb: isweb,
                  ),
                ],
              ),
            ),
          ),
    );
  }

  static void stoploading() {
    Navigator.of(Get.overlayContext!);
  }
}
