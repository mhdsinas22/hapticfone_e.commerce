import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/styles/colors/appcolors.dart';
import 'package:hapticfone/screens/buy/cart/cartcontroller.dart';

class CartWidgtes extends StatelessWidget {
  const CartWidgtes({
    super.key,
    required this.mobilename,
    required this.condtion,
    required this.price,
    required this.thumbnaik,
    required this.productid,
    required this.index,
    required this.count,
    required this.changeprice,
  });
  final String mobilename;
  final String condtion;
  final String price;
  final String thumbnaik;
  final String productid;
  final int index;
  final int count;
  final double changeprice;

  @override
  Widget build(BuildContext context) {
    final cartcontroller = Get.put(CartController());
    return Center(
      child: Padding(
        padding: EdgeInsets.all(8.r),
        child: Material(
          elevation: 5,
          child: Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            width: 368.w,
            height: 145.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CachedNetworkImage(
                    imageUrl: thumbnaik,
                    placeholder:
                        (context, url) => CircularProgressIndicator(
                          color: Appcolors.appbuttongreen,
                        ),
                    errorWidget:
                        (context, url, error) =>
                            Icon(Icons.error, color: Colors.red),
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        mobilename,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        condtion,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                      Text(
                        "₹$changeprice",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () => cartcontroller.decemrnt(index),
                      child: Text(
                        "-",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Text(
                      count.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(width: 3.w),
                    InkWell(
                      onTap: () {
                        cartcontroller.increment(index);
                      },

                      child: Text(
                        "+",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () => cartcontroller.deletethecart(productid),
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
