import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/common/widgets/textbutton_customized.dart';

class BottomnavgtiontwoItens extends StatelessWidget {
  const BottomnavgtiontwoItens({
    super.key,
    required this.textbuttontext1,
    required this.textbuttontext2,
    required this.onpressed1,
    required this.onpressed2,
    this.iscomplted = false,
    this.textcolor = Colors.white,
    this.bordercolr = Appcolors.appbuttongreen,
    this.buttomcolr = Appcolors.appbuttongreen,
    this.isweb = false,
  });
  final String textbuttontext1;
  final String textbuttontext2;
  final VoidCallback onpressed1;
  final VoidCallback onpressed2;
  final Color textcolor;
  final Color bordercolr;
  final Color buttomcolr;
  final bool iscomplted;
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      height: 60.h,
      width: 200.w,
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Row(
          mainAxisAlignment:
              iscomplted
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.spaceEvenly,
          children: [
            TextbuttonCustomized(
              width: isweb ? 100 : 138,
              heigth: isweb ? 300 : 50,
              boxDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Appcolors.fontcolourgreen),
                color: Colors.white,
              ),
              text: textbuttontext1,
              onpressed: onpressed1,
              textStyle: TextStyle(
                color: Appcolors.appbuttongreen,
                fontWeight: FontWeight.bold,
                fontSize: isweb ? 4.sp : 10.sp,
              ),
            ),
            iscomplted
                ? Container()
                : TextbuttonCustomized(
                  width: isweb ? 100 : 138,
                  heigth: isweb ? 300 : 55,
                  boxDecoration: BoxDecoration(
                    border: Border.all(color: bordercolr),
                    borderRadius: BorderRadius.circular(10),
                    color: buttomcolr,
                  ),
                  text: textbuttontext2,
                  onpressed: onpressed2,
                  textStyle: TextStyle(
                    color: textcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: isweb ? 4.sp : 10.sp,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
