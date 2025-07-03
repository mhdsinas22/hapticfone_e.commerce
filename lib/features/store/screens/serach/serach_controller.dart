import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/features/store/models/brandmodels.dart';

class Serachcontroller extends GetxController {
  static Serachcontroller get instance => Get.find();
  final FocusNode focusNode = FocusNode();
  final BuildContext context;
  Serachcontroller({required this.context});
  final GlobalKey<ScaffoldState> scoffdkey = GlobalKey<ScaffoldState>();
  var selectedtanges = RangeValues(0, 0).obs;
  var serachtext = "".obs;
  var userlist = [].obs;
  var minprice = 0.0.obs;
  var maxprice = 300000.0.obs;
  RxBool isloading = false.obs;
  @override
  void onInit() {
    Future.delayed(Duration(microseconds: 300), () {
      FocusScope.of(context).requestFocus(focusNode);
    });
    fetchdata();
    fetchCatrogery();
    super.onInit();
  }

  void updateranges(RangeValues values) {
    selectedtanges.value = values;
    minprice.value = values.start;
    maxprice.value = values.end;
  }

  Future<void> fetchdata() async {
    try {
      isloading.value = true;
      var data = await FirebaseFirestore.instance.collection("products").get();
      userlist.value = data.docs;
    } finally {
      isloading.value = false;
    }
  }

  List get filtreditem {
    return userlist.where((data) {
      var result = data["mobiletitle"].toString().toLowerCase().trim();
      bool matchserach =
          serachtext.value.isEmpty ||
          result.contains(serachtext.value.toLowerCase());
      var resultprice = double.parse(data["price"].toString());
      bool matchprice =
          resultprice >= minprice.value && resultprice <= maxprice.value;
      var brand = data["brand"].toString();
      bool matchbrand =
          selectedbrand.value == "ALL" || selectedbrand.value.isEmpty
              ? true
              : brand == selectedbrand.value;
      var condtion = data["condtion"].toString();
      bool matchcondtion =
          selectCondtion.value == "ALL" || selectCondtion.value.isEmpty
              ? true
              : condtion == selectCondtion.value;
      return matchserach && matchprice && matchbrand && matchcondtion;
    }).toList();
  }

  var brands = <Brandmodels>[].obs;
  var selectedbrand = "".obs;
  void changedseletedvalue(value) {
    selectedbrand.value = value;
  }

  Future<void> fetchCatrogery() async {
    print("FETCH CATEISEOR");
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection("Addbrand").get();
      final data = snapshot.docs;
      for (var datas in data) {
        final brandmap = datas.data();
        final brandmodel = Brandmodels.frommap(brandmap, "");
        brands.add(brandmodel);
        print("DATATS:-${datas.data()}");
      }

      print("LENGHT:-${data.length}");
    } catch (e) {
      print("ERRRORofbrand:-$e");
    }
  }

  var selectCondtion = "".obs;
  var condtionitems =
      [
        "ALL",
        "Brand New",
        "Box Open",
        "Like New",
        "Pre-owned",
        "Renewed",
        "Grade A Used",
        "Grade B Used",
      ].obs;
  void changedCondtion(value) {
    selectCondtion.value = value;
  }
}
