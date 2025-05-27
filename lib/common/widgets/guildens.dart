import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/common/widgets/styles/colors/appcolors.dart';

class Guildens extends StatelessWidget {
  const Guildens({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Text(
                "Gudliness For Sell condtions",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16.sp),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(backgroundColor: Colors.black, maxRadius: 6),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Text(
                        "The price you mentioned is fine if everything matches.",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6.r),
                child: Row(
                  children: [
                    CircleAvatar(backgroundColor: Colors.black, maxRadius: 6),
                    SizedBox(width: 6.w),
                    Expanded(
                      child: Text(
                        "However,we will first verify that the title and detalis are accurate",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(6.r),
                child: Row(
                  children: [
                    CircleAvatar(backgroundColor: Colors.black, maxRadius: 6),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Text(
                        "Once you share your location,we will visit your place to do a full inspection before confirming the deal",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 13.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(backgroundColor: Colors.black, maxRadius: 6),
                    SizedBox(width: 5.w),
                    Text(
                      "if there are any issues or complaints during the check",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(backgroundColor: Colors.black, maxRadius: 6),
                    SizedBox(width: 5.w),
                    Text(
                      "the final price may be adjusted accordingly",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(backgroundColor: Colors.black, maxRadius: 6),
                    SizedBox(width: 5.w),
                    Text(
                      "Our goal is to ensure a clean and honset deal.",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 13.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Radio(
              activeColor: Appcolors.appbuttongreen,
              value: 1,
              groupValue: 1,
              onChanged: (valye) {},
              // title: Text(
              //   "Agree",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              // ),
            ),
            Text(
              "Agree",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
            SizedBox(width: 10.w),
            Radio(
              activeColor: Appcolors.appbuttongreen,
              value: 2,
              groupValue: 1,
              onChanged: (valye) {},
              // title: Text(
              //   "Agree",
              //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
              // ),
            ),
            Text(
              "No Thanks",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
            ),
          ],
        ),
      ],
    );
  }
}
