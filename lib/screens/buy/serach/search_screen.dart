import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/widgets/styles/colors/appcolors.dart';
import 'package:hapticfone/common/widgets/favtorieicon.dart';
import 'package:hapticfone/common/widgets/rangeslider_widget.dart';
import 'package:hapticfone/common/widgets/serach_textfiled.dart';
import 'package:hapticfone/common/widgets/textbutton_customized.dart';
import 'package:hapticfone/screens/buy/phonedetails.dart';
import 'package:hapticfone/screens/buy/serach/serachcontroller.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final serachcontroller = Get.put(Serachcontroller(context: context));
    return Scaffold(
      key: serachcontroller.scoffdkey,
      endDrawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            SizedBox(height: 10.h),
            Center(child: Text("Choose a range below")),
            RangesliderWidget(),
            Center(
              child: Obx(
                () => Text(
                  "${serachcontroller.selectedtanges.value.start.toInt()}-${serachcontroller.selectedtanges.value.end.toInt()}",
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextbuttonCustomized(
                  boxDecoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  width: 100,
                  heigth: 40,
                  text: "Cancel",
                  textStyle: TextStyle(color: Colors.black),
                  onpressed: () => Get.back(),
                ),
                TextbuttonCustomized(
                  boxDecoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  width: 100,
                  heigth: 40,
                  text: "Apply",
                  textStyle: TextStyle(color: Colors.white),
                  onpressed: () {
                    serachcontroller.filtreditem;
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: AppBar(
          actions: [Container()],
          backgroundColor: Colors.white,
          title: SerachTextfiled(
            focusnode: serachcontroller.focusNode,
            onchaned: (value) {
              serachcontroller.serachtext.value = value;
            },
            labeltext: "Serach the Mobiles",
            prefix: Icon(Icons.search, color: Appcolors.greycolor),
            sufficxicon: IconButton(
              onPressed: () {
                serachcontroller.scoffdkey.currentState?.openEndDrawer();
              },
              icon: Icon(Icons.filter_alt_outlined, color: Appcolors.greycolor),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Obx(() {
            var item = serachcontroller.filtreditem;
            if (item.isEmpty) {
              return Column(
                children: [
                  SizedBox(height: 100.h),
                  Center(
                    child: Lottie.asset(
                      "asset/animations/emptysearch.json",
                      width: 300.w,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Sorry, we didn’t find anything",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              );
            } else {
              return Padding(
                padding: EdgeInsets.all(12.r),
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: serachcontroller.filtreditem.length,
                  itemBuilder: (context, index) {
                    var data = serachcontroller.filtreditem[index];
                    return InkWell(
                      onTap: () {
                        Get.to(
                          Phonedetails(
                            id: data["id"],
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
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(8.r),
                        ),

                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [Favtorieicon(productid: data["id"])],
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
                              data["price"].toString(),
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
