import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hapticfone/colors/appcolors.dart';
import 'package:hapticfone/widgets/custom_bottomnavgtionbar_home.dart';
import 'package:hapticfone/widgets/custom_elveationbutton.dart';
import 'package:hapticfone/widgets/serach_textfiled.dart';

class Sellhomescreen extends StatelessWidget {
  const Sellhomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.h),
          child: Container(color: Colors.black, height: 1.h),
        ),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElveationbutton(
                text: "Buy",
                onPressed: () {
                  Get.off(CustomBottomnavgtionbarhome());
                },
                backgroundcolor: Colors.grey[400],
                forgroundcolor: Colors.black,
              ),
              SizedBox(width: 10),
              CustomElveationbutton(
                text: "Sell",
                onPressed: () {},
                backgroundcolor: Appcolors.appbuttongreen,
                forgroundcolor: Colors.white,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          SerachTextfiled(
            labeltext: "Search the Phone",
            prefix: Icon(Icons.search),
          ),
          Image.asset("asset/WhatsApp Image 2025-04-07 at 15.36.44.jpeg"),
        ],
      ),
    );
  }
}
