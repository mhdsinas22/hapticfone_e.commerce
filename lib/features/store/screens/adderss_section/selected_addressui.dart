import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/common/styles/texts/bold_text.dart';
import 'package:hapticfone/features/store/models/addressmodels.dart';
import 'package:hapticfone/features/store/screens/adderss_section/address_controller.dart';

class Selectedaddressui extends StatelessWidget {
  const Selectedaddressui({
    super.key,
    required this.address,
    required this.ontap,
    this.isweb = false,
  });
  final Addressmodels address;
  final VoidCallback ontap;
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    final addresscontroller = Get.put(Addresscontroller());

    return Obx(
      () => InkWell(
        onTap: ontap,
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    address.id == addresscontroller.selectedaddress.value.id
                        ? Appcolors.appbuttongreen
                        : Colors.black,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            width: 347.w,
            height: isweb ? 500.h : 250.h,
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Boldtext(
                        text: address.fullname,
                        size: isweb ? 10 : 20,
                      ),
                    ),
                    if (address.id ==
                        addresscontroller.selectedaddress.value.id)
                      Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Icon(
                          Icons.check_circle,
                          color: Appcolors.appbuttongreen,
                        ),
                      ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Boldtext(
                        text: address.phonenumber.toString(),
                        size: isweb ? 10 : 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Boldtext(
                        text: address.landmark,
                        size: isweb ? 10 : 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Boldtext(
                        text: address.city,
                        size: isweb ? 10 : 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Boldtext(
                        text: address.state,
                        size: isweb ? 10 : 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Boldtext(
                        text: address.saveas,
                        size: isweb ? 10 : 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Boldtext(
                        text: address.pincode.toString(),
                        size: isweb ? 10 : 20,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Boldtext(
                        text: address.addresss,
                        size: isweb ? 6 : 16,
                        colors: Appcolors.greycolor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
