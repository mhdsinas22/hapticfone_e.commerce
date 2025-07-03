import 'package:flutter/material.dart';
import 'package:hapticfone/features/store/screens/buy_screen/order.dart';
import 'package:hapticfone/web_screens/web_order.dart';

class ResponsiveOrderScreen extends StatelessWidget {
  const ResponsiveOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return Order();
        } else {
          return WebOrder();
        }
      },
    );
  }
}
