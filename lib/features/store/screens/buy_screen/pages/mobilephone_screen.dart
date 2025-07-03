import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/common/widgets/phone_card.dart';

class MobilephoneScreen extends StatelessWidget {
  const MobilephoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbarcustomized(
        title: "Mobile Phones",
        centertile: false,
        fontsize: 20.sp,
      ),
      body: SingleChildScrollView(child: Column(children: [PhoneCard()])),
    );
  }
}
