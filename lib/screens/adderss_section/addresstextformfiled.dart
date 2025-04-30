import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Addresstextformfiled extends StatelessWidget {
  const Addresstextformfiled({super.key});

  @override
  Widget build(BuildContext context) {
    var item = [
      "Andhra Pradesh",
      "Arunachal Pradesh",
      "Assam",
      "Bihar",
      "Chhattisgarh",
      "Goa",
      " Gujarat",
      "Haryana",
      "Himachal Pradesh",
      "Jharkhand",
      " Karnataka",
      "Kerala",
      " Madhya Pradesh",
      "Maharashtra",
      "Manipur",
      "Meghalaya",
      "Mizoram",
      " Nagaland",
      "Odisha",
      "Punjab",
      "Rajasthan",
      "Sikkim",
      "Tamil Nadu",
      "Telangana",
      "Tripura",
      " Uttar Pradesh",
      "Uttarakhand",
      "West Bengal",
    ];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(12.r),
          child: TextFormField(
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
          child: DropdownButton(
            menuMaxHeight: 300.h,
            elevation: 10,
            dropdownColor: Colors.white,
            isExpanded: true,
            items:
                item.map((String items) {
                  return DropdownMenuItem(value: items, child: Text(items));
                }).toList(),
            onChanged: (value) {},
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.r),
          child: TextFormField(
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
    );
  }
}
