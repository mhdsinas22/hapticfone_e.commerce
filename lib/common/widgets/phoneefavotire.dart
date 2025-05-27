import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:hapticfone/common/widgets/favtorieicon.dart';
import 'package:hapticfone/models/productmodels.dart';
import 'package:hapticfone/screens/buy/phonedetails.dart';

class PhoneFav extends StatelessWidget {
  const PhoneFav({super.key, required this.prodxt});
  final Prouductmodels prodxt;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          Phonedetails(
            id: prodxt.id,
            images: prodxt.images,
            phoneprice: prodxt.price,
            phonecondtion: prodxt.condtion,
            phonetile: prodxt.mobilemodelname,
            phoneimage: prodxt.thumbnail,
            phonebrand: prodxt.brand,
            phonecolor: prodxt.color,
            phoneram: prodxt.ram,
            phonestock: prodxt.stock,
            phonestorage: prodxt.storage,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(8.r),
        ),

        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Favtorieicon(productid: prodxt.id)],
            ),

            SizedBox(
              height: 120.h,
              width: 500.w,
              child: Image.network(prodxt.thumbnail),
            ),
            SizedBox(height: 3),
            Text(
              prodxt.mobilemodelname,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              prodxt.condtion,
              style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              prodxt.price.toString(),
              style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
