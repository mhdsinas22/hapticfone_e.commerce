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
import 'package:hapticfone/utils/constants/sizes.dart';
import 'package:lottie/lottie.dart';

class Cart extends StatelessWidget {
  final cartcontroller = Get.put(CartController());
  Cart({super.key});
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      cartcontroller.fetchcartitems();
      cartcontroller.calculateTotal();
    });

    return Scaffold(
      appBar: Appbarcustomized(title: "Cart"),
      body: Obx(() {
        if (cartcontroller.isLoading.value) {
          return Center(child: Lottie.asset(AppAnimatons.simpleloading));
        }
        return Column(
          children: [
            cartcontroller.cartitems.isEmpty
                ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 120.h),
                      Lottie.asset(
                        AppAnimatons.noCartitemsanimation,
                        width: 300.w,
                      ),
                      SizedBox(height: 20.h),
                      Boldtext(
                        text: "NO ADDED TO CART",
                        size: 25,
                        colors: Appcolors.appgrey,
                      ),
                    ],
                  ),
                )
                : Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(Sizes.defaultSpace),
                    child: ListView.separated(
                      separatorBuilder:
                          (context, index) =>
                              const SizedBox(height: Sizes.spaceBtwSections),
                      shrinkWrap: true,
                      itemCount: cartcontroller.cartitems.length,
                      itemBuilder: (context, index) {
                        final item = cartcontroller.cartitems[index];
                        return Column(
                          children: [
                            CartWidgtes(
                              id: item.id,
                              count: item.count.toInt(),
                              thumbnaik: item.thumbnail,
                              mobilename: item.mobilemodelname,
                              condtion: item.condtion,
                              price: item.price.toString(),
                              productid: item.id,
                              index: index,
                              changeprice: item.changingprice.toDouble(),
                            ),
                          ],
                        );
                      },
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
                        color: Appcolors.white,
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
                              Boldtext(
                                text: "TOTAL",
                                size: 11,
                                colors: Appcolors.greycolor,
                              ),
                              Obx(
                                () => Boldtext(
                                  text:
                                      "₹${cartcontroller.total.value.toString()}",
                                  size: 18,
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
                                  Get.to(ResponsiveCheckoutScreen());
                                },
                                child: Obx(
                                  () => Boldtext(
                                    text:
                                        "CheckOut(${cartcontroller.cartitems.length} items)",
                                    colors: Appcolors.white,
                                    size: 12,
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
        );
      }),
    );
  }
}
