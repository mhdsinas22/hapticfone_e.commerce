import 'package:flutter/material.dart';

class Tproductpricetext extends StatelessWidget {
  const Tproductpricetext({
    super.key,
    required this.price,
    this.currentsign = "₹",
    this.maxlines = 1,
    this.islargee = false,
    this.linethrough = false,
  });
  final String currentsign, price;
  final int maxlines;
  final bool islargee;
  final bool linethrough;
  @override
  Widget build(BuildContext context) {
    return Text(
      currentsign + price,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      style:
          islargee
              ? TextTheme.of(context).headlineMedium?.apply(
                decoration: linethrough ? TextDecoration.lineThrough : null,
              )
              : Theme.of(context).textTheme.titleLarge!.apply(
                decoration: linethrough ? TextDecoration.lineThrough : null,
              ),
    );
  }
}
