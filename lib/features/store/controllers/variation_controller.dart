import 'package:get/get.dart';
import 'package:hapticfone/features/store/models/productmodels.dart';

class Vartioncontroller extends GetxController {
  static Vartioncontroller get instance => Get.find();
  // varaiblse
  RxMap selectedaddress = {}.obs;
  RxString vartionstockstatus = "".obs;
  Rx<Prouductmodels> selectedvartion = Prouductmodels.empty().obs;
  // Select Attribute
}
