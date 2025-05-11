import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/widgets/appbar_customized/appbar_customized.dart';

class SmartwatchesScrrem extends StatelessWidget {
  const SmartwatchesScrrem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarcustomized(
        title: "Smart Watches",
        centertile: false,
        fontsize: 20.sp,
      ),
    );
  }
}
