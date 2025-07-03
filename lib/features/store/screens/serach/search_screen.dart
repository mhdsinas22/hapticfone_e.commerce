import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/styles/texts/bold_text.dart';
import 'package:hapticfone/common/widgets/choicechip_customized.dart';
import 'package:hapticfone/responsive_screen/responsive_phone_details_screen.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/common/widgets/favtorie_icon.dart';
import 'package:hapticfone/common/widgets/rangeslider_widget.dart';
import 'package:hapticfone/common/widgets/serach_textfiled.dart';
import 'package:hapticfone/features/store/screens/serach/serach_controller.dart';
import 'package:hapticfone/utils/constants/images_strings.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, this.isweb = false});
  final bool isweb;
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
            Row(
              children: [
                SizedBox(width: isweb ? 3.w : 12.w),
                Boldtext(text: "Category", size: isweb ? 8 : 18),
              ],
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8,
                    children: List.generate(serachcontroller.brands.length, (
                      index,
                    ) {
                      var brands = serachcontroller.brands[index];
                      return Choicechipcustomized(
                        color:
                            serachcontroller.selectedbrand.value ==
                                    brands.brandname
                                ? Appcolors.white
                                : Appcolors.black,

                        text: brands.brandname,
                        selectd:
                            serachcontroller.selectedbrand.value ==
                            brands.brandname,
                        onselected: (bool selected) {
                          if (selected) {
                            serachcontroller.changedseletedvalue(
                              brands.brandname,
                            );
                            print(
                              "SELCETD ID:${serachcontroller.selectedbrand.value}",
                            );
                          }
                        },
                      );
                    }),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                SizedBox(width: isweb ? 3.w : 12.w),
                Boldtext(text: "Condtion", size: isweb ? 8 : 18),
              ],
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8,
                    children: List.generate(
                      serachcontroller.condtionitems.length,
                      (index) {
                        var condtions = serachcontroller.condtionitems[index];
                        return Choicechipcustomized(
                          color:
                              serachcontroller.selectCondtion.value == condtions
                                  ? Appcolors.white
                                  : Appcolors.black,
                          text: condtions,
                          selectd:
                              serachcontroller.selectCondtion.value ==
                              condtions,
                          selectedcolor:
                              serachcontroller.selectCondtion.value == condtions
                                  ? Appcolors.black
                                  : Appcolors.white,
                          onselected: (bool isseclted) {
                            if (isseclted) {
                              serachcontroller.changedCondtion(condtions);
                              print(
                                "SELCETD ID:${serachcontroller.selectCondtion.value}",
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (serachcontroller.isloading.value) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 200.h),
                    Center(child: Lottie.asset(AppAnimatons.simpleloading)),
                  ],
                );
              }
              var item = serachcontroller.filtreditem;
              if (item.isEmpty) {
                return Column(
                  children: [
                    SizedBox(height: 100.h),
                    Center(
                      child: Lottie.asset(
                        "assets/animations/emptysearch.json",
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
                    gridDelegate:
                        isweb
                            ? SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 180,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 0.7,
                            )
                            : SliverGridDelegateWithFixedCrossAxisCount(
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
                            ResponsivePhoneDetailsScreen(
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

                                children: [
                                  // SizedBox(width: isweb ? 15.w : null),
                                  Favtorieicon(
                                    productid: data["id"],
                                    isweb: isweb,
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
                                  fontSize: isweb ? null : 13.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                data["condtion"],
                                style: TextStyle(
                                  fontSize: isweb ? null : 13.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                data["price"].toString(),
                                style: TextStyle(
                                  fontSize: isweb ? null : 12.sp,
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
      ),
    );
  }
}
