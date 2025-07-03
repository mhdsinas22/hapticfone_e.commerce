import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:hapticfone/features/store/models/productmodels.dart';
import 'package:hapticfone/features/store/screens/buy_screen/pages/favouritebrands/favouritebrands.dart';

void filtredbrands(String brandname, bool isweb) {
  FirebaseFirestore.instance
      .collection("products")
      .where("brand", isEqualTo: brandname)
      .get()
      .then((snapshot) {
        List<Prouductmodels> phone =
            snapshot.docs.map((items) {
              return Prouductmodels.fromJson(items.data());
            }).toList();
        Get.to(
          () => Favouritebrands(title: brandname, items: phone, isweb: isweb),
        );
      });
}

class FirebaseCrudfunction {
  void createfunction(
    String collectionpath,
    String docid,
    Map<String, dynamic> data,
  ) {
    FirebaseFirestore.instance.collection(collectionpath).doc(docid).set(data);
  }

  // static Future<void> readFunction(String collectionpath,) async {
  //   final data =
  //       await FirebaseFirestore.instance.collection(collectionpath).get();
  //   var document = data.docs;
  // }
}
