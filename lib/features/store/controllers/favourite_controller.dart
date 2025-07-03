import 'dart:convert';

import 'package:get/get.dart';
import 'package:hapticfone/features/store/models/productmodels.dart';
import 'package:hapticfone/data/repository/product_repository.dart';
import 'package:hapticfone/utils/localStroage/localstroage.dart';

class Favouritecontrollwe extends GetxController {
  static Favouritecontrollwe get instance => Get.find();
  final productreposritrcontroller = Get.put(ProductRepository());
  // varabile
  final favorite = <String, bool>{}.obs;
  @override
  void onInit() {
    initFavourite();
    super.onInit();
  }

  Future<void> initFavourite() async {
    final json = await Localstroage.instance().readthedata("favorite");

    if (json != null) {
      print("json workingggggggg");
      final storedFav = jsonDecode(json) as Map<String, dynamic>;

      favorite.assignAll(
        storedFav.map(
          (key, value) => MapEntry(key, value is bool ? value : false),
        ),
      );
    }
  }

  bool isfavourite(String productid) {
    return favorite[productid] ?? false;
  }

  void toggleFavouriteproduct(String productid) {
    if (!favorite.containsKey(productid)) {
      favorite[productid] = true;
      savefavoritetolocalstroage();
      print("daved");
      Get.snackbar("Product as added to favorite", "");
    } else {
      Localstroage.instance().removedata(productid);
      favorite.remove(productid);
      savefavoritetolocalstroage();
      Get.snackbar("Product as Removed From favorite", "");
      favorite.refresh();
    }
  }

  savefavoritetolocalstroage() {
    final encodefavorite = jsonEncode(favorite);
    Localstroage.instance().savethedata("favorite", encodefavorite);
    print("encodesaved$encodefavorite");
  }

  // get products from firebase to disply in futurebuilder
  Future<List<Prouductmodels>> favoriteproducts() async {
    final favIds = favorite.keys.toList();

    if (favIds.isEmpty) {
      print("No favorite items to fetch.");
      return []; // return empty list instead of crashing Firestore query
    }

    return await productreposritrcontroller.getproductfavroite(favIds);
  }
}
