import 'package:flutter/material.dart';
import 'package:hapticfone/widgets/appbar_customized.dart';
import 'package:hapticfone/widgets/phone_card.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarcustomized(title: "Favorites"),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [PhoneCard()]),
      ),
    );
  }
}
