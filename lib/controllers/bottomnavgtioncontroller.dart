import 'package:get/get.dart';

class Bottomnavgtioncontroller extends GetxController {
  var selectedindex = 0.obs;
  void changedtab(int index) {
    selectedindex.value = index;
  }
}
