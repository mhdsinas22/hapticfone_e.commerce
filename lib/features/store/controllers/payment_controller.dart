import 'package:get/get.dart';
import 'package:hapticfone/features/store/controllers/order_controller.dart';
import 'package:hapticfone/utils/constants/snackbar.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentController extends GetxController {
  static PaymentController get instance => Get.find();
  late Razorpay _razorpay;
  final RxDouble amout;
  PaymentController({required this.amout});
  final ordercontroller = Get.put(Ordercontroller());
  @override
  void onInit() {
    print("AMOUNT:_$amout");
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void onClose() {
    _razorpay.clear(); // Removes all listeners
    super.onClose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    try {
      await ordercontroller.createorder(amout.value);
      Get.snackbar("Success", "Payment ID: ${response.paymentId}");
    } catch (e) {
      print("ERROROROR$e");
    }
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar(
      "Error",
      "Code: ${response.code} | Message: ${response.message}",
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar("External Wallet", "${response.walletName}");
  }

  void opencheckout(amout, name) async {
    print("working$amout");
    var options = {
      'key': 'rzp_test_AMaHxm1TzhqZpz',
      'amount': amout, //in paise.
      'name': name,
      'description': 'Fine T-Shirt',
      'timeout': 300, // in seconds
      'prefill': {'contact': '9048551457', 'email': 'sinasmuhammed2@gmail.com'},
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      Snackbars.waringsnakbar("Error", e.toString());
      throw "Errpr$e";
    }
  }
}

      // 'order_id': 'order_EMBFqjDHEEn80l', // Generate order_id using Orders API