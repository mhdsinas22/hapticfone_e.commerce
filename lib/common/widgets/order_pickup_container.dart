import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/common/widgets/cached_Network_image_Custom.dart';
import 'package:hapticfone/common/widgets/container/rectangle_container.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';

class OrderPickupContainer extends StatelessWidget {
  final BoxDecoration? boxdecoration;
  final double width;
  final double height;
  final Color backgroundcolor;
  final String orderandpicktext;
  final String dateandtimetext;
  final String phoenimage;
  final String orderid;
  final String orderorsellamount;
  final String price;
  final String phonename;
  final String phoenstrogae;
  final String brand;
  final bool isweb;
  const OrderPickupContainer({
    super.key,
    this.boxdecoration,
    this.width = 510,
    this.height = 220,
    this.backgroundcolor = Colors.white,
    this.orderandpicktext = "Ordertext",
    this.dateandtimetext = "dateandtime",
    this.phoenimage = "assets/17.png",
    this.orderid = "orderid",
    this.orderorsellamount = "order or sell amount",
    this.price = "price",
    this.phonename = "",
    this.phoenstrogae = "",
    this.brand = "",
    this.isweb = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Appcolors.white,
          elevation: 5,
          child: SizedBox(
            width: isweb ? width.w : null,
            height: height.h,
            child: Column(
              children: [
                SizedBox(height: 8.h),
                Row(
                  children: [
                    SizedBox(width: isweb ? null : 20.w),
                    Container(
                      width: 25.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color:
                            orderandpicktext == "Order Cancelled"
                                ? Appcolors.error
                                : Appcolors.appbuttongreen,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        orderandpicktext == "Order Cancelled"
                            ? Icons.close
                            : Icons.done_outlined,
                        size: isweb ? 8.sp : 25.sp,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      orderandpicktext,
                      style: TextStyle(
                        fontSize: isweb ? 5.sp : 14.sp,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: isweb ? 27.w : 40.w),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        dateandtimetext,
                        style: TextStyle(
                          fontSize: isweb ? 5.sp : 12.sp,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(color: Appcolors.black, thickness: 0.75),
                Row(
                  children: [
                    RectangleContainer(
                      boxDecoration: BoxDecoration(
                        // color: Appcolors.appbuttongreen,
                      ),
                      width: isweb ? 30 : 70,
                      heigth: 70,
                      child: Center(
                        child: CachedNetworkImageCustom(
                          imageurl: phoenimage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    // VerticalDivider(thickness: 1,),
                    RectangleContainer(
                      boxDecoration: BoxDecoration(
                        // color: Appcolors.appbuttongreen,
                      ),
                      width: isweb ? 80 : 150,
                      heigth: isweb ? 120 : 100,
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // key line for alignment
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Order ID: $orderid",
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: isweb ? 5.sp : 10.sp,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            phonename.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: isweb ? 5.sp : 13.sp,
                            ),
                          ),
                          Text(
                            phoenstrogae.toUpperCase(),
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: isweb ? 5.sp : 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                Divider(color: Appcolors.black, thickness: 0.75),
                SizedBox(height: 1.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: isweb ? 8.w : 20.w),
                    Text(
                      orderorsellamount,
                      style: TextStyle(
                        fontSize: isweb ? 5.sp : 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "₹$price",
                      style: TextStyle(
                        fontSize: isweb ? 5.sp : 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 20.w),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
