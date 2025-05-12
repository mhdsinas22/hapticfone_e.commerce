import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:hapticfone/screens/buy/phonedetails.dart';

class PhoneCard extends StatelessWidget {
  const PhoneCard({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("products").snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.all(10.0.r),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                child: GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  children:
                      snapshot.data!.docs.map((data) {
                        var phoneprices = data["price"];
                        return InkWell(
                          onTap: () {
                            Get.to(
                              Phonedetails(
                                images: data["images"],
                                phoneprice: data["price"],
                                phonecondtion: data["condtion"] ?? "",
                                phonetile: data["mobiletitle"] ?? "",
                                phoneimage: data["thumbnail"] ?? '',
                                phonebrand: data["brand"] ?? "",
                                phonecolor: data["color"] ?? "",
                                phoneram: data["ram"] ?? "",
                                phonestock: data["stock"] ?? "",
                                phonestorage: data["stroage"] ?? "",
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(border: Border.all()),

                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.favorite_outline),
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 120.h,
                                  width: 500.w,
                                  child: Image.network(data["thumbnail"]),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  data["mobiletitle"],
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  data["condtion"],
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  phoneprices.toString(),
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
