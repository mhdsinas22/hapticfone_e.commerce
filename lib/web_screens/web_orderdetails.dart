import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/styles/texts/bold_text.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/common/widgets/container/bottmnavgiton_twobutton.dart';
import 'package:hapticfone/common/widgets/custom_bottomnavgitonbar/custom_bottomnavgtionbar_home.dart';
import 'package:lottie/lottie.dart';

class WebOrderDetails extends StatelessWidget {
  const WebOrderDetails({super.key, this.orderid = ""});
  final String orderid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomnavgtiontwoItens(
        isweb: true,
        textbuttontext1: "BACK TO HOME",
        onpressed1: () => Get.offAll(() => CustomBottomnavgtionbarhome()),
        textbuttontext2: "ORDER DETAILS",
        onpressed2:
            () =>
                Get.offAll(() => CustomBottomnavgtionbarhome(selectedindex: 3)),
      ),
      appBar: Appbarcustomized(title: "Order Details", fontsize: 10.sp),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Lottie.asset(
                repeat: false,
                "assets/animations/googlepaysucess edited.json",
                width: 100.w,
              ),
              Text(
                "Thank You!",
                style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
              ),
              Boldtext(text: "Your Order id is:-$orderid", size: 2.sp),
            ],
          ),
        ),
      ),
    );
  }
}
