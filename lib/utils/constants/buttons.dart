import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/common/styles/texts/bold_text.dart';
import 'package:hapticfone/common/widgets/container/rectangle_container.dart';
import 'package:hapticfone/common/widgets/textbutton_customized.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';

class Buttons {
  static RectangleContainer inactivebutton(String text, bool isweb) {
    return RectangleContainer(
      heigth: 52,
      width: 200,
      boxDecoration: BoxDecoration(color: Appcolors.appgrey),
      child: Center(
        child: Boldtext(
          text: text,
          size: isweb ? 2.sp : 20,
          colors: Appcolors.chipfontcolor,
        ),
      ),
    );
  }

  static TextbuttonCustomized activeButton(
    String text,
    VoidCallback onpressed,
    bool isweb,
  ) {
    return TextbuttonCustomized(
      heigth: 52,
      width: 200,
      text: text,
      onpressed: onpressed,
      textStyle: TextStyle(
        fontSize: isweb ? 10.sp : 20.sp,
        color: Colors.white,
      ),
      boxDecoration: BoxDecoration(color: Appcolors.appbuttongreen),
    );
  }
}
