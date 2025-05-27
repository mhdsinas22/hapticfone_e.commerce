import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/dropdownwidget.dart';
import 'package:hapticfone/controllers/dropdowncontroller.dart';
import 'package:hapticfone/controllers/radiocontroller.dart';
import 'package:hapticfone/screens/adderss_section/address_controller.dart';
import 'package:hapticfone/utils/validators/validator.dart';

class Addresstextformfiled extends StatelessWidget {
  const Addresstextformfiled({
    super.key,
    this.fullname = "",
    this.pincode = "",
    this.phonenumber = "",
    this.address = "",
    this.city = "",
    this.landmarl = "",
    this.saveas = "",
    this.state = "",
  });
  final String fullname;
  final String pincode;
  final String phonenumber;
  final String address;
  final String city;
  final String state;
  final String landmarl;
  final String saveas;

  @override
  Widget build(BuildContext context) {
    final addrescontroller = Get.put(Addresscontroller());
    final dropdowncontroller = Get.put(Dropdowncontroller());
    final radiocontroller = Get.put(Radiocontroller());
    addrescontroller.fullnamecontroller.text = fullname;
    addrescontroller.pincodetexteditingcontroller.text = pincode;
    addrescontroller.phonetexteditcontroller.text = phonenumber;
    addrescontroller.addrestexteditingcontroller.text = address;
    addrescontroller.citycontrooller.text = city;
    dropdowncontroller.selectedvalue.value = state;
    addrescontroller.landmarkcontroller.text = landmarl;
    radiocontroller.selectedvalue.value = saveas;
    return Form(
      key: addrescontroller.formkey,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.r),
            child: TextFormField(
              validator:
                  (value) =>
                      Validator.validateEmptyText("Enter the Pincode", value),
              controller: addrescontroller.pincodetexteditingcontroller,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: "Enter Pincode ",
                labelStyle: TextStyle(fontSize: 12.sp, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: TextFormField(
              validator:
                  (value) =>
                      Validator.validateEmptyText("Enter the FullName", value),
              controller: addrescontroller.fullnamecontroller,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: "Full Name",
                labelStyle: TextStyle(fontSize: 12.sp, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: TextFormField(
              validator: (value) => Validator.validatePhoneNumber(value),
              controller: addrescontroller.phonetexteditcontroller,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: "Phone Number",
                labelStyle: TextStyle(fontSize: 12.sp, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: TextFormField(
              validator:
                  (value) => Validator.validateEmptyText(
                    "Required the Address",
                    value,
                  ),
              controller: addrescontroller.addrestexteditingcontroller,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: "Address",
                labelStyle: TextStyle(fontSize: 12.sp, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.r),
            child: TextFormField(
              validator:
                  (value) =>
                      Validator.validateEmptyText("Required the City", value),
              controller: addrescontroller.citycontrooller,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: "City",
                labelStyle: TextStyle(fontSize: 12.sp, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => DropdownWidget(
                validator:
                    (value) =>
                        Validator.validateEmptyText("Select your state", value),
                values:
                    dropdowncontroller.selectedvalue.value.isEmpty
                        ? null
                        : dropdowncontroller.selectedvalue.value,
                hinttext: "Select the State",
                items:
                    dropdowncontroller.stateitems
                        .map(
                          (String items) => DropdownMenuItem<String>(
                            value: items,
                            child: Text(items),
                          ),
                        )
                        .toList(),
                onchanged: (value) {
                  dropdowncontroller.changethevaluebrand(value);
                },
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(8.r),
            child: TextFormField(
              validator:
                  (value) =>
                      Validator.validateEmptyText("Required Landmark", value),
              controller: addrescontroller.landmarkcontroller,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                labelText: "LandMark",
                labelStyle: TextStyle(fontSize: 12.sp, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
