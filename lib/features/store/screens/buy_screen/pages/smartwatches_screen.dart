import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/common/styles/texts/bold_text.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:lottie/lottie.dart';

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
      body: Center(
        child: Column(
          children: [
            Lottie.asset("assets/animations/Animation - 1748336640713.json"),
            Center(
              child: Boldtext(
                text: "Smart Watch new stock arriving shortly. Stay connected!",
                size: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
