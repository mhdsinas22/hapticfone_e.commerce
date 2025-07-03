import 'package:get/get.dart';

class Dropdowncontroller extends GetxController {
  static Dropdowncontroller get instance => Get.find();
  var stateitems =
      [
        "Andhra Pradesh",
        "Arunachal Pradesh",
        "Assam",
        "Bihar",
        "Chhattisgarh",
        "Goa",
        " Gujarat",
        "Haryana",
        "Himachal Pradesh",
        "Jharkhand",
        " Karnataka",
        "Kerala",
        " Madhya Pradesh",
        "Maharashtra",
        "Manipur",
        "Meghalaya",
        "Mizoram",
        " Nagaland",
        "Odisha",
        "Punjab",
        "Rajasthan",
        "Sikkim",
        "Tamil Nadu",
        "Telangana",
        "Tripura",
        " Uttar Pradesh",
        "Uttarakhand",
        "West Bengal",
      ].obs;

  var selectedvalue = "".obs;
  void changethevaluebrand(String value) {
    selectedvalue.value = value;
  }

  // void changethevaluecondtion(String value) {
  //   condtionselectedvalue.value = value;
  // }
}
