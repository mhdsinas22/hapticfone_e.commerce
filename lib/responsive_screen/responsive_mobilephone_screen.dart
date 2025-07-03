import 'package:flutter/material.dart';
import 'package:hapticfone/features/store/screens/buy_screen/pages/mobilephone_screen.dart';
import 'package:hapticfone/web_screens/web_mobliephones_screen.dart';

class ResponsiveMobilephoneScreen extends StatelessWidget {
  const ResponsiveMobilephoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return MobilephoneScreen();
        } else {
          return WebMobilephoneScreen();
        }
      },
    );
  }
}
