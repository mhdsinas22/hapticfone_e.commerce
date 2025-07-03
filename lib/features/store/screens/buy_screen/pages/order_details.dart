import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/styles/texts/bold_text.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/common/widgets/container/bottmnavgiton_twobutton.dart';
import 'package:hapticfone/common/widgets/custom_bottomnavgitonbar/custom_bottomnavgtionbar_home.dart';
import 'package:lottie/lottie.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, this.orderid = ""});
  final String orderid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomnavgtiontwoItens(
        textbuttontext1: "BACK TO HOME",
        onpressed1: () => Get.offAll(() => CustomBottomnavgtionbarhome()),
        textbuttontext2: "ORDER DETAILS",
        onpressed2:
            () =>
                Get.offAll(() => CustomBottomnavgtionbarhome(selectedindex: 3)),
      ),
      appBar: Appbarcustomized(title: "Order Details", fontsize: 24.sp),
      body: Center(
        child: Column(
          children: [
            Lottie.asset(
              repeat: false,
              "assets/animations/googlepaysucess edited.json",
              width: 300.w,
            ),
            Text(
              "Thank You!",
              style: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.bold),
            ),
            Boldtext(text: "Your Order id is:-$orderid", size: 16.sp),
          ],
        ),
      ),
    );
  }
}
