import 'package:flutter/material.dart';
import 'package:hapticfone/utils/constants/sizes.dart';

class SpacingStyles {
  static const EdgeInsetsGeometry paddingwithappbarheight = EdgeInsets.only(
    top: Sizes.appbarHeigth,
    bottom: Sizes.defaultSpace,
    right: Sizes.defaultSpace,
    left: Sizes.defaultSpace,
  );
  static const EdgeInsetsGeometry paddingwithoutappbarheight = EdgeInsets.only(
    top: 10,
    bottom: Sizes.defaultSpace,
    right: Sizes.defaultSpace,
    left: Sizes.defaultSpace,
  );
}
