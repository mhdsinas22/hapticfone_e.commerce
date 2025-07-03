import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hapticfone/utils/constants/sizes.dart';

class Appbarcustomized extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centertile;
  final double fontsize;
  final FontWeight fontweight;
  final bool prefresizeneed;
  final Color backgorundcolr;
  final VoidCallback? onpressd;
  const Appbarcustomized({
    super.key,
    required this.title,
    this.centertile = true,
    this.fontsize = 32,
    this.fontweight = FontWeight.bold,
    this.prefresizeneed = true,
    this.backgorundcolr = Colors.white,
    this.onpressd,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.black,
      ), // ✅ back arrow black,elevation: 0,
      backgroundColor: backgorundcolr,
      centerTitle: centertile,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: fontsize,
          fontWeight: fontweight,
        ),
      ),
      bottom:
          prefresizeneed == true
              ? PreferredSize(
                preferredSize: Size.fromHeight(Sizes.appbarHeigth),
                child: Container(color: Colors.black, height: 1.w),
              )
              : PreferredSize(preferredSize: preferredSize, child: Container()),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.h);
}
