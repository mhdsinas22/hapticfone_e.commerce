import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/common/widgets/container/rectangle_container.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';

class TroundedImage extends StatelessWidget {
  const TroundedImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width = 150,
    this.height = 158,
    this.applyImageradius = false,
    required this.imageurl,
    this.fit = BoxFit.contain,
    this.backgroundcolor = Appcolors.chipfontcolor,
    this.isnetworkimage = false,
    required this.borderradius,
  });

  final double? width, height;
  final String imageurl;
  final bool applyImageradius;
  final BoxBorder? border;
  final Color backgroundcolor;
  final BoxFit fit;
  final EdgeInsetsGeometry? padding;
  final bool isnetworkimage;
  final VoidCallback? onPressed;
  final double borderradius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: backgroundcolor,
          borderRadius: BorderRadius.circular(borderradius),
        ),
        child: ClipRRect(
          borderRadius:
              applyImageradius
                  ? BorderRadius.circular(borderradius)
                  : BorderRadius.zero,
          child: RectangleContainer(
            width: 100,
            child: CachedNetworkImage(
              width: 20.w,
              height: 20.w,
              imageUrl: imageurl,
              placeholder:
                  (context, url) => CircularProgressIndicator(
                    color: Appcolors.appbuttongreen,
                  ),
              errorWidget:
                  (context, url, error) => Icon(Icons.error, color: Colors.red),
            ),
          ),
        ),
      ),
    );
  }
}
