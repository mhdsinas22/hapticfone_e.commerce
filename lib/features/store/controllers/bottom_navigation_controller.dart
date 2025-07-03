import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/responsive_screen/resnpovse_home_screen.dart';
import 'package:hapticfone/responsive_screen/responsive_cart_screen.dart';
import 'package:hapticfone/responsive_screen/responsive_favorite_screen.dart';

import 'package:hapticfone/responsive_screen/responsive_order_screen.dart';
import 'package:hapticfone/responsive_screen/responsive_profile_screen.dart';

class Bottomnavgtioncontroller extends GetxController {
  var selectedindex = 0.obs;
  final List<Widget> pages = [
    ResnpovseHomeScreen(),
    ResponsiveFavoriteScreen(),
    ResponsiveCartScreen(),
    ResponsiveOrderScreen(),
    ResponsiveProfileScreen(),
  ];
  Bottomnavgtioncontroller(int index) {
    selectedindex.value = index;
  }
  void changedtab(int index) {
    selectedindex.value = index;
    update();
  }
}
