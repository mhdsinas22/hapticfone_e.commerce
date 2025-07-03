import 'package:flutter/material.dart';
import 'package:hapticfone/features/store/screens/profile/my_profile.dart';
import 'package:hapticfone/web_screens/web_myprofile.dart';

class ResponsiveMyprofileScreen extends StatelessWidget {
  const ResponsiveMyprofileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return Myprofile();
        } else {
          return WebMyprofile(isweb: true);
        }
      },
    );
  }
}
