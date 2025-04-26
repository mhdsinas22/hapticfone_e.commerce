import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/controllers/carsoulcircularcontainercontroller.dart';

class CarsoualSilderr extends StatelessWidget {
  final String phoneimage;
  const CarsoualSilderr({super.key, required this.phoneimage});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Carsoulcircularcontainercontroller());
    return CarouselSlider(
      options: CarouselOptions(
        onPageChanged:
            (index, reason) => controller.updatepageindicatoer(index),
      ),
      items: [
        Image.asset(phoneimage, width: 400, height: 400),
        Image.asset("asset/20.png"),
      ],
    );
  }
}
