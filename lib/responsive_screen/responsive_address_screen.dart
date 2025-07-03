import 'package:flutter/material.dart';
import 'package:hapticfone/features/store/screens/adderss_section/addadderss_screen.dart';
import 'package:hapticfone/web_screens/web_address.dart';

class ResponsiveAddressScreen extends StatelessWidget {
  const ResponsiveAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return AddadderssScreen();
        } else {
          return WebadderssScreen();
        }
      },
    );
  }
}
