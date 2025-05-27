import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hapticfone/models/productmodels.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();
  final firebaseinstance = FirebaseFirestore.instance;
  Future<List<Prouductmodels>> getproductfavroite(
    List<String> productids,
  ) async {
    try {
      if (productids.isEmpty) {
        return [];
      }
      final snapahot =
          await firebaseinstance
              .collection("products")
              .where(FieldPath.documentId, whereIn: productids)
              .get();
      return snapahot.docs
          .map((querysnapshot) => Prouductmodels.fromsnapshot(querysnapshot))
          .toList();
    } catch (e) {
      throw "something $e";
    }
  }
}
