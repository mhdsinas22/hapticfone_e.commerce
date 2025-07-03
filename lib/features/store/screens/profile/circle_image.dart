import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/styles/effects/shimmer_effect.dart';
import 'package:hapticfone/features/authentication/controllers/image_controller.dart';

class Circleimage extends StatelessWidget {
  const Circleimage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlaycolar,
    this.backgroundcolor,
    this.fit = BoxFit.cover,
    this.padding = 8,
    required this.image,
    this.imageurl = "",
    this.ishaveimage = false,
    this.isweb = false,
  });
  final BoxFit fit;
  final dynamic image;
  final Color? overlaycolar;
  final Color? backgroundcolor;
  final double height, width, padding;
  final bool ishaveimage;
  final String imageurl;
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    final imagecontroller = Get.put(Imagecontroller());
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(100),
      ),
      child:
          ishaveimage
              ? ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: Center(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: image,
                    width: 120,
                    height: 120,
                    color: overlaycolar,
                    progressIndicatorBuilder:
                        (context, url, downloadprogerss) => ShimmerEffect(
                          heigth: 55.h,
                          width: 55.w,
                          radius: 55.r,
                        ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              )
              : Obx(() {
                print("isWeb: $isweb");
                print("imagePaths: ${imagecontroller.imagePaths}");
                print(
                  "fileBytes null ano: ${imagecontroller.filebytes.value == null}",
                );

                return CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      imagecontroller.imagePaths.isNotEmpty
                          ? kIsWeb
                              ? MemoryImage(imagecontroller.filebytes.value!)
                              : FileImage(File(imagecontroller.imagePaths[0]))
                          : AssetImage(image),
                );
              }),
    );
  }
}
