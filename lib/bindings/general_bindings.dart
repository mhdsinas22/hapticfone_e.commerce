import 'package:get/get.dart';
import 'package:hapticfone/networks/networks_manger.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworksManger());
  }
}
