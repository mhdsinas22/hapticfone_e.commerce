import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hapticfone/features/authentication/controllers/authentication_repository.dart';
import 'package:hapticfone/features/store/models/ordermodel.dart';
import 'package:hapticfone/responsive_screen/responsive_order_details.dart';

class OrderRepositry extends GetxController {
  static OrderRepositry get instance => Get.find();
  final authenticationrepositry = Get.put(Authenticationrepository());
  final _db = FirebaseFirestore.instance;
  Future<void> createorder(
    String docid,
    Ordermodel orderModels,
    var userid,
    String orderid,
  ) async {
    try {
      await _db
          .collection("Users")
          .doc(userid)
          .collection("orders")
          .doc(docid)
          .set(orderModels.tojson());
      Get.offAll(() => ResponsiveOrderDetails(orderid: orderid));
    } catch (e) {
      print("ERROROROR:$e");
    }
  }

  Future<void> updatetheorder(Ordermodel orders, String id) async {
    final userid = authenticationrepositry.auth.currentUser?.uid ?? "";

    try {
      _db
          .collection("Users")
          .doc(userid)
          .collection("orders")
          .doc(id)
          .update(orders.tojson());
    } catch (e) {
      print("ERRORROOR:$e");
    }
  }
}
