import 'package:flutter/material.dart';

class Tproducttitletext extends StatelessWidget {
  const Tproducttitletext({
    super.key,
    required this.text,
    this.smalsize = false,
    this.maxlines = 2,
    this.textAlign = TextAlign.left,
  });
  final String text;
  final bool smalsize;
  final int maxlines;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxlines,
      style:
          smalsize
              ? Theme.of(context).textTheme.labelLarge
              : Theme.of(context).textTheme.titleSmall,
    );
  }
}
