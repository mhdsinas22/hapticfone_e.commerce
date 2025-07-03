import 'package:flutter/material.dart';
import 'package:hapticfone/features/store/screens/profile/profile.dart';
import 'package:hapticfone/web_screens/web_profile.dart';

class ResponsiveProfileScreen extends StatelessWidget {
  const ResponsiveProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return Profile();
        } else {
          return WebProfile();
        }
      },
    );
  }
}
