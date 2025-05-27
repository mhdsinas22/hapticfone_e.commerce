import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/styles/colors/appcolors.dart';
import 'package:hapticfone/screens/buy/serach/serachcontroller.dart';

class RangesliderWidget extends StatelessWidget {
  const RangesliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final serachcontroller = Get.put(Serachcontroller(context: context));
    return Obx(
      () => RangeSlider(
        activeColor: Appcolors.black,
        divisions: 100,
        labels: RangeLabels(
          serachcontroller.selectedtanges.value.start.toString(),
          serachcontroller.selectedtanges.value.end.toString(),
        ),
        values: serachcontroller.selectedtanges.value,
        onChanged: (value) {
          serachcontroller.updateranges(value);
        },
        min: 0,
        max: 300000,
      ),
    );
  }
}
