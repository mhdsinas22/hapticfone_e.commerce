import 'package:flutter/material.dart';
import 'package:hapticfone/features/store/screens/adderss_section/addadderss_formscreen.dart';
import 'package:hapticfone/web_screens/web_addadderss_form_screen.dart';

class ResponsiceAddaddressFormScreen extends StatelessWidget {
  const ResponsiceAddaddressFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return AddadderssFormscreen();
        } else {
          return WebAddadderssFormscreen();
        }
      },
    );
  }
}
