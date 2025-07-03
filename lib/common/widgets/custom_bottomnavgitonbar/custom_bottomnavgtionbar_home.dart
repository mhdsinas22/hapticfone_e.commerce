import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/features/store/controllers/bottom_navigation_controller.dart';

class CustomBottomnavgtionbarhome extends StatelessWidget {
  const CustomBottomnavgtionbarhome({super.key, this.selectedindex = 0});
  final int selectedindex;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Bottomnavgtioncontroller>(
      init: Bottomnavgtioncontroller(selectedindex),
      builder: (controller) {
        return Scaffold(
          body: controller.pages[controller.selectedindex.value],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            selectedItemColor:
                controller.selectedindex.value == 1
                    ? Colors.red
                    : Appcolors.appbuttongreen,
            onTap: (index) {
              controller.changedtab(index);
            },
            currentIndex: controller.selectedindex.value,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color:
                      controller.selectedindex.value == 1
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
                    controller.selectedindex == 3
                        ? Appcolors.appbuttongreen
                        : Colors.grey,
                    BlendMode.srcIn,
                  ),
                  child: Image.asset("assets/box (2).png", width: 22),
                ),
                label: "Order",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        );
      },
    );
  }
}
