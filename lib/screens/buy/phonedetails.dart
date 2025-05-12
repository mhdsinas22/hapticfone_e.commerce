import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/colors/appcolors.dart';
import 'package:hapticfone/controllers/carsoulcircularcontainercontroller.dart';
import 'package:hapticfone/widgets/container/tcircularcontainer.dart';
import 'package:hapticfone/widgets/carsoual_silderr.dart';
import 'package:hapticfone/widgets/container/image_container.dart';
import 'package:hapticfone/widgets/phone_specifications.dart';

class Phonedetails extends StatelessWidget {
  final List<dynamic> images;
  final String phonetile;
  final String phoneimage;
  final String phoneram;
  final String phonestorage;
  final String phonebrand;
  final String phonecolor;
  final int phonestock;
  final String phonecondtion;
  final double phoneprice;
  const Phonedetails({
    super.key,
    required this.phonetile,
    required this.phoneimage,
    required this.phonebrand,
    required this.phonecolor,
    required this.phoneram,
    required this.phonestock,
    required this.phonestorage,
    required this.phonecondtion,
    required this.phoneprice,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Carsoulcircularcontainercontroller());
    return Scaffold(
      bottomNavigationBar: Material(
        elevation: 100,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.2),
                blurRadius: 15.r,
                spreadRadius: 1.r,
                offset: Offset(1, 0),
              ),
            ],
          ),
          width: 415,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "₹${phoneprice.toInt()}",
                style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 100.w),
              InkWell(
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      backgroundColor: Colors.white,
                      content: SizedBox(
                        width: 350,
                        height: 252,
                        child: Column(
                          children: [
                            Image.asset(
                              "asset/checked.png",
                              width: 93,
                              height: 93,
                              color: Color(0xffB4D97A),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Added To Cart!",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
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
                },
                child: Container(
                  width: 140.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_shopping_cart, color: Colors.black),
                      Text(
                        "Add to cart",
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(phonetile),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(12.sp),
          child: Container(color: Colors.black, height: 1.h),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_outline, size: 35.sp),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add_shopping_cart, size: 25.sp),
          ),
          SizedBox(width: 15.w),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 216, 246, 180),
              height: 339.h,

              child: CarsoualSilderr(images: images),
            ),
            SizedBox(height: 10),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < images.length; i++)
                    TCircularContainer(
                      margin: EdgeInsets.all(4),
                      padding: 1,
                      backgroundcolor:
                          // ignore: unrelated_type_equality_checks
                          controller.carsoulcircularcontainerindex == i
                              ? Colors.black
                              : Colors.grey,
                      width: 20,
                      height: 4,
                    ),
                ],
              ),
            ),
            Obx(
              () => SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < images.length; i++)
                      Image_container(
                        boxDecoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color:
                                // ignore: unrelated_type_equality_checks
                                controller.carsoulcircularcontainerindex == i
                                    ? Appcolors.appbuttongreen
                                    : Colors.black,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        backgroundcolor: Colors.white,
                        brandimage: Image.network(images[i]),
                      ),
                  ],
                ),
              ),
            ),
            Text(
              "$phonetile - $phonecondtion",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                SizedBox(width: 65.w),
                Text(
                  "₹${phoneprice.toInt()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.sp,
                  ),
                ),
              ],
            ),
            PhoneSpecifications(
              phonebrand: phonebrand,
              phonecolor: phonecolor,
              phoneram: phoneram,
              phonestock: phonestock.toString(),
              phonestorage: phonestorage,
            ),
          ],
        ),
      ),
    );
  }
}
