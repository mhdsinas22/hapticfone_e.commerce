import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/styles/texts/bold_text.dart';
import 'package:hapticfone/responsive_screen/responsive_checkout_screen.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/common/widgets/cart_widgtes.dart';
import 'package:hapticfone/features/store/controllers/cart_controller.dart';
import 'package:hapticfone/utils/constants/images_strings.dart';
import 'package:lottie/lottie.dart';

class WebCart extends StatelessWidget {
  final cartcontroller = Get.put(CartController());
  WebCart({super.key}) {
    cartcontroller.fetchcartitems();
  }
  @override
  Widget build(BuildContext context) {
    cartcontroller.calculateTotal();
    return Scaffold(
      appBar: Appbarcustomized(title: "Cart"),
      body: Obx(() {
        if (cartcontroller.isLoading.value) {
          return Center(child: Lottie.asset(AppAnimatons.simpleloading));
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              cartcontroller.cartitems.isEmpty
                  ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 120.h),
                        Lottie.asset(
                          AppAnimatons.noCartitemsanimation,
                          width: 130.w,
                        ),
                        SizedBox(height: 20.h),
                        Boldtext(
                          text: "NO ADDED TO CART",
                          size: 10,
                          colors: Appcolors.appgrey,
                        ),
                      ],
                    ),
                  )
                  : Padding(
                    padding: EdgeInsets.all(8.r),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: cartcontroller.cartitems.length,
                      itemBuilder: (context, index) {
                        final item = cartcontroller.cartitems[index];
                        return CartWidgtes(
                          isweb: true,
                          count: item.count.toInt(),
                          thumbnaik: item.thumbnail,
                          mobilename: item.mobilemodelname,
                          condtion: item.condtion,
                          price: item.price.toString(),
                          productid: item.id,
                          index: index,
                          changeprice: item.changingprice.toDouble(),
                          id: item.id,
                        );
                      },
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
                          color: Appcolors.white,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        width: 200.w,
                        height: 93.h,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 30.h),
                                Boldtext(
                                  text: "TOTAL",
                                  size: 5,
                                  colors: Appcolors.greycolor,
                                ),
                                Obx(
                                  () => Boldtext(
                                    text:
                                        "₹${cartcontroller.total.value.toString()}",
                                    size: 5,
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
                              width: 50.w,
                              height: 38.h,
                              child: Center(
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(ResponsiveCheckoutScreen());
                                  },
                                  child: Obx(
                                    () => Boldtext(
                                      text:
                                          "CheckOut(${cartcontroller.cartitems.length} items)",
                                      colors: Appcolors.white,
                                      size: 3,
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
        );
      }),
    );
  }
}
