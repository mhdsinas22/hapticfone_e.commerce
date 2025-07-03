import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/TFullScreen_Loader.dart';
import 'package:hapticfone/features/authentication/models/user_models.dart';
import 'package:hapticfone/networks/networks_manger.dart';
import 'package:hapticfone/features/authentication/controllers/authentication_repository.dart';
import 'package:hapticfone/features/authentication/controllers/user_repository.dart';
import 'package:hapticfone/responsive_screen/resopive_login_screen.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
// import 'package:hapticfone/features/authentication/screens/email_screen.dart';

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
        password: password.text.trim(),
      );
      final userrepository = Get.put(UserRepository());
      await userrepository.saveUserRecord(newuser);
      // Show Success Message
      Get.snackbar(
        "Congratulations",
        "Your Acoount has been Created!",
        backgroundColor: Appcolors.appbuttongreen,
      );

      // // Move To Verify EMail Screen;
      Get.off(() => ResopiveLoginScreen());
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
