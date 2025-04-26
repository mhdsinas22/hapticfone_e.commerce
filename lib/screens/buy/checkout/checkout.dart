import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/colors/appcolors.dart';
import 'package:hapticfone/texts/address_text.dart';
import 'package:hapticfone/texts/phonedetils_text.dart';
import 'package:hapticfone/widgets/appbar_customized.dart';
import 'package:hapticfone/widgets/cashtotal_continer.dart';
import 'package:hapticfone/widgets/container/rectangle_container.dart';
import 'package:hapticfone/widgets/redio_widget.dart';
import 'package:hapticfone/widgets/textbutton_customized.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    int selectedvalue = 1;
    return Scaffold(
      appBar: Appbarcustomized(
        title: "Checkout",
        centertile: false,
        fontsize: 20,
        fontweight: FontWeight.w800,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.r),
              child: RectangleContainer(
                boxDecoration: BoxDecoration(border: Border.all()),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(width: 25),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Order Summary",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset("asset/17.png", width: 200),
                        Column(children: [PhonedetilsText()]),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Material(
                elevation: 10,
                child: RectangleContainer(
                  boxDecoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Text(
                              "Order Address",
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Addresstext(),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: RectangleContainer(
                boxDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: Appcolors.mygreen),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.r),
                          child: Text(
                            "Select Payment Method",
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    RedioWidget(
                      value: 1,
                      selectvalue: selectedvalue,
                      title: "Online Payment",
                    ),
                    RedioWidget(
                      value: 2,
                      selectvalue: selectedvalue,
                      title: "Cash On Delivery",
                    ),
                  ],
                ),
              ),
            ),
            CashtotalContainer(),
            SizedBox(height: 10.h),
            TextbuttonCustomized(
              heigth: 62.h,
              width: 320.w,
              text: "Place Order",
              onpressed: () {},
              textStyle: TextStyle(fontSize: 20.sp, color: Colors.white),
              boxDecoration: BoxDecoration(color: Appcolors.appbuttongreen),
            ),
          ],
        ),
      ),
    );
  }
}
