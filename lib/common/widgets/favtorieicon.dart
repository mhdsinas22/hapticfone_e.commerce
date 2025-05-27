import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/controllers/favouritecontrollwe.dart';

class Favtorieicon extends StatelessWidget {
  const Favtorieicon({super.key, required this.productid});
  final String productid;
  @override
  Widget build(BuildContext context) {
    final favtorieiconcontroller = Get.put(Favouritecontrollwe());
    return Obx(
      () => IconButton(
        icon: Image.asset(
          favtorieiconcontroller.isfavourite(productid)
              ? "asset/heart (1).png"
              : "asset/heart.png",
          width: 30.w,
          height: 20.h,
          color:
              favtorieiconcontroller.isfavourite(productid)
                  ? Colors.red
                  : Colors.black,
        ),
        onPressed: () {
          print("prodicyid:$productid");
          favtorieiconcontroller.toggleFavouriteproduct(productid);
        },
      ),
    );
  }
}
