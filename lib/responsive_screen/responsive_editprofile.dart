import 'package:flutter/material.dart';
import 'package:hapticfone/features/store/screens/profile/edit_profile.dart';
import 'package:hapticfone/web_screens/web_editprofile.dart';

class ResponsiveEditprofile extends StatelessWidget {
  const ResponsiveEditprofile({
    super.key,
    required this.imageurl,
    this.isweb = false,
  });
  final String imageurl;
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return Editprofile(imageurl: imageurl);
        } else {
          return WebEditprofile(imageurl: imageurl);
        }
      },
    );
  }
}
