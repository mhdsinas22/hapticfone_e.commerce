import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/styles/texts/bold_text.dart';
import 'package:hapticfone/common/widgets/textbutton_customized.dart';
import 'package:hapticfone/features/store/screens/adderss_section/addadderss_formscreen.dart';
import 'package:hapticfone/features/store/screens/adderss_section/address_controller.dart';
import 'package:hapticfone/responsive_screen/responsive_address_screen.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';

class Addresstext extends StatelessWidget {
  const Addresstext({
    super.key,
    this.width = 300,
    this.selectedaddress = true,
    this.isweb = false,
    this.height = 200,
  });
  final double width, height;
  final bool selectedaddress;
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    final addresscontroller = Get.put(Addresscontroller());
    return Obx(() {
      if (addresscontroller.addresslist.isEmpty) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Get.to(() => AddadderssFormscreen());
              },
              child: TextbuttonCustomized(
                width: 350,
                heigth: isweb ? 80 : 50,
                text: "Add a new Address",
                textStyle: TextStyle(
                  fontSize: isweb ? 8.sp : 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                onpressed: () => Get.to(() => ResponsiveAddressScreen()),
                boxDecoration: BoxDecoration(
                  color: Appcolors.mygreen,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        );
      } else {
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: addresscontroller.filtredselecteditems.length,
          itemBuilder: (context, index) {
            var item = addresscontroller.addressforselected[index];

            return Material(
              borderRadius: BorderRadius.circular(10.r),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                width: width.w,
                height: height.h,

                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Boldtext(
                            text: "Order Address",
                            size: isweb ? 1.sp : 15.sp,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Boldtext(
                                text: "Name:${item.fullname}",
                                size: isweb ? 4 : 13,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Boldtext(
                                  text: "Address:${item.addresss}",
                                  size: isweb ? 4 : 13,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Boldtext(
                                  text: "LandMark:${item.landmark}",
                                  size: isweb ? 4 : 13,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Boldtext(
                                  text: "State:${item.state}",
                                  size: isweb ? 4 : 13,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: Boldtext(
                                  text: "Ph:${item.phonenumber}",
                                  size: isweb ? 4 : 12,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Boldtext(
                                  text: "PinCode:${item.pincode}",
                                  size: isweb ? 4 : 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }
    });
  }
}
