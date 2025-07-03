import 'package:flutter/material.dart';
import 'package:hapticfone/features/authentication/screens/login_screen.dart';
import 'package:hapticfone/web_screens/web_login_screen.dart';

class ResopiveScreen extends StatelessWidget {
  const ResopiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth <= 600) {
              return LoginScreen();
            } else {
              return WebLoginScreen();
            }
          },
        ),
      ),
    );
  }
}
