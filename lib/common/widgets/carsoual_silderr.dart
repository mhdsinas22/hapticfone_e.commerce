import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/features/store/controllers/carousel_circular_container_controller.dart';

class CarsoualSilderr extends StatelessWidget {
  final List<dynamic> images;
  final bool isneedasset;
  final bool isweb;
  const CarsoualSilderr({
    super.key,
    required this.images,
    this.isneedasset = false,
    this.isweb = false,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Carsoulcircularcontainercontroller());
    return CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: isneedasset ? true : false,
        onPageChanged:
            (index, reason) => controller.updatepageindicatoer(index),
      ),
      itemCount: images.length,
      itemBuilder: (context, index, realIndex) {
        return isneedasset
            ? Padding(
              padding:
                  isweb ? const EdgeInsets.all(0) : const EdgeInsets.all(8.0),
              child: Image.asset(
                images[index],
                width: isweb ? null : null,
                // height: isweb ? 10.h : null,
              ),
            )
            : Image.network(images[index], width: 400, height: 400);
      },
    );
  }
}
