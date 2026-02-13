import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/tfullscreen_loader.dart';
import 'package:hapticfone/features/authentication/models/user_models.dart';
import 'package:hapticfone/networks/networks_manger.dart';
import 'package:hapticfone/features/authentication/controllers/authentication_repository.dart';
import 'package:hapticfone/features/authentication/controllers/user_repository.dart';
import 'package:hapticfone/features/authentication/screens/login_screen.dart';
import 'package:hapticfone/features/authentication/screens/user_reauthentication_screen.dart';
import 'package:image_picker/image_picker.dart';

class Usercontroller extends GetxController {
  static Usercontroller get instance => Get.find();
  final proflieLoading = false.obs;
  final userrepocontroller = Get.put(UserRepository());
  final verfyemail = TextEditingController();
  final verefiypassword = TextEditingController();
  GlobalKey<FormState> reauthkey = GlobalKey<FormState>();
  // User Value assign
  Rx<Usermodel> user = Usermodel.empty().obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchuserRecord();
  }

  Future<void> fetchuserRecord() async {
    try {
      proflieLoading.value = true;
      final user = await userrepocontroller.fetchUserData();
      this.user.value = user!;
    } catch (e) {
    } finally {
      proflieLoading.value = false;
    }
  }

  // Save user details from any regestion providers prodevermeans(google,facebook,github,mail creation)
  Future<void> saveuserdetails(UserCredential? usercredential) async {
    try {
      if (usercredential != null) {
        //Map Data
        final user = Usermodel(
          id: usercredential.user!.uid,
          fullname: usercredential.user?.displayName ?? "",
          email: usercredential.user?.email ?? "",
          phonenumber: usercredential.user?.phoneNumber ?? "",
          profilepicture: usercredential.user?.photoURL ?? "",
          password: "",
        );
        // Save User data
        await userrepocontroller.saveUserRecord(user);
        await fetchuserRecord();
      }
    } catch (e) {
      Get.snackbar(
        "Data Not Saved",
        "Something went wring while saving your information. You ca re-save your data in your Profile",
        backgroundColor: Colors.red,
      );
    }
  }

  void deleteUserAccount() async {
    try {
      //First ReAuthencticon
      final authenicatonauth = Authenticationrepository.instance;
      final provider =
          authenicatonauth.authuser!.providerData
              .map((e) => e.providerId)
              .first;
      if (provider.isNotEmpty) {
        // Re Verify The Email
        if (provider == "google.com") {
          await authenicatonauth.googlesignin();
          await authenicatonauth.deleteaccount();
          //stoploading
          Tfullscreenloader.stoploading();
          Get.offAll(() => LoginScreen());
        } else if (provider == "password") {
          Tfullscreenloader.stoploading();
          Get.to(() => const UserReauthenticationScreen());
        }
      }
    } catch (e) {
      Tfullscreenloader.stoploading();
    }
  }

  Future<void> reauthinetcionEmailandpassoeed() async {
    try {
      // check the internt
      final isconnected = await NetworksManger.instance.isConnected();
      if (!isconnected) {
        Tfullscreenloader.stoploading();
        return;
      }
      if (!reauthkey.currentState!.validate()) {
        Tfullscreenloader.stoploading();
        return;
      }
      await Authenticationrepository.instance.reauthenticationEmailAndPassword(
        verfyemail.text.trim(),
        verefiypassword.text.trim(),
      );
      await Authenticationrepository.instance.deleteaccount();
      Tfullscreenloader.stoploading();
      Get.offAll(() => LoginScreen());
    } catch (e) {
      Tfullscreenloader.stoploading();
      Get.snackbar(
        "ON SNAP",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  updateuserprofile() async {
    try {
      final isconnected = await NetworksManger.instance.isConnected();
      if (!isconnected) {
        Tfullscreenloader.stoploading();
        print("stop newtwek weork not have");
        return;
      }
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        Get.snackbar("Error", "User not logged in. Please login again.");
        return;
      }

      final imagepicked = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512.h,
        maxWidth: 512.w,
      );

      if (imagepicked != null) {
        try {
          final imageurl = await userrepocontroller.uploadimage(
            "users/${FirebaseAuth.instance.currentUser!.uid}",
            imagepicked,
          );
          print("IMAge URL :$imageurl");
        } catch (e) {
          print("Uplode file:$e");
        }
        final imageurl = await userrepocontroller.uploadimage(
          "users/${FirebaseAuth.instance.currentUser!.uid}",
          imagepicked,
        );

        Map<String, dynamic> json = {"profilepicture": imageurl};
        await userrepocontroller.updateSingleField(json);
        user.value.profilepicture = imageurl;

        Get.snackbar("Congratulations", "Your Profile image has been updated!");
      }
    } catch (e) {
      Get.snackbar("Oh Snap", "Something Went Wrong: $e");
    }
  }
}
