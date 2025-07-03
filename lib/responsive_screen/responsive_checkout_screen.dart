import 'package:flutter/material.dart';
import 'package:hapticfone/features/store/screens/buy_screen/checkout.dart';
import 'package:hapticfone/web_screens/web_checkout.dart';

class ResponsiveCheckoutScreen extends StatelessWidget {
  const ResponsiveCheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return Checkout();
        } else {
          return WebCheckout();
        }
      },
    );
  }
}
