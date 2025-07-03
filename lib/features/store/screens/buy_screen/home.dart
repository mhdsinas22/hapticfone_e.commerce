import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/styles/texts/bold_text.dart';
import 'package:hapticfone/common/widgets/carsoual_silderr.dart';
import 'package:hapticfone/features/store/screens/buy_screen/pages/favouritebrands/favorite_brands_section.dart';
import 'package:hapticfone/features/store/screens/sell_screen/sell_home_screen.dart';
import 'package:hapticfone/responsive_screen/responsive_mobilephone_screen.dart';
import 'package:hapticfone/responsive_screen/responsive_smartwatches_screen.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/common/widgets/container/rectangle_container.dart';
import 'package:hapticfone/common/widgets/custom_elveationbutton.dart';
import 'package:hapticfone/common/widgets/phone_card.dart';
import 'package:hapticfone/features/store/screens/serach/search_screen.dart';

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
                  Get.off(() => Sellhomescreen());
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

            CarsoualSilderr(
              isneedasset: true,
              images: ["assets/PHONE-01.jpg", "assets/i phone-02.jpg"],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () => Get.to(() => ResponsiveMobilephoneScreen()),
                      child: Container(
                        width: 129.4.w,
                        height: 113.55.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Image.asset(
                          "assets/6.png",
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
                      onTap: () => Get.to(() => ResponsiveSmartwatchesScreen()),
                      child: Container(
                        width: 132.w,
                        height: 115.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Image.asset(
                          "assets/5.png",
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
                  child: Boldtext(text: "Favourite Brands", size: 16),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FavoriteBrandsSection(),
            ),
            PhoneCard(),
          ],
        ),
      ),
    );
  }
}
