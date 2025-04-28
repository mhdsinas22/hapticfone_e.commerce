import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/widgets/appbar_customized.dart';

class OrderStatus extends StatelessWidget {
  const OrderStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarcustomized(title: "Order Details"),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10.r),
            child: Text(
              "Device Details",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
