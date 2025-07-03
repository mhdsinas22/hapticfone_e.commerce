import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/common/widgets/order_pickup_container.dart';
import 'package:hapticfone/features/store/screens/sell_screen/sell/pickup_status.dart';

class PickupScreen extends StatelessWidget {
  const PickupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarcustomized(title: "PickUp"),
      body: Column(
        children: [
          InkWell(
            onTap: () => Get.to(() => Pickupstatus()),
            child: OrderPickupContainer(
              orderandpicktext: "Pickup Requsted",
              dateandtimetext: "Tue 29th Apr",
              orderorsellamount: "Sell Amount",
              price: "₹29999",
            ),
          ),
        ],
      ),
    );
  }
}
