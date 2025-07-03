import 'package:get/get.dart';

class Radiocontroller extends GetxController {
  static Radiocontroller get instace => Get.find();
  var selectedvalue = "".obs;
  void setvalue(String value) {
    selectedvalue.value = value;
  }
}
