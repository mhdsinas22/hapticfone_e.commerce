import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:hapticfone/common/widgets/favtorie_icon.dart';
import 'package:hapticfone/features/store/models/productmodels.dart';
import 'package:hapticfone/responsive_screen/responsive_phone_details_screen.dart';

class PhoneFav extends StatelessWidget {
  const PhoneFav({super.key, required this.prodxt, this.isweb = false});
  final Prouductmodels prodxt;
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
          ResponsivePhoneDetailsScreen(
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
              children: [Favtorieicon(productid: prodxt.id, isweb: isweb)],
            ),

            SizedBox(
              height: 120.h,
              width: 500.w,
              child: Image.network(prodxt.thumbnail),
            ),
            SizedBox(height: 3),
            Text(
              prodxt.mobilemodelname,
              style: TextStyle(
                fontSize: isweb ? null : 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              prodxt.condtion,
              style: TextStyle(
                fontSize: isweb ? null : 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              prodxt.price.toString(),
              style: TextStyle(
                fontSize: isweb ? null : 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
