import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/styles/spacing_styles.dart';
import 'package:hapticfone/features/store/controllers/cart_controller.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/common/widgets/container/rectangle_container.dart';

class CashtotalContainer extends StatelessWidget {
  CashtotalContainer({super.key, this.isweb = false});
  final cartcontroller = Get.put(CartController());
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cartcontroller.calculateTotal();
    });

    return Padding(
      padding: SpacingStyles.paddingwithappbarheight,
      child: RectangleContainer(
        width: 371,
        heigth: isweb ? 200.h : 145,
        boxDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Appcolors.mygreen),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(18.r),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Cash Total",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: isweb ? 6.sp : 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Obx(
                        () => Text(
                          "₹${cartcontroller.total.value}",
                          style: TextStyle(
                            fontSize: isweb ? 6.sp : 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Charge",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: isweb ? 6.sp : 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Free",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: isweb ? 6.sp : 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Container(width: 371.w, height: 1.h, color: Colors.black),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Amount",
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: isweb ? 6.sp : 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Obx(
                        () => Text(
                          "₹${cartcontroller.total.value}",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: isweb ? 6.sp : 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
