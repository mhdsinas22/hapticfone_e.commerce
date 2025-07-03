import 'package:get/get.dart';

class Carsoulcircularcontainercontroller extends GetxController {
  static Carsoulcircularcontainercontroller get instance => Get.find();
  final carsoulcircularcontainerindex = 0.obs;
  void updatepageindicatoer(index) {
    carsoulcircularcontainerindex.value = index;
  }
}
