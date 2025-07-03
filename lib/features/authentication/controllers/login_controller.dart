import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hapticfone/common/widgets/TFullScreen_Loader.dart';
import 'package:hapticfone/features/authentication/controllers/user_controller.dart';
import 'package:hapticfone/features/store/controllers/order_controller.dart';
import 'package:hapticfone/networks/networks_manger.dart';
import 'package:hapticfone/features/authentication/controllers/authentication_repository.dart';
import 'package:hapticfone/utils/constants/images_strings.dart';

class Logincontroller extends GetxController {
  static Logincontroller get instance => Get.find();
  final usercontrollerrr = Get.put(Usercontroller());
  final usercontroller = Get.put(Ordercontroller());
  // varables
  final remberme = false.obs;
  final hidepassword = true.obs;
  final localstroage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginform = GlobalKey<FormState>();
  final RxBool isloading = false.obs;
  @override
  void onInit() {
    // email.text = localstroage.read("EMAIL");
    // password.text = localstroage.read("PASSWORD");
    super.onInit();
  }

  Future<void> login(bool isweb) async {
    try {
      // Start loading
      isloading.value = true;
      Tfullscreenloader.openLoadingDialog(
        "Logging You in.... ",
        AppAnimatons.animation2,
        isweb,
      );
      // check internet Connectivity

      final isconnected = await NetworksManger.instance.isConnected();
      if (!isconnected) {
        Tfullscreenloader.stoploading();
        return;
      }
      // Form Validation
      if (!loginform.currentState!.validate()) {
        Tfullscreenloader.stoploading();
        return;
      }
      // Save Data if Remember Me is Seleced
      if (remberme.value) {
        localstroage.write("EMAIL", email.text.trim());
        localstroage.write("PASSWORD", password.text.trim());
      }

      // Login in Email and password
      await Authenticationrepository.instance.loginwithemailandpassword(
        email.text.trim(),
        password.text.trim(),
        isweb,
      );
      // Remove Loader
      // Tfullscreenloader.stoploading();
      // Redirect
      Authenticationrepository.instance.loginscrrendirect();
    } catch (e) {
      Tfullscreenloader.stoploading();
      Get.snackbar("Oh Snap", e.toString());
    } finally {
      // Future.delayed(Duration(seconds: 10));
      isloading.value = false;
      Tfullscreenloader.stoploading();
    }
  }

  // Login with Google
  Future<void> googlesignin() async {
    try {
      // check the internet connection
      final isconnted = await NetworksManger.instance.isConnected();
      if (!isconnted) {
        Tfullscreenloader.stoploading();
        print("Inert not ready");
        return;
      }
      // Google Authencation
      final usercredential =
          await Authenticationrepository.instance.googlesignin();
      print("Error1:$e");
      // Save user record
      await usercontrollerrr.saveuserdetails(usercredential);
      print("Error2:$e");
      // remove loader
      Tfullscreenloader.stoploading();
      print("Error3:$e");
      // redirect
      Authenticationrepository.instance.loginscrrendirect();
      print("Error4:$e");
    } catch (e) {
      Get.snackbar("Oh snap", e.toString(), backgroundColor: Colors.red);
    }
  }
}
