import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/common/widgets/phone_favotire.dart';
import 'package:hapticfone/features/store/controllers/favourite_controller.dart';
import 'package:hapticfone/utils/constants/sizes.dart';

class WebFavorite extends StatelessWidget {
  const WebFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Favouritecontrollwe());

    return Scaffold(
      appBar: Appbarcustomized(title: "Favorites"),
      body: Obx(
        () => FutureBuilder(
          future: controller.favoriteproducts(),
          builder: (context, snapshot) {
            // Loading state
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            // // Error state
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            // Data state
            final products = snapshot.data;

            if (products == null || products.isEmpty) {
              return Center(child: Text("NO FAVORITE PRODUTS"));
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  child: GridView.builder(
                    itemCount: products.length,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 180,
                      mainAxisSpacing: Sizes.girdViewSpacing,
                      crossAxisSpacing: Sizes.girdViewSpacing,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      return PhoneFav(prodxt: products[index], isweb: true);
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
