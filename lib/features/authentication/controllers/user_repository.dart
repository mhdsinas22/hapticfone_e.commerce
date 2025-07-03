import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/custom_bottomnavgitonbar/custom_bottomnavgtionbar_home.dart';
import 'package:hapticfone/features/authentication/models/user_models.dart';
import 'package:hapticfone/features/authentication/controllers/authentication_repository.dart';
import 'package:hapticfone/features/authentication/screens/signup_screen.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  RxList<Usermodel> usermodelsdata = <Usermodel>[].obs;
  //FUnction to dave user data to Firestore
  Future<void> saveUserRecord(Usermodel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException {
      throw FirebaseException;
    } on FormatException {
      throw FormatException();
    } on PlatformException {
      throw PlatformException;
    }
  }

  // Function Use to Fetch user data from firestore
  Future<Usermodel?> fetchUserData() async {
    try {
      final documentSnapshot =
          await _db
              .collection("Users")
              .doc(Authenticationrepository.instance.authuser?.uid)
              .get();

      if (documentSnapshot.exists) {
        return Usermodel.fromSnapshot(documentSnapshot);
      } else {
        return null;
      }
    } on FirebaseException {
      rethrow;
    } on FormatException {
      rethrow;
    } on PlatformException {
      rethrow;
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }

  void loginemailandpassword(String useremail, String userpassword) async {
    try {
      final matchemail = usermodelsdata.where(
        (email) => email.email == useremail,
      );
      final matchpassword = usermodelsdata.where(
        (password) => password.password == userpassword,
      );
      if (matchemail == useremail && userpassword == matchpassword) {
        Get.offAll(() => CustomBottomnavgtionbarhome());
      } else {
        Get.defaultDialog(
          backgroundColor: Colors.white,
          title: "No account found",
          content: SizedBox(
            width: 250.w,
            height: 120.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Check your email and passord and Try agiang"),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100.w,
                      height: 40.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey[300],
                      ),
                      child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "TRY AGAIN",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 130.w,
                      height: 40.h,
                      decoration: BoxDecoration(color: Colors.red),
                      child: TextButton(
                        onPressed: () => Get.offAll(() => Signupscreen()),
                        child: Text(
                          "CREATE NEW ACCOUNT",
                          style: TextStyle(color: Colors.white, fontSize: 9.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          titleStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        );
      }
    } catch (e) {}
  }

  // Function we can use update the user data
  Future<void> updateUserdata(Usermodel updatedata) async {
    try {
      await _db
          .collection("Users")
          .doc(updatedata.id)
          .update(updatedata.toJson());
    } on FirebaseException {
      throw FirebaseException;
    } on FormatException {
      throw FormatException();
    } on PlatformException {
      throw PlatformException;
    } catch (e) {
      throw "something is wronf:$e";
    }
  }

  // Function use to Update any spefcic filed user collicton

  Future<void> updateSingleField(Map<String, dynamic> tojson) async {
    try {
      await _db
          .collection("Users")
          .doc(Authenticationrepository.instance.authuser?.uid)
          .update(tojson);
    } on FirebaseException {
      throw FirebaseException;
    } on FormatException {
      throw FormatException();
    } on PlatformException {
      throw PlatformException;
    } catch (e) {
      throw "something is wronf:$e";
    }
  }

  // Remove the data
  Future<void> removedata(String userid) async {
    try {
      await _db.collection("Users").doc(userid).delete();
    } on FirebaseException {
      throw FirebaseException;
    } on FormatException {
      throw FormatException();
    } on PlatformException {
      throw PlatformException;
    } catch (e) {
      throw "something is wronf:$e";
    }
  }

  // upolad any image

  Future<String> uploadimage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      // Upload the file
      await ref.putFile(File(image.path));
      // Wait for the download URL
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      // Firebase specific error
      throw "Firebase error: ${e.message}";
    } on FormatException catch (e) {
      throw "Format error: ${e.message}";
    } on PlatformException catch (e) {
      throw "Platform error: ${e.message}";
    } catch (e) {
      throw "Something went wrong: $e";
    }
  }
}
