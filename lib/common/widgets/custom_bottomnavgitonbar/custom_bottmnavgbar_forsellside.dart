import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/features/store/controllers/bottom_navigation_controller.dart';
import 'package:hapticfone/features/store/screens/profile/profile.dart';
import 'package:hapticfone/features/store/screens/sell_screen/chat_screen.dart';
import 'package:hapticfone/features/store/screens/sell_screen/itemsadddetails/items_addscreen.dart';
import 'package:hapticfone/features/store/screens/sell_screen/pickupscreen.dart';
import 'package:hapticfone/features/store/screens/sell_screen/sell_home_screen.dart';

class CustombottmnavgbarForsellside extends StatelessWidget {
  CustombottmnavgbarForsellside({super.key});

  final bottmnavgitoncontroller = Get.put(Bottomnavgtioncontroller(0));
  final List<Widget> pages = [
    Sellhomescreen(),
    ChatScreen(),
    ItemsAddscreen(),
    PickupScreen(),
    Profile(sellprofile: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () => Get.to(() => ItemsAddscreen()),
          shape: CircleBorder(
            side: BorderSide(color: Appcolors.appbuttongreen),
          ),
          child: Icon(Icons.add, size: 40, color: Appcolors.black),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: pages[bottmnavgitoncontroller.selectedindex.value],
        bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          type: BottomNavigationBarType.fixed,
          onTap: (value) {
            if (value != 2) {
              bottmnavgitoncontroller.changedtab(value);
            }
          },
          selectedItemColor: Appcolors.appbuttongreen,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          currentIndex: bottmnavgitoncontroller.selectedindex.value,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/live-chat.png",
                width: 50.w,
                height: 22.h,
                color:
                    bottmnavgitoncontroller.selectedindex.value == 1
                        ? Appcolors.appbuttongreen
                        : Colors.black,
              ),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.abc_outlined),
              label: "Sell",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                "assets/delivery-location.png",
                width: 50.w,
                height: 22.h,
                color:
                    bottmnavgitoncontroller.selectedindex.value == 3
                        ? Appcolors.appbuttongreen
                        : Colors.black,
              ),
              label: "Pickup",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
