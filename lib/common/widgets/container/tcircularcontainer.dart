import 'package:flutter/material.dart';

class TCircularContainer extends StatelessWidget {
  final double width;
  final double height;
  final double padding;
  final double radius;
  final Widget? child;
  final EdgeInsets? margin;
  final Color backgroundcolor;
  const TCircularContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.padding = 400,
    this.radius = 400,
    this.margin,
    this.backgroundcolor = Colors.white,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(radius),
        color: backgroundcolor,
      ),
      child: child,
    );
  }
}
