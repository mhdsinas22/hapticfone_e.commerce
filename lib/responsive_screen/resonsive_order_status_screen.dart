import 'package:flutter/material.dart';
import 'package:hapticfone/features/store/models/cartmodels.dart';
import 'package:hapticfone/features/store/screens/buy_screen/pages/order_status.dart';
import 'package:hapticfone/web_screens/web_order_status.dart';

class ResonsiveOrderStatusScreen extends StatelessWidget {
  const ResonsiveOrderStatusScreen({
    super.key,
    required this.currentstatus,
    required this.image,
    required this.ordercreatedate,
    required this.orderid,
    required this.phonename,
    required this.price,
    required this.confirmedTime,
    required this.orderConfirmed,
    required this.orderStarted,
    required this.orderCompleted,
    required this.id,
    required this.totalamount,
    required this.cartmodels,
  });

  final String currentstatus;
  final String image;
  final String ordercreatedate;
  final String orderid;
  final String phonename;
  final String price;
  final String confirmedTime;
  final String orderConfirmed;
  final String orderStarted;
  final String orderCompleted;
  final String id;
  final double totalamount;
  final List<Cartmodels> cartmodels;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return OrderStatus(
            currentstatus: currentstatus,
            image: image,
            ordercreatedate: ordercreatedate,
            orderid: orderid,
            phonename: phonename,
            price: price,
            confirmedTime: confirmedTime,
            orderConfirmed: orderConfirmed,
            orderStarted: orderStarted,
            orderCompleted: orderCompleted,
            id: id,
            totalamount: totalamount,
            cartmodels: cartmodels,
          );
        } else {
          return WebOrderStatus(
            currentstatus: currentstatus,
            image: image,
            ordercreatedate: ordercreatedate,
            orderid: orderid,
            phonename: phonename,
            price: price,
            confirmedTime: confirmedTime,
            orderConfirmed: orderConfirmed,
            orderStarted: orderStarted,
            orderCompleted: orderCompleted,
            id: id,
            totalamount: totalamount,
            cartmodels: cartmodels,
          );
        }
      },
    );
  }
}
