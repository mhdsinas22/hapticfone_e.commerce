import 'package:flutter/material.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';

class Choicechipcustomized extends StatelessWidget {
  const Choicechipcustomized({
    super.key,
    this.selectedcolor = Appcolors.black,
    this.onselected,
    this.selectd = false,
    this.color,
    this.text = "",
  });
  final Color selectedcolor;
  final String text;
  final ValueChanged<bool>? onselected;
  final Color? color;
  final bool selectd;
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      labelStyle: TextStyle(color: color),
      selectedColor: selectedcolor,
      backgroundColor: Appcolors.lightgrey,
      showCheckmark: false,
      label: Text(text),
      selected: selectd,
      onSelected: onselected,
    );
  }
}
