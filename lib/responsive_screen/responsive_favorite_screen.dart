import 'package:flutter/material.dart';
import 'package:hapticfone/features/store/screens/buy_screen/favorite.dart';
import 'package:hapticfone/web_screens/web_favorite.dart';

class ResponsiveFavoriteScreen extends StatelessWidget {
  const ResponsiveFavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 600) {
          return Favorite();
        } else {
          return WebFavorite();
        }
      },
    );
  }
}
