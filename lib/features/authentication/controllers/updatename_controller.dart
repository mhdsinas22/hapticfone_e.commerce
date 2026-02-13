import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/features/authentication/controllers/image_controller.dart';
import 'package:hapticfone/responsive_screen/responsive_myprofile_screen.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/common/widgets/tfullscreen_loader.dart';
import 'package:hapticfone/features/authentication/controllers/user_controller.dart';
import 'package:hapticfone/networks/networks_manger.dart';
import 'package:hapticfone/features/authentication/controllers/user_repository.dart';

class UpdateUserdetailsController extends GetxController {
  static UpdateUserdetailsController get instance => Get.find();
  final name = TextEditingController();
  final phonenumber = TextEditingController();
  GlobalKey<FormState> updateform = GlobalKey<FormState>();
  final usercontrollerr = Get.put(Usercontroller());
  final imagecontroller = Get.put(Imagecontroller());
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    insitailztionnamdandphonenumber();
    // updateuserdeatils();
  }

  Future<void> insitailztionnamdandphonenumber() async {
    name.text = usercontrollerr.user.value.fullname;
    phonenumber.text = usercontrollerr.user.value.phonenumber;
  }

  Future<void> updateuserdeatils() async {
    try {
      // check the internt conectivyt
      final isconntecd = await NetworksManger.instance.isConnected();
      if (!isconntecd) {
        Tfullscreenloader.stoploading();
        return;
      }
      await imagecontroller.uploadcloudinaryaimage();

      // Form validation
      if (!updateform.currentState!.validate()) {
        Tfullscreenloader.stoploading();
        return;
      }

      // Update users details in the firebase firestore
      Map<String, dynamic> details = {
        "Username": name.text.trim(),
        "phonenumber": phonenumber.text.trim(),
        "profilepicture": imagecontroller.cloudinaryurl.value,
      };
      await UserRepository.instance.updateSingleField(details);
      // UPDATE THE REX VALUE
      usercontrollerr.user.value.fullname = name.text.trim();
      usercontrollerr.user.value.phonenumber = phonenumber.text.trim();

      //Remove Loader
      Tfullscreenloader.stoploading();
      Get.offAll(() => ResponsiveMyprofileScreen());
      // SUcees Snacbar
      Get.snackbar(
        "Congratulations",
        "Your Are Updated the Profile",
        backgroundColor: Appcolors.appbuttongreen,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Tfullscreenloader.stoploading();
      Get.snackbar("Oh Snap", e.toString());
    }
  }
}
