import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/common/widgets/favtorie_icon.dart';
import 'package:hapticfone/features/store/models/productmodels.dart';
import 'package:hapticfone/responsive_screen/responsive_phone_details_screen.dart';
import 'package:hapticfone/utils/constants/images_strings.dart';
import 'package:hapticfone/utils/constants/sizes.dart';
import 'package:lottie/lottie.dart';

class Favouritebrands extends StatelessWidget {
  const Favouritebrands({
    super.key,
    required this.title,
    required this.items,
    this.isweb = false,
  });
  final String title;
  final List<Prouductmodels> items;
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarcustomized(title: title, centertile: false, fontsize: 20),
      body: Column(
        children: [
          items.isEmpty
              ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      AppAnimatons.sadanimation,
                      width: isweb ? 150.w : null,
                    ),
                    Text(
                      "No phones available for this brand.",
                      style: TextStyle(
                        fontSize: isweb ? 5.sp : 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
              : Padding(
                padding: EdgeInsets.all(10.0.r),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    child: GridView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final data = items[index];
                        return InkWell(
                          onTap: () {
                            Get.to(
                              ResponsivePhoneDetailsScreen(
                                id: data.id,
                                images: data.images,
                                phoneprice: data.price,
                                phonecondtion: data.condtion,
                                phonetile: data.mobilemodelname,
                                phoneimage: data.thumbnail,
                                phonebrand: data.brand,
                                phonecolor: data.color,
                                phoneram: data.ram,
                                phonestock: data.stock,
                                phonestorage: data.storage,
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
                                  children: [
                                    Favtorieicon(
                                      productid: data.id,
                                      isweb: isweb,
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 120.h,
                                  width: 500.w,
                                  child: Image.network(data.thumbnail),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  data.mobilemodelname,
                                  style: TextStyle(
                                    fontSize: isweb ? 4.sp : 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  data.condtion,
                                  style: TextStyle(
                                    fontSize: isweb ? 4.sp : 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "₹${data.price.toString()}",
                                  style: TextStyle(
                                    fontSize: isweb ? 3.sp : 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          isweb
                              ? SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 250,
                                crossAxisSpacing: 10,
                                childAspectRatio: 0.9,
                                mainAxisSpacing: 10,
                              )
                              : SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: Sizes.girdViewSpacing,
                                childAspectRatio: 0.75,
                              ),
                    ),
                  ),
                ),
              ),
        ],
      ),
    );
  }
}
