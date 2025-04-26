import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/effects/shimmer_effect.dart';

class Circleimage extends StatelessWidget {
  const Circleimage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlaycolar,
    this.backgroundcolor,
    this.fit = BoxFit.cover,
    this.padding = 8,
    this.isnetweokimage = false,
    required this.image,
  });
  final BoxFit fit;
  final String image;
  final bool isnetweokimage;
  final Color? overlaycolar;
  final Color? backgroundcolor;
  final double height, width, padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.r),
        child: Center(
          child:
              isnetweokimage
                  ? CachedNetworkImage(
                    imageUrl: image,
                    fit: fit,
                    color: overlaycolar,
                    progressIndicatorBuilder:
                        (context, url, downloadprogerss) => ShimmerEffect(
                          heigth: 55.h,
                          width: 55.w,
                          radius: 55.r,
                        ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )
                  : Image(image: AssetImage(image), color: overlaycolar),
        ),
      ),
    );
  }
}
