import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/colors/appcolors.dart';
import 'package:hapticfone/controllers/bottomnavgtioncontroller.dart';
import 'package:hapticfone/screens/buy/cart.dart';
import 'package:hapticfone/screens/buy/favorite.dart';
import 'package:hapticfone/screens/buy/home.dart';
import 'package:hapticfone/screens/buy/order.dart';
import 'package:hapticfone/screens/profile/profile.dart';

class CustomBottomnavgtionbarhome extends StatelessWidget {
  CustomBottomnavgtionbarhome({super.key});
  final Bottomnavgtioncontroller bottomcontroller = Get.put(
    Bottomnavgtioncontroller(),
  );
  final List<Widget> pages = [
    Homescreen(),
    Favorite(),
    Cart(),
    Order(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[bottomcontroller.selectedindex.value],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor:
              bottomcontroller.selectedindex == 1
                  ? Colors.red
                  : Appcolors.appbuttongreen,
          onTap: bottomcontroller.changedtab,
          currentIndex: bottomcontroller.selectedindex.value,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color:
                    bottomcontroller.selectedindex == 1
                        ? Colors.red
                        : Colors.grey,
              ),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  // ignore: unrelated_type_equality_checks
                  bottomcontroller.selectedindex == 3
                      ? Appcolors.appbuttongreen
                      : Colors.grey,
                  BlendMode.srcIn,
                ),
                child: Image.asset("asset/box (2).png", width: 22),
              ),
              label: "Order",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
