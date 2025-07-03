import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';

class OrderprocesWidget extends StatelessWidget {
  const OrderprocesWidget({
    this.ordercomments = "Order Requested",
    super.key,
    this.circularavatarradius = 15,
    this.circleavatarbackgroundcolor = Appcolors.appbuttongreen,
    this.child,
    this.lineheight = 150,
    this.dateandday = "    Tue 8th apr",
    this.time = "7:50 PM",
    this.isneedline = true,
    this.needicon = false,
    this.linecolor,
    this.isweb = false,
  });
  final double circularavatarradius;
  final Color circleavatarbackgroundcolor;
  final Widget? child;
  final double lineheight;
  final String dateandday;
  final String time;
  final String ordercomments;
  final bool isneedline;
  final bool needicon;
  final Color? linecolor;
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 10.w),
            CircleAvatar(
              backgroundColor: circleavatarbackgroundcolor,
              radius: circularavatarradius.r,
              child:
                  needicon == false
                      ? child
                      : Icon(
                        Icons.check,
                        color: Colors.white,
                        size: isweb ? 5.sp : 25.sp,
                      ),
            ),
            SizedBox(width: 10.w),
            Text(
              ordercomments,
              style: TextStyle(
                fontSize: isweb ? 4.sp : 16.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        Padding(
          padding: EdgeInsets.all(10.r),
          child: Row(
            children: [
              SizedBox(width: isweb ? 10.w : 12.w),
              if (isneedline == true)
                Container(
                  height: lineheight,
                  width: isweb ? 1.w : 4.w,
                  color: linecolor ?? Appcolors.greycolor,
                ),
              SizedBox(width: isweb ? 15.w : 15.w),
              Text(
                dateandday,
                style: TextStyle(
                  fontSize: isweb ? 4.sp : 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(width: 25.w),
              Text(
                time,
                style: TextStyle(
                  fontSize: isweb ? 4.sp : 14.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
