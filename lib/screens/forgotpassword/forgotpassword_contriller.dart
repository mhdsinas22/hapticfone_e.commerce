import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/TFullScreenLoader.dart';
import 'package:hapticfone/networks/networks_manger.dart';
import 'package:hapticfone/repository/authenticationrepository.dart';
import 'package:hapticfone/screens/forgotpassword/resetpasswordscreen.dart';

class ForgotpasswordContriller extends GetxController {
  static ForgotpasswordContriller get instance => Get.find();
  final email = TextEditingController();
  GlobalKey<FormState> forgotemail = GlobalKey<FormState>();

  //Send Rest password email
  sendrestpasswordresendemail() async {
    try {
      //Start loading
      // Check the internet connectivy
      final isconncted = await NetworksManger.instance.isConnected();
      if (!isconncted) {
        Tfullscreenloader.stoploading();
        return;
      }
      // Form validation
      if (!forgotemail.currentState!.validate()) {
        return;
      }
      // Send Email verfication
      await Authenticationrepository.instance.sendrestpassowrdlink(
        email.text.trim(),
      );
      // Remove Loader
      // Show Sucess page
      Get.snackbar(
        "Email Sent",
        "Email Link Sent Reset Your password",
        backgroundColor: Colors.green,
      );
      // ReDirect
      Get.offAll(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      Get.snackbar("On snap HEEEe", e.toString());
    }
  }

  resendresetpassoedrestemail(String email) async {
    try {
      //Start loading
      // Check the internet connectivy
      final isconncted = await NetworksManger.instance.isConnected();
      if (!isconncted) {
        Tfullscreenloader.stoploading();
        return;
      }
      // Send Email verfication
      await Authenticationrepository.instance.sendrestpassowrdlink(email);
      // Remove Loader
      Tfullscreenloader.stoploading();
      // Show Sucess page
      Get.snackbar(
        "Email Sent",
        "Email Link Sent Reset Your password",
        backgroundColor: Colors.green,
      );
    } catch (e) {
      Get.snackbar("On snap", e.toString());
    }
  }
}
