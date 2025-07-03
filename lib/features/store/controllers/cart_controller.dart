import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/utils/constants/snackbar.dart';
import 'package:hapticfone/features/store/models/cartmodels.dart';
import 'package:hapticfone/features/authentication/controllers/authentication_repository.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();
  @override
  void onInit() {
    super.onInit();
    calculateTotal();
  }

  final _db = FirebaseFirestore.instance;
  // varables
  RxInt noofcartitems = 0.obs;
  RxInt nofproductquabtiy = 0.obs;
  // RxDouble nooftotalprice = 0.0.obs;
  RxList<Cartmodels> cartitems = <Cartmodels>[].obs;
  RxBool isLoading = false.obs;
  Future<void> addToCart(String cardid, Cartmodels cardmodel) async {
    try {
      isLoading.value = true;
      final userid =
          Authenticationrepository.instance.auth.currentUser?.uid ?? "";
      await _db
          .collection("Users")
          .doc(userid)
          .collection("Cart")
          .doc(cardid)
          .set(cardmodel.toJson());
      // calculateTotal();
      Get.dialog(
        AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            width: 350,
            height: 252,
            child: Column(
              children: [
                Image.asset(
                  "assets/checked.png",
                  width: 93,
                  height: 93,
                  color: Color(0xffB4D97A),
                ),
                SizedBox(height: 10),
                Text(
                  "Added To Cart!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Your item has been",
                  style: TextStyle(color: Appcolors.appgrey),
                ),
                Text(
                  "Succesfully added to your cart",
                  style: TextStyle(color: Appcolors.appgrey),
                ),
                SizedBox(height: 10),
                Container(
                  width: 200.w,
                  height: 56.28.h,
                  decoration: BoxDecoration(
                    color: Color(0xffB4D97A),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "Continue shopping",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      await fetchcartitems();
    } catch (e) {
      Get.snackbar("SOME thing Erorr", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchcartitems() async {
    try {
      isLoading.value = true;
      final userid =
          Authenticationrepository.instance.auth.currentUser?.uid ?? "";
      final snpasot =
          await _db.collection("Users").doc(userid).collection("Cart").get();
      final items =
          snpasot.docs.map((doc) {
            return Cartmodels.fromJson(doc.data());
          }).toList();
      cartitems.assignAll(items);
      calculateTotal();
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  void increment(int index) {
    if (cartitems[index].stock > cartitems[index].count.value) {
      cartitems[index].count++;
      cartitems[index].changingprice.value =
          cartitems[index].price * cartitems[index].count.value;
      cartitems.refresh();
      print("CART ITEMS:-$cartitems");
      print("WORKING:{${cartitems[index].id}}");
      calculateTotal();
    } else {
      Snackbars.waringsnakbar("Sorry", "Out of Stock 😢");
    }

    // print(cartitems[index].count);
  }

  void decemrnt(int index) {
    if (cartitems[index].count > 1) {
      cartitems[index].count--;
      cartitems[index].changingprice.value =
          cartitems[index].price * cartitems[index].count.value;
      calculateTotal();
      cartitems.refresh();
    }
  }

  Future<void> deletethecart(String docid) async {
    try {
      isLoading.value = true;
      final userid =
          Authenticationrepository.instance.auth.currentUser?.uid ?? "";
      await _db
          .collection("Users")
          .doc(userid)
          .collection("Cart")
          .doc(docid)
          .delete();
      await fetchcartitems();
      cartitems.refresh();
      await calculateTotal();
    } finally {
      isLoading.value = false;
    }
  }

  var total = 0.0.obs;

  Future<void> calculateTotal() async {
    double sum = 0.0;
    for (var item in cartitems) {
      sum += item.changingprice.toDouble();
    }

    total.value = sum;
    total.refresh();
  }

  Future<void> deleltfullcollectionfromcart() async {
    final userid =
        Authenticationrepository.instance.auth.currentUser?.uid ?? "";
    print("DELETE WORKING");
    final collection = _db.collection("Users").doc(userid).collection("Cart");
    final snapshot = await collection.get();
    for (var doc in snapshot.docs) {
      await doc.reference.delete();
    }
    await fetchcartitems();
    cartitems.refresh();

    print("All items deleted from Cart.");
  }
}
