import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/features/store/controllers/favourite_controller.dart';

class Favtorieicon extends StatelessWidget {
  const Favtorieicon({super.key, required this.productid, this.isweb = false});
  final String productid;
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    final favtorieiconcontroller = Get.put(Favouritecontrollwe());
    return Obx(
      () => IconButton(
        icon: Image.asset(
          favtorieiconcontroller.isfavourite(productid)
              ? "assets/heart (1).png"
              : "assets/heart.png",
          width: isweb ? 10.w : 30.w,
          height: isweb ? 20.h : 20.h,
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
