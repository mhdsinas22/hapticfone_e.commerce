import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/common/widgets/order_pickup_container.dart';
import 'package:hapticfone/features/store/controllers/order_controller.dart';
import 'package:hapticfone/responsive_screen/resonsive_order_status_screen.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/utils/constants/images_strings.dart';
import 'package:lottie/lottie.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    final ordercontroller = Get.put(Ordercontroller());
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar: Appbarcustomized(title: "Order"),
      body: Obx(() {
        if (ordercontroller.isloading.value) {
          return Center(child: Lottie.asset(AppAnimatons.simpleloading));
        }
        print("ORDER LENGTH:${ordercontroller.orders.length}");
        if (ordercontroller.orders.isEmpty) {
          return Center(child: Text("No orders yet"));
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 1);
                  },
                  itemCount: ordercontroller.orders.length,
                  itemBuilder: (context, index) {
                    var orders = ordercontroller.orders[index];
                    return Column(
                      children: [
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 1);
                          },
                          itemCount: orders.items.length,
                          itemBuilder: (context, index) {
                            var orderitems = orders.items[index];
                            return GestureDetector(
                              onTap:
                                  () => Get.to(
                                    () => ResonsiveOrderStatusScreen(
                                      confirmedTime: orders.confirmedTime,
                                      currentstatus: orders.currentstatus,
                                      image: orderitems.thumbnail,
                                      ordercreatedate:
                                          orders.orderconfirmeddate,
                                      orderid: orders.orderid,
                                      phonename:
                                          orderitems.mobilemodelname
                                              .toUpperCase(),
                                      price:
                                          orderitems.changingprice
                                              .toInt()
                                              .toString(),
                                      orderConfirmed: orders.orderConfirmed,
                                      orderStarted: orders.orderStrated,
                                      orderCompleted: orders.orderCompleted,
                                      id: orders.id,
                                      totalamount:
                                          orderitems.changingprice.toDouble(),
                                      cartmodels: orders.items,
                                    ),
                                  ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: OrderPickupContainer(
                                  // height: 250.h,
                                  brand: orderitems.brand,
                                  phoenimage: orderitems.thumbnail,
                                  orderid: orders.orderid,
                                  orderandpicktext: orders.currentstatus,
                                  dateandtimetext: orders.orderconfirmeddate,
                                  orderorsellamount: "Total",
                                  price:
                                      orderitems.changingprice
                                          .toInt()
                                          .toString(),
                                  phonename:
                                      orderitems.mobilemodelname.toUpperCase(),
                                  phoenstrogae: orderitems.storage,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        }
      }),
    );
  }
}
