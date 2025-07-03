import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hapticfone/features/store/models/addressmodels.dart';
import 'package:hapticfone/networks/networks_manger.dart';
import 'package:hapticfone/features/authentication/controllers/authentication_repository.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  final netwokmangger = Get.put(NetworksManger());
  final autehnticationreposity = Get.put(Authenticationrepository());
  Future<List<Addressmodels>> fetchuseraddress() async {
    final user = autehnticationreposity.auth.currentUser;
    final userid = user?.uid;
    print("userid:$userid");
    if (userid == null || userid.isEmpty) {
      print("USER ID IS EMPTY");
      return [];
    }

    try {
      final result =
          await _db.collection("Users").doc(userid).collection("address").get();

      return result.docs.map((doc) => Addressmodels.fromsnapshot(doc)).toList();
    } catch (e) {
      print("Error fetching user address: $e");
      return [];
    }
  }

  // Clear the "Selected" field for all addresss
  Future<void> updateSelectedfield(String addressdid, bool selected) async {
    try {
      final userid = Authenticationrepository.instance.authuser?.uid ?? "";
      await _db
          .collection("Users")
          .doc(userid)
          .collection("address")
          .doc(addressdid)
          .update({"selectedaddress": selected});
    } catch (e) {
      throw "some have erro $e";
    }
  }

  // Store user id
  Future<String> addaddress(Addressmodels addresmodes, String docid) async {
    try {
      final userid = Authenticationrepository.instance.authuser?.uid ?? "";
      await _db
          .collection("Users")
          .doc(userid)
          .collection("address")
          .doc(docid)
          .set(addresmodes.toJson());
      return docid;
    } catch (e) {
      throw "ERROR$e";
    }
  }

  Future<void> deleteaddress(Addressmodels addresmodes) async {
    try {
      final user = autehnticationreposity.auth.currentUser;
      final userid = user?.uid;
      print("Deleteworking");
      await _db
          .collection("Users")
          .doc(userid)
          .collection("address")
          .doc(addresmodes.id)
          .delete();

      print(" adderssss:${addresmodes.id}");
      print(userid);
    } catch (e) {
      throw "ERROR$e";
    }
  }

  Future<void> edittheaddresssrepo(
    String addressid,
    Addressmodels addressmodel,
  ) async {
    final userid = Authenticationrepository.instance.authuser?.uid ?? "";
    await _db
        .collection("Users")
        .doc(userid)
        .collection("address")
        .doc(addressid)
        .update(addressmodel.toJson());
  }
}
