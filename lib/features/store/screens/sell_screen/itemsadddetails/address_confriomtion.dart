import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/common/widgets/container/rectangle_container.dart';
import 'package:hapticfone/common/widgets/pickupconfirmation_headside.dart';
import 'package:hapticfone/common/widgets/savedlocation_widget.dart';
import 'package:hapticfone/common/widgets/textbutton_customized.dart';
import 'package:hapticfone/features/store/screens/sell_screen/itemsadddetails/pickupconfirmtion/pickupslot.dart';

class Addressconfirmation extends StatelessWidget {
  const Addressconfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.r),
        child: TextbuttonCustomized(
          textStyle: TextStyle(
            fontSize: 20.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          text: "Next",
          onpressed: () => Get.to(() => Pickupslot()),
          width: 160,
          heigth: 60,
          boxDecoration: BoxDecoration(color: Appcolors.appbuttongreen),
        ),
      ),
      appBar: Appbarcustomized(
        title: "Pick-up Confirmation",
        fontsize: 20.sp,
        centertile: false,
      ),
      body: Column(
        children: [
          PickupconfirmationHeadside(),
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Text(
                        "Chosoe Your Address",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                RectangleContainer(
                  width: 340.w,
                  heigth: 50.h,
                  boxDecoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.location_pin, size: 40),
                      Text(
                        "Choose Your Address",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(Icons.gps_fixed),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(14.r),
                  child: Row(
                    children: [
                      Text(
                        "Saved Location",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SavedlocationWidget(
                  title: "Home",
                  subtitle: "Yespuder,coorr,Near pub,Bangalore,Karataka 56001",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
