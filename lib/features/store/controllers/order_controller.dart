import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hapticfone/data/repository/order_repositry.dart';
import 'package:hapticfone/features/authentication/controllers/authentication_repository.dart';
import 'package:hapticfone/features/store/controllers/cart_controller.dart';
import 'package:hapticfone/features/store/controllers/radio_controller.dart';
import 'package:hapticfone/features/store/models/cartmodels.dart';
import 'package:hapticfone/features/store/models/ordermodel.dart';
import 'package:hapticfone/features/store/screens/adderss_section/address_controller.dart';
import 'package:hapticfone/utils/constants/text_strings.dart';
import 'package:http/http.dart' as http;
import 'package:random_string/random_string.dart';

class Ordercontroller extends GetxController {
  static Ordercontroller get instance => Get.find();
  @override
  void onInit() {
    fetchcartdata();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  final orderRepositry = Get.put(OrderRepositry());
  final authenticationrepositry = Get.put(Authenticationrepository());
  final addresscontroller = Get.put(Addresscontroller());
  final cartcontrller = Get.put(CartController());
  final radiocontroller = Get.put(Radiocontroller());
  var orders = <Ordermodel>[].obs;
  var ordercontent = "Order Requested".obs;
  RxBool isloading = false.obs;
  RxBool isOrderPlaced = false.obs;
  final ScrollController scrollController = ScrollController();
  // int getStatusPriority(String status) {
  //   switch (status) {
  //     case 'Order Requested':
  //       return 1;
  //     case 'Order Conifrmed':
  //       return 2;
  //     case "Order Started":
  //       return 3;
  //     case 'Order Completed':
  //       return 4;
  //     default:
  //       return 5; // other/unknown statuses
  //   }
  // }

  final Map<String, int> statusPriority = {
    'Order Requested': 1,
    'Order Conifrmed': 2,
    'Order Started': 3,
    'Order Completed': 4,
    "Order Cancelled": 5,
  };

  Future<void> fetchcartdata() async {
    isloading.value = true;
    try {
      final userid = authenticationrepositry.auth.currentUser?.uid;
      if (userid == null) {
        print("User ID not found!");
        return;
      }
      FirebaseFirestore.instance
          .collection("Users")
          .doc(userid)
          .collection("orders")
          .snapshots()
          .listen((snapshot) {
            final updateorders =
                snapshot.docs.map((doc) {
                  return Ordermodel.fromsnapshot(doc);
                }).toList();
            updateorders.sort((a, b) {
              int aPriority = statusPriority[a.currentstatus] ?? 99;
              int bPriority = statusPriority[b.currentstatus] ?? 99;

              if (aPriority != bPriority) {
                return aPriority.compareTo(bPriority);
              }

              int aId = int.parse(a.orderid.replaceAll("ORD", ""));
              int bId = int.parse(b.orderid.replaceAll("ORD", ""));

              return bId.compareTo(aId);
            });

            orders.assignAll(updateorders);
          });
    } catch (e) {
      print("ERROR: $e");
    } finally {
      isloading.value = false;
    }
  }

  Future<void> createorder(double totalamout) async {
    try {
      final id = randomAlpha(5);
      final userid = authenticationrepositry.auth.currentUser?.uid;
      final uniqueString = generteOrderid();
      final confirmareddate = dateandtimefomrat();
      final confirmedTime = timeformat();
      var result = Ordermodel(
        id: id,
        addressmodels: addresscontroller.selectedaddress.value,
        items: cartcontrller.cartitems,
        currentstatus: ordercontent.value,
        orderid: uniqueString,
        userid: userid.toString(),
        totalAmount: totalamout,
        paymetmode: radiocontroller.selectedvalue.value,
        orderconfirmeddate: confirmareddate,
        confirmedTime: confirmedTime,
        orderConfirmed: "",
        orderStrated: "",
        orderCompleted: "",
      );
      await orderRepositry.createorder(id, result, userid, uniqueString);
      await cartcontrller.deleltfullcollectionfromcart();

      await FirebaseFirestore.instance.collection("Tokens").doc("admin").get();
      // String admintokenn = doc["token"];
      // print("Admintoken:-$admintokenn");
      // sendPushMessageToAdmin(admintokenn, uniqueString);
      isOrderPlaced.value = true;
    } catch (e) {
      print("EREROR IS :-$e");
      Get.snackbar("Error", "Failed to place order. Please try again");
    }
  }

  Future<void> sendPushMessageToAdmin(String token, String orderid) async {
    try {
      // final accessToken = await getAccessToken();

      final response = await http.post(
        Uri.parse(
          "https://fcm.googleapis.com/v1/projects/hapticfone-ff0c4/messages:send",
        ),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer kfdj',
        },
        body: jsonEncode({
          "message": {
            "token": token,
            "notification": {
              "title": "New Order",
              "body": "Order ID: $orderid",
            },
          },
        }),
      );

      if (response.statusCode == 200) {
        print("✅ Notification sent successfully");
      } else {
        print("❌ Failed to send notification: ${response.body}");
      }
    } catch (e) {
      print("❌ Errorrrrr: $e");
    }
  }

  Future<void> updatetheorder(
    String id,
    String orderid,
    double totoalamount,
    String updateorderstaus,
    List<Cartmodels> cartmodels,
  ) async {
    final userid = authenticationrepositry.auth.currentUser?.uid;
    final confirmareddate = dateandtimefomrat();
    final confirmedTime = timeformat();
    try {
      var result = Ordermodel(
        id: id,
        addressmodels: addresscontroller.selectedaddress.value,
        items: cartmodels,
        currentstatus: updateorderstaus,
        orderid: orderid,
        userid: userid.toString(),
        totalAmount: totoalamount,
        paymetmode: radiocontroller.selectedvalue.value,
        orderconfirmeddate: confirmareddate,
        confirmedTime: confirmedTime,
        orderConfirmed: "",
        orderStrated: "",
        orderCompleted: "",
      );
      await orderRepositry.updatetheorder(result, id);
    } catch (e) {
      print("CONTROLLER :-$e");
    }
  }

  void scrollToTop() {
    scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  // Future<String> getAccessToken() async {
  //   final path = "assets/firebase-adminsdk.json";
  //   final file = jsonDecode(File(path).readAsStringSync());

  //   final clientEmail = file['client_email'];
  //   final privateKey = file['private_key'];
  //   if (!file.existsSync()) {
  //     print("❌ File not found: $path");
  //   } else {
  //     print("✅ File found!");
  //     print(file.readAsStringSync());
  //   }
  //   final iat = DateTime.now().millisecondsSinceEpoch ~/ 1000;
  //   final exp = iat + 3600;

  //   final jwt = JWT(
  //     {
  //       'iss': clientEmail,
  //       'scope': 'https://www.googleapis.com/auth/firebase.messaging',
  //       'aud': 'https://oauth2.googleapis.com/token',
  //       'iat': iat,
  //       'exp': exp,
  //     },
  //     header: {'alg': 'RS256', 'typ': 'JWT'},
  //   );

  //   final signedJWT = jwt.sign(RSAPrivateKey(privateKey));

  //   final response = await http.post(
  //     Uri.parse('https://oauth2.googleapis.com/token'),
  //     headers: {'Content-Type': 'application/x-www-form-urlencoded'},
  //     body: {
  //       'grant_type': 'urn:ietf:params:oauth:grant-type:jwt-bearer',
  //       'assertion': signedJWT,
  //     },
  //   );

  //   final data = jsonDecode(response.body);
  //   return data['access_token'];
  // }
}
