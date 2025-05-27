import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hapticfone/common/widgets/TFullScreenLoader.dart';
import 'package:hapticfone/controllers/usercontroller.dart';
import 'package:hapticfone/networks/networks_manger.dart';
import 'package:hapticfone/repository/authenticationrepository.dart';

class Logincontroller extends GetxController {
  static Logincontroller get instance => Get.find();
  final usercontrollerrr = Get.put(Usercontroller());
  // varables
  final remberme = false.obs;
  final hidepassword = true.obs;
  final localstroage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginform = GlobalKey<FormState>();
  @override
  void onInit() {
    // email.text = localstroage.read("EMAIL");
    // password.text = localstroage.read("PASSWORD");
    super.onInit();
  }

  Future<void> login() async {
    try {
      // Start loading
      // Tfullscreenloader.openLoadingDialog(
      //   "Logging You in.... ",
      //   AppAnimatons.animation2,
      // );
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
      );
      // Remove Loader
      // Tfullscreenloader.stoploading();
      // Redirect
      Authenticationrepository.instance.loginscrrendirect();
    } catch (e) {
      Tfullscreenloader.stoploading();
      Get.snackbar("Oh Snap", e.toString());
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
      Authenticationrepository.instance.screenredirect();
      print("Error4:$e");
    } catch (e) {
      Get.snackbar("Oh snap", e.toString(), backgroundColor: Colors.red);
    }
  }
}
