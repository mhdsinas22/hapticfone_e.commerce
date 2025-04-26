import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/texts/address_text.dart';
import 'package:hapticfone/texts/phonedetils_text.dart';
import 'package:hapticfone/widgets/appbar_customized.dart';
import 'package:hapticfone/widgets/container/rectangle_container.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarcustomized(
        title: "Checkout",
        centertile: false,
        fontsize: 20,
        fontweight: FontWeight.w800,
      ),
      body: Column(
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
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            "Pickup Address",
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
        ],
      ),
    );
  }
}
