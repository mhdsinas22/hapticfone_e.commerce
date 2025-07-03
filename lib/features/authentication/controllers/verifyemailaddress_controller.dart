import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
// import 'package:hapticfone/features/authentication/controllers/authentication_repository.dart';
import 'package:hapticfone/features/authentication/screens/sucees_screen.dart';

class VerifyEmailAddress extends GetxController {
  static VerifyEmailAddress get instance => Get.find();
  //Send EMail Wheneever VErify Screen appears & Set TIme fot Auto redirect
  @override
  void onInit() {
    // sendEmailVerfication();
    setTimerForAutoRedirect();
    super.onInit();
  }

  // Send Email Verifcation Link
  // sendEmailVerfication() async {
  //   try {
  //     await Authenticationrepository.instance.sendEmailVerfication();
  //     Get.snackbar(
  //       "Email Sent",
  //       "Please Check Your inbox and Verify your email",
  //     );
  //   } catch (e) {
  //     Get.snackbar("On Snap", e.toString());
  //   }
  // }

  // Timer to automaticallyy redirect on Email Verfication
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (Timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user!.emailVerified) {
        Timer.cancel();
        Get.offAll(SuceesScreen());
      }
    });
  }

  // Manually check if Email Verified
  checkEmailverficationStatus() async {
    final currentuser = FirebaseAuth.instance.currentUser;
    if (currentuser != null && currentuser.emailVerified) {
      Get.offAll(SuceesScreen());
    }
  }
}
