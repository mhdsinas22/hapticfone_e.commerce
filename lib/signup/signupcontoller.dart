import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/models/usermodels.dart';
import 'package:hapticfone/networks/networks_manger.dart';
import 'package:hapticfone/repository/authenticationrepository.dart';
import 'package:hapticfone/repository/user/user_repository.dart';
import 'package:hapticfone/screens/email_screen.dart';
import 'package:hapticfone/widgets/TFullScreenLoader.dart';

class Signupcontoller extends GetxController {
  static Signupcontoller get instance => Get.find();
  final hidepassword = true.obs;
  final pricayandpolicy = true.obs;
  final fullname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final phonenumber = TextEditingController();
  final confirmpasswoed = TextEditingController();
  GlobalKey<FormState> signupform = GlobalKey<FormState>();
  void signup() async {
    try {
      // Start Loading
      // Tfullscreenloader.openLoadingDialog(
      //   "We are processing your information...",
      //   "asset/checked.png",
      // );
      // Check Internet Connectivity
      final isConnected = await NetworksManger.instance.isConnected();
      if (!isConnected) {
        Tfullscreenloader.stoploading();
        return;
      }
      // Form Validation
      if (!signupform.currentState!.validate()) {
        Tfullscreenloader.stoploading();
        return;
      }
      // pricvay and policy
      if (!pricayandpolicy.value) {
        Get.snackbar(
          "Accept Privay and Policy",
          "In Order to create account, you must have to read and accept the pricay & terms of Use",
          colorText: Colors.white,
          backgroundColor: Colors.red,
        );
        return;
      }
      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await Authenticationrepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );
      // Save Authenticated user data in the Firebase Firestore
      final newuser = Usermodel(
        id: userCredential.user!.uid,
        fullname: fullname.text.trim(),
        email: email.text.trim(),
        phonenumber: phonenumber.text.trim(),
        profilepicture: "",
      );
      final userrepository = Get.put(UserRepository());
      await userrepository.SaveUserRecord(newuser);
      // Show Success Message
      Get.snackbar(
        "ConGratulations",
        "Your Acoount has been Created ! Verify email to continue.",
      );

      // Move To Verify EMail Screen;
      Get.off(() => EmailScreen(email: email.text.trim()));
    } catch (e) {
      Get.snackbar(
        colorText: Colors.white,
        "On Snap !",
        e.toString(),
        backgroundColor: CupertinoColors.destructiveRed,
      );
    } finally {
      Tfullscreenloader.stoploading();
    }
  }
}
