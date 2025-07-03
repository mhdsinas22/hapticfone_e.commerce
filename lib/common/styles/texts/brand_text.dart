import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandText extends StatelessWidget {
  final String startingfrom;
  final String price;

  const BrandText({
    super.key,
    required this.startingfrom,
    required this.price,
    this.isweb = false,
  });
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.r),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Text(
                    startingfrom,
                    style: TextStyle(fontSize: isweb ? null : 10.sp),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(price, style: TextStyle(fontSize: isweb ? null : 10.sp)),
            ],
          ),
        ],
      ),
    );
  }
}
