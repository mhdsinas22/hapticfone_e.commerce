import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:hapticfone/common/widgets/styles/colors/appcolors.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/screens/buy/cart/cart_widgtes.dart';
import 'package:hapticfone/screens/buy/cart/cartcontroller.dart';
import 'package:hapticfone/screens/buy/checkout/checkout.dart';
import 'package:lottie/lottie.dart';

class Cart extends StatelessWidget {
  final cartcontroller = Get.put(CartController());
  Cart({super.key}) {
    cartcontroller.fetchcartitems();
  }
  @override
  Widget build(BuildContext context) {
    cartcontroller.calculateTotal();
    return Scaffold(
      appBar: Appbarcustomized(title: "Cart"),
      body: Obx(
        () => Column(
          children: [
            Obx(
              () =>
                  cartcontroller.cartitems.isEmpty
                      ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 120.h),
                            Lottie.asset(
                              "asset/animations/Animation - 1745332367456.json",
                              width: 300.w,
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              "NO ADDED TO CART",
                              style: TextStyle(
                                fontSize: 25,
                                color: Appcolors.appgrey,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      )
                      : Obx(
                        () => Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: cartcontroller.cartitems.length,
                            itemBuilder: (context, index) {
                              final item = cartcontroller.cartitems[index];
                              return Stack(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CartWidgtes(
                                        count: item.count.toInt(),
                                        thumbnaik: item.thumbnail,
                                        mobilename: item.mobilemodelname,
                                        condtion: item.condtion,
                                        price: item.price.toString(),
                                        productid: item.id,
                                        index: index,
                                        changeprice:
                                            item.changingprice.toDouble(),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
            ),
            cartcontroller.cartitems.isNotEmpty
                ? Padding(
                  padding: EdgeInsets.all(12.r),
                  child: Material(
                    borderRadius: BorderRadius.circular(12.r),
                    elevation: 10,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      width: 370.w,
                      height: 93.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SizedBox(height: 30.h),
                              Text(
                                "TOTAL",
                                style: TextStyle(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w800,
                                  color: Colors.grey,
                                ),
                              ),
                              Obx(
                                () => Text(
                                  "₹${cartcontroller.total.value.toString()}",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 60.w),
                          Container(
                            decoration: BoxDecoration(
                              color: Appcolors.mygreen,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            width: 140.w,
                            height: 38.h,
                            child: Center(
                              child: TextButton(
                                onPressed: () {
                                  Get.to(Checkout());
                                },
                                child: Obx(
                                  () => Text(
                                    "CheckOut(${cartcontroller.cartitems.length} items)",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                : Text(""),
          ],
        ),
      ),
    );
  }
}
