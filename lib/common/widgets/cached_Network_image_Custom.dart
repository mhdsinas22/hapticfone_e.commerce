import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';

class CachedNetworkImageCustom extends StatelessWidget {
  const CachedNetworkImageCustom({
    super.key,
    required this.imageurl,
    this.width = 100,
    this.heigth = 100,
    this.fit,
  });
  final String imageurl;
  final double width;
  final double heigth;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width.w,
      height: heigth.w,
      imageUrl: imageurl,
      fit: fit,
      placeholder:
          (context, url) =>
              CircularProgressIndicator(color: Appcolors.appbuttongreen),
      errorWidget:
          (context, url, error) => Icon(Icons.error, color: Colors.red),
    );
  }
}
