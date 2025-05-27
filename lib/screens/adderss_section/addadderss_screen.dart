import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/styles/colors/appcolors.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/common/widgets/container/rectangle_container.dart';
import 'package:hapticfone/common/widgets/styles/colors/snackbar.dart';
import 'package:hapticfone/common/widgets/textbutton_customized.dart';
import 'package:hapticfone/common/widgets/styles/colors/texts/boldtext.dart';
import 'package:hapticfone/screens/adderss_section/addadderss_formscreen.dart';
import 'package:hapticfone/screens/adderss_section/address_controller.dart';
import 'package:hapticfone/screens/adderss_section/selectedaddressui.dart';

class AddadderssScreen extends StatelessWidget {
  const AddadderssScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addresscontroller = Get.put(Addresscontroller());
    return Scaffold(
      appBar: Appbarcustomized(title: "ADDRESS", centertile: false),
      body: Column(
        children: [
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextbuttonCustomized(
                width: 300,
                heigth: 70,
                text: "Add a new Address",
                textStyle: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
                onpressed: () => Get.to(() => AddadderssFormscreen()),
                boxDecoration: BoxDecoration(
                  color: Appcolors.mygreen,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Row(
              children: [
                SizedBox(width: 10.w),
                Boldtext(size: 20, text: "MANGE ADDRESS"),
              ],
            ),
          ),
          Obx(() {
            final data = addresscontroller.addresslist;

            if (data.isEmpty) {
              return Center(child: Text("NO DATA FOUND"));
            }

            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        print("Working");
                        addresscontroller.deleteaddress(data[index]);
                        Snackbar.waringsnakbar("Deleted", "Address Removed");
                      } else {
                        Get.to(
                          AddadderssFormscreen(
                            iseditscreen: true,
                            id: data[index].id,
                            fullname: data[index].fullname,
                            pincode: data[index].pincode.toString(),
                            address: data[index].addresss,
                            city: data[index].city,
                            landmarl: data[index].landmark,
                            phonenumber: data[index].phonenumber.toString(),
                            saveas: data[index].saveas,
                            state: data[index].state,
                          ),
                        );
                        data.removeAt(index);
                      }
                    },
                    background: Padding(
                      padding: EdgeInsets.all(12.r),
                      child: RectangleContainer(
                        boxDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        width: 347,
                        heigth: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.edit, color: Colors.white),
                            SizedBox(width: 200.w),
                          ],
                        ),
                      ),
                    ),
                    secondaryBackground: Padding(
                      padding: EdgeInsets.all(12.r),
                      child: RectangleContainer(
                        boxDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                        width: 347,
                        heigth: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(width: 200.w),
                            Icon(Icons.delete, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                    key: Key(index.toString()),
                    child: Selectedaddressui(
                      ontap: () {
                        addresscontroller.selectAddress(data[index]);
                      },
                      address: data[index],
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
