import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hapticfone/controllers/bottomnavgtioncontroller.dart';
import 'package:hapticfone/screens/sell/chat_screen.dart';
import 'package:hapticfone/screens/sell/items_addscreen.dart';
import 'package:hapticfone/screens/sell/sell_home_screen.dart';

class CustombottmnavgbarForsellside extends StatelessWidget {
  CustombottmnavgbarForsellside({super.key});
  final bottmnavgitoncontroller = Get.put(Bottomnavgtioncontroller());
  final List<Widget> pages = [Sellhomescreen(), ChatScreen(), ItemsAddscreen()];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: pages[bottmnavgitoncontroller.selectedindex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottmnavgitoncontroller.selectedindex.value,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home)),
            BottomNavigationBarItem(icon: Icon(Icons.chat)),
            BottomNavigationBarItem(icon: Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}
