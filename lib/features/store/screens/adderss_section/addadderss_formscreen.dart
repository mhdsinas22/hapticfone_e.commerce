import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/common/widgets/textbutton_customized.dart';
import 'package:hapticfone/features/store/controllers/radio_controller.dart';
import 'package:hapticfone/features/store/screens/adderss_section/address_controller.dart';
import 'package:hapticfone/features/store/screens/adderss_section/address_textformfiled.dart';
import 'package:lottie/lottie.dart';

class AddadderssFormscreen extends StatelessWidget {
  const AddadderssFormscreen({
    super.key,
    this.iseditscreen = false,
    this.id = "",
    this.fullname = "",
    this.pincode = "",
    this.phonenumber = "",
    this.address = "",
    this.city = "",
    this.landmarl = "",
    this.saveas = "",
    this.state = "",
  });
  final bool iseditscreen;
  final String fullname;
  final String pincode;
  final String phonenumber;
  final String address;
  final String city;
  final String state;
  final String landmarl;
  final String saveas;
  final String id;

  @override
  Widget build(BuildContext context) {
    final addressconroller = Get.put(Addresscontroller());
    final radiocontroller = Get.put(Radiocontroller());
    return Scaffold(
      backgroundColor: Appcolors.white,
      appBar:
          addressconroller.isLoading.value
              ? AppBar()
              : Appbarcustomized(
                title: iseditscreen ? "Edit the Address" : "Add New Address",
                centertile: false,
                fontsize: 20.sp,
              ),
      body: Center(
        child: SingleChildScrollView(
          child: Obx(() {
            if (addressconroller.isLoading.value) {
              return Column(
                children: [Lottie.asset("assets/animations/loading.json")],
              );
            }

            return Column(
              children: [
                SizedBox(height: 10.h),
                InkWell(
                  onTap: () {},
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(20.r),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.gps_fixed_outlined),
                            SizedBox(width: 8.w),
                            Text(
                              "Use my current location",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
                Divider(height: 1.h, color: Appcolors.black, thickness: 1),
                Addresstextformfiled(
                  fullname: fullname,
                  pincode: pincode,
                  address: address,
                  city: city,
                  landmarl: landmarl,
                  phonenumber: phonenumber,
                  saveas: saveas,
                  state: state,
                ),
                Padding(
                  padding: EdgeInsets.all(12.r),
                  child: Row(
                    children: [
                      SizedBox(width: 10.w),
                      Text(
                        "Save As",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Obx(
                          () => Radio<String>(
                            value: "Home",
                            groupValue: radiocontroller.selectedvalue.value,
                            onChanged: (value) {
                              radiocontroller.setvalue(value!);
                            },
                            activeColor: Appcolors.mygreen,
                            hoverColor: Appcolors.mygreen,
                          ),
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Obx(
                          () => Radio<String>(
                            value: "Office",
                            groupValue: radiocontroller.selectedvalue.value,
                            onChanged: (value) {
                              radiocontroller.setvalue(value!);
                            },
                            activeColor: Appcolors.mygreen,
                            hoverColor: Appcolors.mygreen,
                          ),
                        ),
                        Text(
                          "Office",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        Obx(
                          () => Radio<String>(
                            value: "Other",
                            groupValue: radiocontroller.selectedvalue.value,
                            onChanged: (value) {
                              radiocontroller.setvalue(value!);
                            },
                            activeColor: Appcolors.mygreen,
                            hoverColor: Appcolors.mygreen,
                          ),
                        ),
                        Text(
                          "Other",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                InkWell(
                  onTap:
                      () =>
                          iseditscreen
                              ? addressconroller.edittheaddress(id)
                              : addressconroller.addaddresstofirebase(),
                  child: TextbuttonCustomized(
                    boxDecoration: BoxDecoration(color: Appcolors.mygreen),
                    width: MediaQuery.sizeOf(context).width,
                    heigth: 54.h,
                    text: iseditscreen ? "Edit Address" : "Add Address",
                    onpressed:
                        () =>
                            iseditscreen
                                ? addressconroller.edittheaddress(id)
                                : addressconroller.addaddresstofirebase(),
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
