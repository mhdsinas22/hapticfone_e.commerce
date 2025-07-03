import 'package:flutter/material.dart';
import 'package:hapticfone/features/authentication/screens/signup_screen.dart';
import 'package:hapticfone/web_screens/web_signup_screen.dart';

class ResopnsiveSignupScreen extends StatelessWidget {
  const ResopnsiveSignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return Signupscreen();
        } else {
          return WebSignupscreen();
        }
      },
    );
  }
}
