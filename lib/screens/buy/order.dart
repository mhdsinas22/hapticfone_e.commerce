import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/widgets/appbar_customized.dart';
import 'package:hapticfone/widgets/order_pickup_container.dart';

class Order extends StatelessWidget {
  const Order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarcustomized(title: "Order"),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.r),
              child: OrderPickupContainer(
                orderid: "MPMTB15092838",
                orderandpicktext: "Order Requested",
                dateandtimetext: "Tue 8th apr",
                orderorsellamount: "Order Amount",
                price: "₹44999",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
