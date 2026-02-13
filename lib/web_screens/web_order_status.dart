import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hapticfone/common/styles/alertsboxs/logout_alertbox.dart';
import 'package:hapticfone/common/styles/texts/bold_text.dart';
import 'package:hapticfone/common/widgets/cached_network_image_custom.dart';
import 'package:hapticfone/features/store/controllers/order_controller.dart';
import 'package:hapticfone/features/store/models/cartmodels.dart';
import 'package:hapticfone/utils/constants/appcolors.dart';
import 'package:hapticfone/common/widgets/appbar_customized/appbar_customized.dart';
import 'package:hapticfone/common/widgets/container/bottmnavgiton_twobutton.dart';
import 'package:hapticfone/common/widgets/container/rectangle_container.dart';
import 'package:hapticfone/common/widgets/custom_bottomnavgitonbar/custom_bottomnavgtionbar_home.dart';
import 'package:hapticfone/common/widgets/order_status_seroivenumber_date.dart';
import 'package:hapticfone/common/widgets/orderproces_widget.dart';
import 'package:hapticfone/common/widgets/texts/address_text.dart';

class WebOrderStatus extends StatelessWidget {
  const WebOrderStatus({
    super.key,
    required this.currentstatus,
    required this.image,
    required this.ordercreatedate,
    required this.orderid,
    required this.phonename,
    required this.price,
    required this.confirmedTime,
    required this.orderConfirmed,
    required this.orderStarted,
    required this.orderCompleted,
    required this.id,
    required this.totalamount,
    required this.cartmodels,
    this.isweb = false,
  });
  final String image;
  final String currentstatus;
  final String phonename;
  final String orderid;
  final String ordercreatedate;
  final String price;
  final String confirmedTime;
  final String orderConfirmed;
  final String orderStarted;
  final String orderCompleted;
  final String id;
  final double totalamount;
  final List<Cartmodels> cartmodels;
  final bool isweb;
  @override
  Widget build(BuildContext context) {
    final ordercontroller = Get.put(Ordercontroller());
    return Scaffold(
      bottomNavigationBar:
          currentstatus == "Order Completed"
              ? BottomnavgtiontwoItens(
                isweb: true,
                textbuttontext1: "BACK TO HOME",
                textbuttontext2: "",
                iscomplted: true,
                onpressed1:
                    () => Get.offAll(() => CustomBottomnavgtionbarhome()),
                onpressed2: () {},
              )
              : currentstatus == "Order Cancelled"
              ? BottomnavgtiontwoItens(
                isweb: true,
                textbuttontext1: "BACK TO HOME",
                textbuttontext2: "",
                iscomplted: true,
                onpressed1:
                    () => Get.offAll(() => CustomBottomnavgtionbarhome()),
                onpressed2: () {},
              )
              : BottomnavgtiontwoItens(
                isweb: true,
                textbuttontext1: "BACK TO HOME",
                textbuttontext2: "Cancel Order".toUpperCase(),
                onpressed1:
                    () => Get.offAll(() => CustomBottomnavgtionbarhome()),
                onpressed2:
                    () => LogoutAlertbox(
                      ctxx: context,
                      subtitletext: "",
                      leftsidebuttontext: "No",
                      rightsidebuttontext: "Cancel Order",
                      tittle: "Are You Sure",
                      onpressed: () {
                        String ordercancleed = "Order Cancelled";
                        Get.offAll(
                          CustomBottomnavgtionbarhome(selectedindex: 3),
                        );
                        ordercontroller.updatetheorder(
                          id,
                          orderid,
                          totalamount,
                          ordercancleed,
                          cartmodels,
                        );
                      },
                    ).logoualoert(true),
                textcolor: Appcolors.error,
                bordercolr: Colors.red,
                buttomcolr: Colors.white,
              ),
      appBar: Appbarcustomized(title: "Order Details"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(20.r),
              child: Row(
                children: [Boldtext(text: "Device Details", size: 2.sp)],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 200.h,
                  width: 165.w,
                  color: Appcolors.white,
                  child: CachedNetworkImageCustom(
                    imageurl: image,
                    width: 100.w,
                    heigth: 100.h,
                    fit: BoxFit.contain,
                  ),
                ),
                Column(
                  children: [
                    RectangleContainer(
                      width: 80,
                      heigth: 40.h,
                      boxDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color:
                            currentstatus == "Order Cancelled"
                                ? const Color.fromARGB(255, 243, 98, 88)
                                : const Color.fromARGB(255, 212, 231, 181),
                      ),
                      child: Center(
                        child: Boldtext(
                          text: currentstatus,
                          colors:
                              currentstatus == "Order Cancelled"
                                  ? Appcolors.white
                                  : Appcolors.fontcolourgreen,
                          size: 1.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Boldtext(text: phonename, size: 1.sp),
                    SizedBox(height: 1.h),
                    OrderStatusSeroivenumberDate(
                      text: "Order Number",
                      size: 1.sp,
                      color: Appcolors.greycolor,
                    ),
                    OrderStatusSeroivenumberDate(
                      text: orderid.toUpperCase(),
                      size: 1.sp,
                    ),
                    OrderStatusSeroivenumberDate(
                      text: "Order Created On:",
                      size: 1.sp,
                      color: Appcolors.greycolor,
                    ),
                    OrderStatusSeroivenumberDate(
                      text: ordercreatedate,
                      size: 1.sp,
                    ),
                    OrderStatusSeroivenumberDate(
                      text: "Your Orderd Price",
                      size: 1.sp,
                      color: Appcolors.greycolor,
                      textStyle: TextStyle(),
                    ),
                    OrderStatusSeroivenumberDate(text: "₹$price", size: 1.sp),
                  ],
                ),
              ],
            ),
            currentstatus == "Order Cancelled"
                ? Padding(
                  padding: EdgeInsets.all(12.r),
                  child: Material(
                    elevation: 15,
                    child: RectangleContainer(
                      boxDecoration: BoxDecoration(color: Colors.white),
                      width: 400,
                      heigth: 350,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.r),
                            child: Row(
                              children: [
                                Text(
                                  "Order Status",
                                  style: TextStyle(
                                    fontSize: 5.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1.h,
                            width: 600.w,
                            color: Colors.black,
                          ),
                          SizedBox(height: 30.h),
                          OrderprocesWidget(
                            isweb: true,
                            linecolor: Appcolors.error,
                            lineheight: 80.h,
                            dateandday: ordercreatedate,
                            time: confirmedTime,
                            needicon: true,
                          ),
                          OrderprocesWidget(
                            isweb: true,
                            ordercomments: currentstatus,
                            time: confirmedTime,
                            dateandday: ordercreatedate,
                            isneedline: false,
                            circleavatarbackgroundcolor: Appcolors.error,
                            child: Icon(Icons.close, color: Appcolors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                : Padding(
                  padding: EdgeInsets.all(12.r),
                  child: Material(
                    elevation: 15,
                    child: RectangleContainer(
                      boxDecoration: BoxDecoration(color: Colors.white),
                      width: 400.w,
                      heigth: 700.h,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(15.r),
                            child: Row(
                              children: [
                                Text(
                                  "Order Status",
                                  style: TextStyle(
                                    fontSize: 5.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 1.h,
                            width: 600.w,
                            color: Colors.black,
                          ),
                          SizedBox(height: 30.h),
                          OrderprocesWidget(
                            dateandday: ordercreatedate,
                            time: confirmedTime,
                            needicon: true,
                            isweb: true,
                          ),
                          orderConfirmed == "Order Conifrmed"
                              ? OrderprocesWidget(
                                isweb: true,
                                ordercomments: "Order Confirmed",
                                lineheight: 60.h,
                                needicon: true,
                                dateandday: ordercreatedate,
                                time: confirmedTime,
                              )
                              : OrderprocesWidget(
                                isweb: true,
                                ordercomments: "Order Confirmed",
                                lineheight: 60.h,
                                dateandday: "",
                                time: "",
                                circleavatarbackgroundcolor: Appcolors.appgrey,
                              ),
                          orderStarted == "Order Started"
                              ? OrderprocesWidget(
                                isweb: true,
                                needicon: true,
                                lineheight: 60.h,
                                ordercomments: "Order Started",
                                dateandday: ordercreatedate,
                                time: confirmedTime,
                              )
                              : OrderprocesWidget(
                                isweb: true,
                                ordercomments: "Order Started",
                                lineheight: 60.h,
                                dateandday: "",
                                time: "",
                                circleavatarbackgroundcolor: Appcolors.appgrey,
                              ),
                          orderCompleted == "Order Completed"
                              ? OrderprocesWidget(
                                isweb: true,
                                isneedline: false,
                                needicon: true,
                                lineheight: 60.h,
                                ordercomments: "Order Completed",
                                dateandday: ordercreatedate,
                                time: confirmedTime,
                              )
                              : OrderprocesWidget(
                                isweb: true,
                                isneedline: false,
                                ordercomments: "Order Completed",
                                lineheight: 60.h,
                                dateandday: "",
                                time: "",
                                circleavatarbackgroundcolor: Appcolors.appgrey,
                              ),
                        ],
                      ),
                    ),
                  ),
                ),
            Padding(
              padding: EdgeInsets.all(12.0.r),
              child: Addresstext(isweb: true, height: 200.h),
            ),
          ],
        ),
      ),
    );
  }
}
