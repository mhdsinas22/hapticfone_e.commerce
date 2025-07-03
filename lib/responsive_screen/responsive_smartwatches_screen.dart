import 'package:flutter/material.dart';
import 'package:hapticfone/features/store/screens/buy_screen/pages/smartwatches_screen.dart';
import 'package:hapticfone/web_screens/web_smartwatches_screen.dart';

class ResponsiveSmartwatchesScreen extends StatelessWidget {
  const ResponsiveSmartwatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return SmartwatchesScrrem();
        } else {
          return WebSmartwatchesScreen();
        }
      },
    );
  }
}
