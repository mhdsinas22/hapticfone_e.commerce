import 'package:flutter/cupertino.dart';
import 'package:hapticfone/common/widgets/styles/colors/appcolors.dart';

class PhonedetilsText extends StatelessWidget {
  const PhonedetilsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "iphone 13 pro",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          "Pre owned phone",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          "Quantity:1",
          style: TextStyle(
            color: Appcolors.appgrey,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "₹44999",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
