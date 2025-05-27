import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/styles/colors/appcolors.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/common/widgets/textbutton_customized.dart';
import 'package:hapticfone/screens/sell/itemsadddetails/address_confriomtion.dart';

class Setaprice extends StatelessWidget {
  Setaprice({super.key});
  final TextEditingController pricecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarcustomized(
        title: "Set a Price",
        centertile: false,
        fontsize: 18.sp,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              children: [
                TextFormField(
                  controller: pricecontroller,
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: "₹Price",
                    hintStyle: TextStyle(color: Colors.grey[400]),
                  ),
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "You set the price – we’ll come to your home and check the phone – if the condition is good, you’ll get instant cash  – if the condition is poor or if there are any complaints, the cash amount will be negotiable",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(13.r),
            child: TextbuttonCustomized(
              width: 322.w,
              heigth: 58.h,
              boxDecoration: BoxDecoration(color: Appcolors.appbuttongreen),
              text: "Next",
              onpressed: () => Get.to(() => Addressconfirmation()),
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
