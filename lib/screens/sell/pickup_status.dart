import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:hapticfone/alertsboxs/logout_alertbox.dart';
import 'package:hapticfone/common/widgets/styles/colors/appcolors.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/common/widgets/container/bottmnavgitontwobutton.dart';
import 'package:hapticfone/common/widgets/container/rectangle_container.dart';
import 'package:hapticfone/common/widgets/custom_bottomnavgitonbar/custombottmnavgbar_forsellside.dart';
import 'package:hapticfone/common/widgets/order_status_seroivenumber_date.dart';
import 'package:hapticfone/common/widgets/orderproces_widget.dart';
import 'package:hapticfone/common/widgets/textbutton_customized.dart';
import 'package:hapticfone/texts/address_text.dart';

class Pickupstatus extends StatelessWidget {
  const Pickupstatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomnavgtiontwoItens(
        textbuttontext1: "BACK TO HOME",
        textbuttontext2: "Cancel Pickup",
        onpressed1: () => Get.offAll(() => CustombottmnavgbarForsellside()),
        onpressed2:
            () =>
                LogoutAlertbox(
                  ctxx: context,
                  subtitletext: "",
                  leftsidebuttontext: "No",
                  rightsidebuttontext: "Cancel The Pickup",
                  tittle: "Are You Sure",
                ).logoualoert(),
        textcolor: Colors.red,
        bordercolr: Colors.red,
        buttomcolr: Colors.white,
      ),
      appBar: Appbarcustomized(title: "Order Details"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(20.r),
              child: Row(
                children: [
                  Text(
                    "Device Details",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 200.h,
                  width: 165.w,
                  color: Colors.white,
                  child: Image.asset(fit: BoxFit.cover, "asset/17.png"),
                ),
                Column(
                  children: [
                    TextbuttonCustomized(
                      textStyle: TextStyle(color: Appcolors.fontcolourgreen),
                      width: 130.w,
                      heigth: 30.h,
                      boxDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromARGB(255, 212, 231, 181),
                      ),
                      text: "Order Requested",
                      onpressed: () {},
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Apple IPhone 13 Pro",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    OrderStatusSeroivenumberDate(
                      text: "Service Number",
                      textStyle: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    OrderStatusSeroivenumberDate(
                      text: "MPMTB15092838",
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    OrderStatusSeroivenumberDate(
                      text: "Order Created On:",
                      textStyle: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    OrderStatusSeroivenumberDate(
                      text: "8 Apr 2025",
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    OrderStatusSeroivenumberDate(
                      text: "Your Predict Price",
                      textStyle: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    OrderStatusSeroivenumberDate(
                      text: "₹44999",
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Material(
                elevation: 15,
                child: RectangleContainer(
                  boxDecoration: BoxDecoration(color: Colors.white),
                  width: 266.w,
                  heigth: 630.h,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.r),
                        child: Row(
                          children: [
                            Text(
                              "Pickup Status",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(height: 1.h, width: 600.w, color: Colors.black),
                      SizedBox(height: 30.h),
                      OrderprocesWidget(
                        child: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 25.sp,
                        ),
                      ),
                      OrderprocesWidget(
                        ordercomments: "Pickup Confirmed",
                        lineheight: 60.h,
                        dateandday: "",
                        time: "",
                        circleavatarbackgroundcolor: Appcolors.appgrey,
                      ),
                      OrderprocesWidget(
                        ordercomments: "Pickup Started",
                        lineheight: 60.h,
                        dateandday: "",
                        time: "",
                        circleavatarbackgroundcolor: Appcolors.appgrey,
                      ),
                      OrderprocesWidget(
                        isneedline: false,
                        ordercomments: "Pickup Completed",
                        lineheight: 60.h,
                        dateandday: "",
                        time: "",
                        circleavatarbackgroundcolor: Appcolors.appgrey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Addresstext(),
          ],
        ),
      ),
    );
  }
}
