import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/colors/appcolors.dart';
import 'package:hapticfone/screens/adderss_section/addresstextformfiled.dart';
import 'package:hapticfone/widgets/appbar_customized.dart';
import 'package:hapticfone/widgets/textbutton_customized.dart';

class AddadderssFormscreen extends StatelessWidget {
  const AddadderssFormscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarcustomized(
        title: "Add New Address",
        centertile: false,
        fontsize: 20.sp,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10.h),
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.r),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.gps_fixed_outlined),
                          SizedBox(width: 8.w),
                          Text(
                            "Use my current location",
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
              Divider(height: 1.h, color: Colors.black, thickness: 1),
              Addresstextformfiled(),
              Padding(
                padding: EdgeInsets.all(12.r),
                child: Row(
                  children: [
                    SizedBox(width: 10.w),
                    Text(
                      "Save As",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: 1,
                        onChanged: (value) {},
                        activeColor: Appcolors.mygreen,
                        hoverColor: Appcolors.mygreen,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: 1,
                        onChanged: (value) {},
                        activeColor: Appcolors.mygreen,
                        hoverColor: Appcolors.mygreen,
                      ),
                      Text(
                        "Office",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Radio(
                        value: 3,
                        groupValue: 1,
                        onChanged: (value) {},
                        activeColor: Appcolors.mygreen,
                        hoverColor: Appcolors.mygreen,
                      ),
                      Text(
                        "Other",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              TextbuttonCustomized(
                boxDecoration: BoxDecoration(color: Appcolors.mygreen),
                width: 300.w,
                heigth: 54.h,
                text: "Add Address",
                onpressed: () {},
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
