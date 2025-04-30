import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/colors/appcolors.dart';
import 'package:hapticfone/texts/address_text.dart';

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
  });
  final double circularavatarradius;
  final Color circleavatarbackgroundcolor;
  final Widget? child;
  final double lineheight;
  final String dateandday;
  final String time;
  final String ordercomments;
  final bool isneedline;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.r),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: circleavatarbackgroundcolor,
                radius: circularavatarradius.r,
                child: child,
              ),
              SizedBox(width: 10.w),
              Text(
                ordercomments,
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.r),
            child: Row(
              children: [
                SizedBox(width: 3.w),
                if (isneedline == true)
                  Container(
                    height: lineheight,
                    width: 4.w,
                    color: Colors.grey[400],
                  ),
                SizedBox(width: 15.w),
                Text(
                  dateandday,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(width: 25.w),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
