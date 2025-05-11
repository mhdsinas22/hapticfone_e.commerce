import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hapticfone/colors/appcolors.dart';
import 'package:hapticfone/controllers/bottomnavgtioncontroller.dart';
import 'package:hapticfone/screens/profile/profile.dart';
import 'package:hapticfone/screens/sell/chat_screen.dart';
import 'package:hapticfone/screens/sell/itemsadddetails/items_addscreen.dart';
import 'package:hapticfone/screens/sell/pickupscreen.dart';
import 'package:hapticfone/screens/sell/sell_home_screen.dart';

class CustombottmnavgbarForsellside extends StatelessWidget {
  CustombottmnavgbarForsellside({super.key});
  final bottmnavgitoncontroller = Get.put(Bottomnavgtioncontroller());
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
          child: Icon(Icons.add, size: 40),
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
                "asset/live-chat.png",
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
                "asset/delivery-location.png",
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
