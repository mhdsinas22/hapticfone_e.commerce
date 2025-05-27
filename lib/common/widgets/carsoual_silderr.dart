import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/controllers/carsoulcircularcontainercontroller.dart';

class CarsoualSilderr extends StatelessWidget {
  final List<dynamic> images;
  const CarsoualSilderr({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Carsoulcircularcontainercontroller());
    return CarouselSlider.builder(
      options: CarouselOptions(
        onPageChanged:
            (index, reason) => controller.updatepageindicatoer(index),
      ),
      itemCount: images.length,
      itemBuilder: (context, index, realIndex) {
        return Image.network(images[index], width: 400, height: 400);
      },
    );
  }
}
