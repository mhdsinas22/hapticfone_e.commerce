import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:hapticfone/widgets/custom_bottomnavgitonbar/custom_bottomnavgtionbar_home.dart';
import 'package:lottie/lottie.dart';

class AnimatonsScreen extends StatelessWidget {
  final String anmation;
  final String text;
  const AnimatonsScreen({
    super.key,
    required this.anmation,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Get.offAll(CustomBottomnavgtionbarhome());
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(anmation, width: 300.w),
            SizedBox(height: 20),
            Text(
              text,
              style: TextStyle(
                fontSize: 25,
                color: Colors.grey[400],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
