import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/texts/address_text.dart';
import 'package:hapticfone/features/authentication/controllers/authentication_repository.dart';
import 'package:hapticfone/features/store/controllers/cart_controller.dart';
import 'package:hapticfone/features/store/controllers/order_controller.dart';
import 'package:hapticfone/features/store/controllers/radio_controller.dart';
import 'package:hapticfone/features/store/controllers/payment_controller.dart';
import 'package:hapticfone/features/store/screens/adderss_section/address_controller.dart';
import 'package:hapticfone/utils/constants/alertbox.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/common/widgets/cashtotal_continer.dart';
import 'package:hapticfone/common/widgets/container/rectangle_container.dart';
import 'package:hapticfone/common/widgets/redio_widget.dart';
import 'package:hapticfone/common/widgets/texts/phonedetils_text.dart';
import 'package:hapticfone/utils/constants/buttons.dart';
import 'package:hapticfone/utils/constants/images_strings.dart';
import 'package:lottie/lottie.dart';

class WebCheckout extends StatelessWidget {
  const WebCheckout({super.key});

  @override
  Widget build(BuildContext context) {
    final radioController = Get.put(Radiocontroller());
    final cartcontroller = Get.put(CartController());
    final paymetncontroller = Get.put(
      PaymentController(amout: cartcontroller.total),
    );
    final authenticationrepositry = Get.put(Authenticationrepository());
    final ordercontrolller = Get.put(Ordercontroller());
    final username = authenticationrepositry.auth.currentUser!.email;
    final addresscontroller = Get.put(Addresscontroller());
    RxString selectedvalue = radioController.selectedvalue;
    return Obx(() {
      SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarIconBrightness: Brightness.dark,
        ),
      );

      return Scaffold(
        backgroundColor: Appcolors.white,
        bottomNavigationBar: Obx(() {
          if (ordercontrolller.isloading.value ||
              ordercontrolller.isOrderPlaced.value) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Lottie.asset(AppAnimatons.simpleloading)),
              ],
            );
          }
          return selectedvalue.trim().isEmpty
              ? Padding(
                padding: EdgeInsets.all(10.r),
                child: Buttons.inactivebutton("Place Order", true),
              )
              : Padding(
                padding: EdgeInsets.all(10.r),
                child: InkWell(
                  onTap: () async {
                    if (addresscontroller.addresslist.isEmpty) {
                      CustomAlertbox.noaddressAlertbox(context, true);
                    } else if (selectedvalue.value == "Online Payment") {
                      print("Selected: ${selectedvalue.value}");
                      print("Amount: ${cartcontroller.total}");
                      paymetncontroller.opencheckout(
                        cartcontroller.total.toInt() * 100,
                        username,
                      );
                    } else {
                      ordercontrolller.isloading.value = true;
                      await Future.delayed(Duration(seconds: 6));
                      await ordercontrolller.createorder(
                        cartcontroller.total.value,
                      );
                      ordercontrolller.isloading.value = false;
                    }
                  },
                  child: Buttons.activeButton("Place Order", () async {
                    if (addresscontroller.addresslist.isEmpty) {
                      CustomAlertbox.noaddressAlertbox(context, true);
                    } else if (selectedvalue.value == "Online Payment") {
                      print("Selected: ${selectedvalue.value}");
                      print("Amount: ${cartcontroller.total}");
                      paymetncontroller.opencheckout(
                        cartcontroller.total.toInt() * 100,
                        username,
                      );
                    } else {
                      ordercontrolller.isloading.value = true;
                      await Future.delayed(Duration(seconds: 6));
                      await ordercontrolller.createorder(
                        cartcontroller.total.value,
                      );
                      ordercontrolller.isloading.value = false;
                    }
                  }, true),
                ),
              );
        }),
        appBar:
            ordercontrolller.isloading.value
                ? AppBar(
                  title: Text(""),
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                )
                : Appbarcustomized(
                  title: "Checkout",
                  centertile: false,
                  fontsize: 20,
                  fontweight: FontWeight.w800,
                ),
        body: SafeArea(
          child: SingleChildScrollView(
            controller: ordercontrolller.scrollController,
            scrollDirection: Axis.vertical,
            child: Obx(() {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(width: 4.w),
                        Text(
                          "Order Summary",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cartcontroller.cartitems.length,
                    itemBuilder: (context, index) {
                      var items = cartcontroller.cartitems[index];
                      return Padding(
                        padding: EdgeInsets.all(8.r),
                        child: RectangleContainer(
                          boxDecoration: BoxDecoration(
                            border: Border.all(color: Appcolors.mygreen),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Row(children: [SizedBox(width: 25)]),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RectangleContainer(
                                    boxDecoration: BoxDecoration(
                                      // color: Appcolors.appbuttongreen,
                                    ),
                                    width: 100,
                                    heigth: 150,
                                    child: CachedNetworkImage(
                                      fit: BoxFit.contain,
                                      imageUrl: items.thumbnail,

                                      placeholder:
                                          (context, url) =>
                                              CircularProgressIndicator(
                                                color: Appcolors.appbuttongreen,
                                              ),
                                      errorWidget:
                                          (context, url, error) =>
                                              Icon(Icons.error),
                                    ),
                                  ),

                                  Column(
                                    children: [
                                      PhonedetilsText(
                                        phonename:
                                            items.mobilemodelname.toUpperCase(),
                                        condtion: items.condtion,
                                        count: items.count.toString(),
                                        price: items.changingprice.toString(),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.all(8.r),
                    child: Addresstext(width: 80, isweb: true, height: 200),
                  ),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.all(10.r),
                    child: RectangleContainer(
                      heigth: 200,
                      boxDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: Appcolors.mygreen),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20.r),
                                child: Text(
                                  "Select Payment Method",
                                  style: TextStyle(
                                    fontSize: 5.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Obx(
                            () => RadioWidget(
                              fontsize: 4,
                              value: "Online Payment",
                              selectvalue: radioController.selectedvalue.value,
                              title: "Online Payment",
                            ),
                          ),
                          Obx(
                            () => RadioWidget(
                              fontsize: 4,
                              value: "Cash On Delivery",
                              selectvalue: radioController.selectedvalue.value,
                              title: "Cash On Delivery",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CashtotalContainer(isweb: true),
                ],
              );
            }),
          ),
        ),
      );
    });
  }
}
