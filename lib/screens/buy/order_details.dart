import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/common/widgets/container/bottmnavgitontwobutton.dart';
import 'package:hapticfone/common/widgets/container/rectangle_container.dart';
import 'package:hapticfone/common/widgets/custom_bottomnavgitonbar/custom_bottomnavgtionbar_home.dart';
import 'package:hapticfone/common/widgets/orderdetails_widgets.dart';
import 'package:hapticfone/screens/buy/order_status.dart';
import 'package:lottie/lottie.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomnavgtiontwoItens(
        textbuttontext1: "BACK TO HOME",
        onpressed1: () => Get.offAll(() => CustomBottomnavgtionbarhome()),
        textbuttontext2: "ORDER DETAILS",
        onpressed2: () => Get.offAll(() => OrderStatus()),
      ),
      appBar: Appbarcustomized(title: "Order Details", fontsize: 24.sp),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  repeat: false,
                  "asset/animations/googlepaysucess edited.json",
                  width: 300.w,
                ),
              ],
            ),
            Text(
              "Thank You!",
              style: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              "Your Order has been confirmed",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 20.h),
            RectangleContainer(
              boxDecoration: BoxDecoration(
                color: Colors.grey[400],
                border: Border.all(color: Colors.black),
              ),
              width: 290,
              heigth: 350,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(14.r),
                    child: Row(
                      children: [
                        Text(
                          "Order Details",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(width: 400.w, height: 1.h, color: Colors.black),
                  OrderdetailsWidgets(
                    subtile: "IPhone 13 Pro",
                    title: "Device",
                  ),
                  Container(color: Colors.black, height: 1.h, width: 400.w),
                  OrderdetailsWidgets(
                    title: "Address",
                    subtile: "yesboude Near Pub",
                  ),
                  Container(color: Colors.black, height: 1.h, width: 400.w),
                  OrderdetailsWidgets(
                    title: "Order Date",
                    subtile: "8 apr 2025",
                  ),
                  Container(color: Colors.black, height: 1.h, width: 400.w),
                  OrderdetailsWidgets(
                    title: "Schedule Date&Time",
                    subtile: "Thu 10 apr 2025",
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
