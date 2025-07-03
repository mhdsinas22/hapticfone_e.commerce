import 'package:flutter/cupertino.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';

class PhonedetilsText extends StatelessWidget {
  const PhonedetilsText({
    super.key,
    required this.condtion,
    required this.count,
    required this.phonename,
    required this.price,
  });
  final String phonename;
  final String condtion;
  final String count;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          phonename,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          condtion,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          "Quantity:$count",
          style: TextStyle(
            color: Appcolors.appgrey,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "₹$price",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
