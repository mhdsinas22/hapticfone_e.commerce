import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hapticfone/models/usermodels.dart';
import 'package:hapticfone/repository/authenticationrepository.dart';
import 'package:image_picker/image_picker.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //FUnction to dave user data to Firestore
  Future<void> SaveUserRecord(Usermodel user) async {
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
  Future<Usermodel> fetchUserData() async {
    try {
      final documentSnapshot =
          await _db
              .collection("Users")
              .doc(Authenticationrepository.instance.authuser?.uid)
              .get();

      if (documentSnapshot.exists) {
        return Usermodel.fromSnapshot(documentSnapshot);
      } else {
        return Usermodel.empty();
      }
    } on FirebaseException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw Exception("Something went wrong: $e");
    }
  }

  // Function we can use update the user data
  Future<void> UpdateUserdata(Usermodel updatedata) async {
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
