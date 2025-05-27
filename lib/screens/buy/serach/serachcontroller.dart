import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  @override
  void onInit() {
    Future.delayed(Duration(microseconds: 300), () {
      FocusScope.of(context).requestFocus(focusNode);
    });
    fetchdata();
    super.onInit();
  }

  void updateranges(RangeValues values) {
    selectedtanges.value = values;
    minprice.value = values.start;
    maxprice.value = values.end;
  }

  Future<void> fetchdata() async {
    var data = await FirebaseFirestore.instance.collection("products").get();
    userlist.value = data.docs;
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
      return matchserach && matchprice;
    }).toList();
  }
}
