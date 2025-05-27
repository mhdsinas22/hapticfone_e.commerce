import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/styles/colors/appcolors.dart';
import 'package:hapticfone/common/widgets/container/rectangle_container.dart';
import 'package:hapticfone/screens/sell/itemsadddetails/pickupconfirmtion/pickupslot.dart';

class PickupconfirmationHeadside extends StatelessWidget {
  const PickupconfirmationHeadside({
    super.key,
    this.step1completed = false,
    this.onpress,
    this.step2pickslopdesign = false,
    this.step2completed = false,
  });
  final bool step1completed;
  final VoidCallback? onpress;
  final bool step2pickslopdesign;
  final bool step2completed;
  @override
  Widget build(BuildContext context) {
    return step2completed == false
        ? Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  step1completed == false
                      ? Row(
                        children: [
                          Column(
                            children: [
                              RectangleContainer(
                                width: 43,
                                heigth: 45,
                                boxDecoration: BoxDecoration(
                                  border: Border.all(
                                    color: Appcolors.appbuttongreen,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "Address",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                            height: 1.h,
                            width: 80.w,
                            color: Colors.black,
                          ),
                        ],
                      )
                      : Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 15.h),
                              RectangleContainer(
                                width: 43,
                                heigth: 45,
                                boxDecoration: BoxDecoration(
                                  color: Appcolors.appbuttongreen,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text(
                                "Address",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: onpress,
                                child: Text(
                                  "(Edit)",
                                  style: TextStyle(
                                    color: Appcolors.appbuttongreen,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 1.h,
                            width: 80.w,
                            color: Colors.black,
                          ),
                        ],
                      ),
                  step2pickslopdesign == false
                      ? Column(
                        children: [
                          RectangleContainer(
                            width: 43,
                            heigth: 45,
                            boxDecoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Pickup Slot",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                      : Column(
                        children: [
                          RectangleContainer(
                            width: 43,
                            heigth: 45,
                            boxDecoration: BoxDecoration(
                              border: Border.all(
                                color: Appcolors.appbuttongreen,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                "2",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.sp,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "Pickup Slot",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                  Container(height: 1.h, width: 80.w, color: Colors.black),

                  Column(
                    children: [
                      RectangleContainer(
                        width: 43,
                        heigth: 45,
                        boxDecoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "3",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Payment",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(height: 1.h, width: 500.w, color: Colors.black),
          ],
        )
        : Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  step1completed == false
                      ? Row(
                        children: [
                          Column(
                            children: [
                              RectangleContainer(
                                width: 43,
                                heigth: 45,
                                boxDecoration: BoxDecoration(
                                  border: Border.all(
                                    color: Appcolors.appbuttongreen,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.sp,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "Address",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Container(
                            height: 1.h,
                            width: 80.w,
                            color: Colors.black,
                          ),
                        ],
                      )
                      : Row(
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 15.h),
                              RectangleContainer(
                                width: 43,
                                heigth: 45,
                                boxDecoration: BoxDecoration(
                                  color: Appcolors.appbuttongreen,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text(
                                "Address",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: onpress,
                                child: Text(
                                  "(Edit)",
                                  style: TextStyle(
                                    color: Appcolors.appbuttongreen,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 1.h,
                            width: 80.w,
                            color: Colors.black,
                          ),
                        ],
                      ),
                  Column(
                    children: [
                      SizedBox(height: 15.h),
                      RectangleContainer(
                        width: 43,
                        heigth: 45,
                        boxDecoration: BoxDecoration(
                          color: Appcolors.appbuttongreen,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.done,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Text(
                        "Pickup Slot",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: () => Get.to((Pickupslot())),
                        child: Text(
                          "(Edit)",
                          style: TextStyle(
                            color: Appcolors.appbuttongreen,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(height: 1.h, width: 80.w, color: Colors.black),

                  Column(
                    children: [
                      RectangleContainer(
                        width: 43,
                        heigth: 45,
                        boxDecoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "3",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        "Payment",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(height: 1.h, width: 500.w, color: Colors.black),
          ],
        );
  }
}
