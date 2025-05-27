import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/styles/colors/appcolors.dart';
import 'package:hapticfone/common/widgets/container/brand_container.dart';
import 'package:hapticfone/common/widgets/container/rectangle_container.dart';
import 'package:hapticfone/common/widgets/custom_bottomnavgitonbar/custombottmnavgbar_forsellside.dart';
import 'package:hapticfone/common/widgets/custom_elveationbutton.dart';
import 'package:hapticfone/common/widgets/phone_card.dart';
import 'package:hapticfone/common/widgets/styles/colors/texts/brand_text.dart';
import 'package:hapticfone/screens/buy/mobilephone_screen.dart';
import 'package:hapticfone/screens/buy/serach/search_screen.dart';
import 'package:hapticfone/screens/buy/smartwatches_scrrem.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.h),
          child: Container(color: Colors.black, height: 1.h),
        ),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElveationbutton(
                text: "Buy",
                onPressed: () {},
                backgroundcolor: Appcolors.appbuttongreen,
                forgroundcolor: Colors.white,
              ),
              SizedBox(width: 10),
              CustomElveationbutton(
                text: "Sell",
                onPressed: () {
                  Get.off(CustombottmnavgbarForsellside());
                },
                backgroundcolor: Colors.grey[400],
                forgroundcolor: Colors.black,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(height: 18.h),
            InkWell(
              onTap:
                  () => Get.to(
                    SearchScreen(),
                    transition: Transition.leftToRight,
                  ),
              child: RectangleContainer(
                width: 350,
                heigth: 50,
                boxDecoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                //    InputDecoration(
                //     prefixIcon: Icon(Icons.search),
                //     label: Text("Search for mobiles,accessories & More"),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.all(Radius.circular(12)),
                //     ),
                //   ),
                // ),
                child: Row(
                  children: [
                    SizedBox(width: 8.w),
                    Icon(Icons.search),
                    SizedBox(width: 8.w),
                    Text("Search for mobiles,accessories & More"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.r),
              child: Image.asset("asset/4.jpeg"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () => Get.to(() => MobilephoneScreen()),
                      child: Container(
                        width: 129.4.w,
                        height: 113.55.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Image.asset(
                          "asset/6.png",
                          width: 97.11.w,
                          height: 97.11.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text("Mobile phones"),
                  ],
                ),
                SizedBox(width: 10.w),
                Column(
                  children: [
                    InkWell(
                      onTap: () => Get.to(() => SmartwatchesScrrem()),
                      child: Container(
                        width: 132.w,
                        height: 115.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Image.asset(
                          "asset/5.png",
                          width: 60.w,
                          height: 60.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text("Smart Watches"),
                  ],
                ),
              ],
            ),

            Row(
              children: [
                SizedBox(width: 10),
                Padding(
                  padding: EdgeInsets.all(4.r),
                  child: Text(
                    "Favourite Brands",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 10.w),
                      BrandContainer(
                        boxDecoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        brandimage: Image.asset("asset/7.png"),
                      ),
                      SizedBox(width: 10.w),
                      BrandContainer(brandimage: Image.asset("asset/8.png")),
                      SizedBox(width: 10.w),
                      BrandContainer(brandimage: Image.asset("asset/9.png")),
                      SizedBox(width: 10.w),
                      BrandContainer(brandimage: Image.asset("asset/10.png")),
                      SizedBox(width: 10),
                      BrandContainer(brandimage: Image.asset("asset/11.png")),
                      SizedBox(width: 10),
                      BrandContainer(brandimage: Image.asset("asset/12.png")),
                      SizedBox(width: 10),
                      BrandContainer(brandimage: Image.asset("asset/13.png")),
                      SizedBox(width: 10),
                      BrandContainer(brandimage: Image.asset("asset/14.png")),
                      SizedBox(width: 10),
                      BrandContainer(brandimage: Image.asset("asset/15.png")),
                      SizedBox(width: 10),
                      BrandContainer(brandimage: Image.asset("asset/16.png")),
                      SizedBox(width: 50.w),
                    ],
                  ),
                  Row(
                    children: [
                      // SizedBox(width: 5),
                      BrandText(startingfrom: "Starting From", price: "₹4999"),
                      BrandText(startingfrom: "Starting From", price: "₹1499"),
                      BrandText(startingfrom: "Starting From", price: "₹2499"),
                      BrandText(startingfrom: "Starting From", price: "₹1999"),
                      BrandText(startingfrom: "Starting From", price: "₹2999"),
                      BrandText(startingfrom: "Starting From", price: "₹1499"),
                      BrandText(startingfrom: "Starting From", price: "₹1499"),
                      BrandText(startingfrom: "Starting From", price: "₹1499"),
                      BrandText(startingfrom: "Starting From", price: "₹4499"),
                      BrandText(startingfrom: "Starting From", price: "₹1499"),
                    ],
                  ),
                ],
              ),
            ),

            PhoneCard(),
          ],
        ),
      ),
    );
  }
}
