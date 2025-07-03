import 'package:flutter/material.dart';
import 'package:hapticfone/features/store/screens/buy_screen/cart.dart';
import 'package:hapticfone/web_screens/web_cart.dart';

class ResponsiveCartScreen extends StatelessWidget {
  const ResponsiveCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return Cart();
        } else {
          return WebCart();
        }
      },
    );
  }
}
