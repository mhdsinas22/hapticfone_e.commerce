import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/TProductTitle_Text.dart';
import 'package:hapticfone/common/widgets/tCircular_Icon.dart';
import 'package:hapticfone/common/widgets/tProductPrice_Text.dart';
import 'package:hapticfone/common/widgets/trounded_Image.dart';
import 'package:hapticfone/features/store/controllers/cart_controller.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/utils/constants/sizes.dart';

class CartWidgtes extends StatelessWidget {
  const CartWidgtes({
    super.key,
    required this.mobilename,
    required this.condtion,
    required this.price,
    required this.thumbnaik,
    required this.productid,
    required this.index,
    required this.count,
    required this.changeprice,
    required this.id,
    this.isweb = false,
  });
  final bool isweb;
  final String mobilename;
  final String condtion;
  final String price;
  final String thumbnaik;
  final String productid;
  final int index;
  final int count;
  final double changeprice;
  final String id;

  @override
  Widget build(BuildContext context) {
    final cartcontroller = Get.put(CartController());
    return Column(
      children: [
        Row(
          children: [
            TroundedImage(
              height: 60,
              width: 60,
              imageurl: thumbnaik,
              padding: EdgeInsets.all(Sizes.sm),
              borderradius: 0,
              backgroundcolor: Appcolors.white,
            ),
            const SizedBox(width: Sizes.spaceBtwItems),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Spacer(),
                  // Text(""),
                  Flexible(
                    child: Tproducttitletext(
                      text: mobilename.toUpperCase(),
                      maxlines: 1,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Condtion ",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: condtion,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(width: 75),
                TcircularIcon(
                  onPressed: () => cartcontroller.decemrnt(index),
                  icon: Icons.minimize,
                  backgroudcolor: Appcolors.chipcolor,
                  width: 32,
                  height: 32,
                  size: Sizes.md,
                  color: Appcolors.black,
                ),
                const SizedBox(width: Sizes.spaceBtwItems),
                Row(
                  children: [
                    Text(
                      count.toString(),
                      style: TextTheme.of(context).titleSmall,
                    ),

                    const SizedBox(width: Sizes.spaceBtwItems),
                    TcircularIcon(
                      onPressed: () => cartcontroller.increment(index),
                      icon: Icons.add,
                      backgroudcolor: Appcolors.mygreen,
                      width: 32,
                      height: 32,
                      size: Sizes.md,
                      color: Appcolors.white,
                    ),
                    IconButton(
                      onPressed: () => cartcontroller.deletethecart(id),
                      icon: Icon(Icons.delete, color: Appcolors.error),
                    ),
                  ],
                ),
              ],
            ),
            Tproductpricetext(price: changeprice.toString()),
          ],
        ),
      ],
    );

    //  Center(
    //   child: Padding(
    //     padding: EdgeInsets.all(12.r),
    //     child: Material(
    //       elevation: 5,
    //       child: Container(
    //         decoration: BoxDecoration(color: Colors.grey[100]),
    //         width: isweb ? 200.w : 368.w,
    //         height: isweb ? 300.h : 100.h,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: RectangleContainer(
    //                 width: 70,
    //                 child: Center(
    //                   child: CachedNetworkImageCustom(
    //                     imageurl: thumbnaik,
    //                     fit: BoxFit.contain,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             SizedBox(width: 10.w),
    //             Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Boldtext(
    //                   text: mobilename.toUpperCase(),
    //                   size: isweb ? 5 : 13,
    //                   maxlines: 1,
    //                 ),
    //                 Boldtext(
    //                   text: condtion.toUpperCase(),
    //                   size: isweb ? 5 : 13,
    //                 ),
    //                 Boldtext(text: "₹$changeprice", size: isweb ? 7 : 15),
    //               ],
    //             ),
    //             SizedBox(width: 10),
    //             Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceAround,
    //               children: [
    //                 InkWell(
    //                   onTap: () => cartcontroller.decemrnt(index),
    //                   child: Boldtext(text: "-", size: isweb ? 10 : 25),
    //                 ),
    //                 SizedBox(width: 3.w),
    //                 Boldtext(text: count.toString(), size: isweb ? 8 : 16),
    //                 SizedBox(width: 3.w),
    //                 InkWell(
    //                   onTap: () {
    //                     cartcontroller.increment(index);
    //                   },

    //                   child: Boldtext(text: "+", size: isweb ? 8 : 16),
    //                 ),
    //                 IconButton(
    //                   onPressed: () => cartcontroller.deletethecart(productid),
    //                   icon: Icon(Icons.delete, color: Colors.red),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}
