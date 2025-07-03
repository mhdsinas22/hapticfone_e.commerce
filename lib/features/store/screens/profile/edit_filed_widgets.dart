import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/features/authentication/controllers/updatename_controller.dart';
import 'package:hapticfone/utils/constants/validator.dart';

class EidtfiledWidgets extends StatelessWidget {
  const EidtfiledWidgets({super.key, this.isweb = false});
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    final controllerupdate = Get.put(UpdateUserdetailsController());
    final updateusercontrooler = Get.put(UpdateUserdetailsController());
    return Form(
      key: controllerupdate.updateform,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(width: isweb ? 5.w : 25.w),
              Text(
                "NAME",
                style: TextStyle(
                  fontSize: isweb ? null : 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12.r),
            child: SizedBox(
              child: TextFormField(
                validator:
                    (value) => Validator.validateEmptyText("NAME", value),
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: isweb ? null : 20.sp,
                  fontWeight: FontWeight.bold,
                ),
                controller: updateusercontrooler.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  filled: true,
                  fillColor: Colors.grey[400],
                ),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(width: isweb ? 5.w : 25.w),
              Text(
                "PHONE NUMBER",
                style: TextStyle(
                  fontSize: isweb ? null : 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12.r),
            child: TextFormField(
              validator:
                  (value) => Validator.validateEmptyText("PHONE NUMBER", value),
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: isweb ? null : 20.sp,
                fontWeight: FontWeight.bold,
              ),
              controller: updateusercontrooler.phonenumber,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                filled: true,
                fillColor: Colors.grey[400],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
