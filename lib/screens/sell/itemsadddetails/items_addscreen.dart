import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:hapticfone/colors/appcolors.dart';
import 'package:hapticfone/screens/sell/itemsadddetails/setaprice.dart';
import 'package:hapticfone/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/widgets/container/rectangle_container.dart';
import 'package:hapticfone/widgets/textbutton_customized.dart';

class ItemsAddscreen extends StatelessWidget {
  const ItemsAddscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarcustomized(
        title: "Add Details",
        prefresizeneed: false,
        backgorundcolr: Appcolors.appbuttongreen,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RectangleContainer(
                  width: 276,
                  heigth: 136,
                  boxDecoration: BoxDecoration(border: Border.all()),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image),
                      Text(
                        "Add Image",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RectangleContainer(
                  width: 266,
                  heigth: 80,
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "Real Photos attached-minor cracks & edge wear shown clearly,no hidden issues.",
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "0/10",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20.r),
              child: TextFormField(
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: "Brand",
                  hintStyle: TextStyle(color: Colors.grey[400]),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: "Ad title",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      RectangleContainer(
                        heigth: 50.h,
                        width: 258.w,
                        child: Text(
                          "Mention the key features of your item (eg brand, model,type)",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: "Describe what you are selling",
                      hintStyle: TextStyle(color: Colors.grey[400]),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      RectangleContainer(
                        heigth: 50.h,
                        width: 290.w,
                        child: Text(
                          "Include condtion features and reson for selling",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Padding(
              padding: EdgeInsets.all(12.r),
              child: TextbuttonCustomized(
                width: 322.w,
                heigth: 61.h,
                boxDecoration: BoxDecoration(color: Appcolors.appbuttongreen),
                text: "Next",
                onpressed: () => Get.to(() => Setaprice()),
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
