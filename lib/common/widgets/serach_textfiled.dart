import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';

class SerachTextfiled extends StatelessWidget {
  final String labeltext;
  final Icon? prefix;
  final IconButton? sufficxicon;
  final ValueChanged? onchaned;
  final FocusNode? focusnode;
  final TextEditingController? controller;
  const SerachTextfiled({
    super.key,
    required this.labeltext,
    this.prefix,
    this.onchaned,
    this.focusnode,
    this.sufficxicon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusnode,
      onChanged: onchaned,
      decoration: InputDecoration(
        hintStyle: TextStyle(color: Appcolors.chipcolor),
        hintText: "Serach the Mobile",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolors.black),
          borderRadius: BorderRadius.circular(12.r),
        ),
        prefixIcon: prefix,
        suffixIcon: sufficxicon,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolors.black),
          borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}
