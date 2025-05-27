import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandContainer extends StatelessWidget {
  final Image brandimage;
  final Color backgroundcolor;
  final BoxDecoration? boxDecoration;
  const BrandContainer({
    super.key,
    required this.brandimage,
    this.backgroundcolor = Colors.grey,
    this.boxDecoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 66.w,
      height: 66.h,
      decoration: BoxDecoration(
        color: Colors.grey[400],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(width: 50, height: 50, child: brandimage),
      ),
    );
  }
}
