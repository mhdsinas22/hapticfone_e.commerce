import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/common/widgets/container/rectangle_container.dart';
import 'package:hapticfone/common/widgets/pickupconfirmation_headside.dart';
import 'package:hapticfone/common/widgets/textbutton_customized.dart';
import 'package:hapticfone/features/store/screens/sell_screen/itemsadddetails/address_confriomtion.dart';
import 'package:hapticfone/features/store/screens/sell_screen/itemsadddetails/pickupconfirmtion/paymentprocssingscreen.dart';
import 'package:hapticfone/features/store/screens/sell_screen/itemsadddetails/pickupconfirmtion/pickupdateandday.dart';

class Pickupslot extends StatelessWidget {
  const Pickupslot({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(10.r),
        child: TextbuttonCustomized(
          heigth: 60,
          width: 160,
          text: "Next",
          onpressed: () => Get.to(() => Paymentprocssingscreen()),
          boxDecoration: BoxDecoration(color: Appcolors.appbuttongreen),
          textStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      appBar: Appbarcustomized(
        title: "Pick-up Confirmation",
        fontsize: 20.sp,
        centertile: false,
      ),
      body: Column(
        children: [
          PickupconfirmationHeadside(
            step2pickslopdesign: true,
            step1completed: true,
            onpress: () => Get.to(() => Addressconfirmation()),
          ),
          Padding(
            padding: EdgeInsets.all(14.r),
            child: Row(
              children: [
                SizedBox(width: 5.w),
                Text(
                  "Please select your preferable pickup date",
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Pickupdateandday(),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(12.r),
                child: Text(
                  'Your avaliability on that day',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RectangleContainer(
                width: 172,
                heigth: 34,
                boxDecoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "10:00 AM-02:00PM",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
              RectangleContainer(
                width: 172,
                heigth: 34,
                boxDecoration: BoxDecoration(
                  color: Appcolors.appbuttongreen,
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "02:00 PM-10:00PM",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
