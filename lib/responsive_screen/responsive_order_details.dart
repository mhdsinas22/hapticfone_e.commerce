import 'package:flutter/material.dart';
import 'package:hapticfone/features/store/screens/buy_screen/pages/order_details.dart';
import 'package:hapticfone/web_screens/web_orderdetails.dart';

class ResponsiveOrderDetails extends StatelessWidget {
  const ResponsiveOrderDetails({super.key, required this.orderid});
  final String orderid;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return OrderDetails(orderid: orderid);
        } else {
          return WebOrderDetails(orderid: orderid);
        }
      },
    );
  }
}
