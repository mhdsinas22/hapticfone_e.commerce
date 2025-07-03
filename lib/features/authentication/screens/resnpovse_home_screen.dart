import 'package:flutter/material.dart';
import 'package:hapticfone/features/store/screens/buy_screen/home.dart';
import 'package:hapticfone/web_screens/web_home.dart';

class ResnpovseHomeScreen extends StatelessWidget {
  const ResnpovseHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return Homescreen();
          } else {
            return WebHomescreen(isweb: true);
          }
        },
      ),
    );
  }
}
