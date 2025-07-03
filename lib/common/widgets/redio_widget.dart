import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/features/store/controllers/radio_controller.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';

class RadioWidget extends StatelessWidget {
  final String selectvalue;
  final String title;
  final dynamic value;
  final double fontsize;
  const RadioWidget({
    super.key,
    required this.selectvalue,
    required this.title,
    required this.value,
    this.isneedgirdview = false,
    this.fontsize = 16,
  });
  final bool isneedgirdview;
  @override
  Widget build(BuildContext context) {
    final radioController = Get.put(Radiocontroller());
    return isneedgirdview == true
        ? Radio<String>(
          // title: Text(
          //   title,
          //   style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
          // ),
          value: value,
          activeColor: Appcolors.appbuttongreen,
          onChanged: (value) {
            radioController.selectedvalue.value = value!;
          },
          groupValue: radioController.selectedvalue.value,
        )
        : RadioListTile(
          title: Text(
            title,
            style: TextStyle(
              fontSize: fontsize.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          value: value,
          activeColor: Appcolors.appbuttongreen,
          onChanged: (value) {
            radioController.selectedvalue.value = value!;
            print("SELEV:${radioController.selectedvalue.value}");
          },
          groupValue: radioController.selectedvalue.value,
        );
  }
}
