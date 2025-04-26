import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Image_container extends StatelessWidget {
  final Image brandimage;
  final Color backgroundcolor;
  final BoxDecoration? boxDecoration;
  Image_container({
    super.key,
    required this.brandimage,
    this.backgroundcolor = Colors.grey,
    this.boxDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: 66.w,
      height: 66.h,
      decoration: boxDecoration,
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(width: 50, height: 50, child: brandimage),
      ),
    );
  }
}
