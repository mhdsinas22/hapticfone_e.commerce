import 'package:flutter/material.dart';

class Addresstext extends StatelessWidget {
  const Addresstext({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Sinas"),
        Text("yesbpude,cor,Near pub,bangalore,Karnataka,560001", maxLines: 2),
        Text("ph:1234567890"),
      ],
    );
  }
}
