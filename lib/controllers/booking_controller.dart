import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BookingController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late Razorpay _razorpay;

  @override
  void onInit() {
    super.onInit();
    getUserData();
    returnDayOffValue();
    _razorpay = Razorpay();

    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  //pricing
  int? price;

  int? radio;
  void selectCarModel(int? val) {
    radio = val!;
    price = Get.arguments[val];
    //print(price);
    update();
  }

  //vars for bookings
  String? dropdownValue;
  String? name;
  String phone = '';
  String address = '';
  String carName = '';

  getAdress(val) {
    address = val;
    //print(address);
  }

  getCarName(val) {
    carName = val;
    //print(carName);
  }

  Future<void> getUserData() async {
    name = FirebaseAuth.instance.currentUser!.displayName.toString();
    phone = FirebaseAuth.instance.currentUser!.phoneNumber.toString();
    //print(name! + "  +++++  " + phone);
  }
  //getting the blackout dates from firebase

  String? date;
  int? dayOffIndex;
  List<DateTime> dates = [];
  CollectionReference dateRef =
      FirebaseFirestore.instance.collection('days_off');
  returnDayOffValue() async {
    try {
      var response = await dateRef.get();
      for (var element in response.docs) {
        dates.add(DateTime.parse(element.get('day_off').toString()));
        // dayOffIndex = element.get('day_off');
        //print(dates);
      }
    } catch (e) {
      //print(e.toString());
      // Get.snackbar(e.toString(), "NO DATA AVAILBLE");
    }
    //print(dates);
    return dayOffIndex;
  }

  getDate(val) {
    date = val;
    //print(date);
  }

  //sending the booking request to firestore

  CollectionReference bookingRef =
      FirebaseFirestore.instance.collection('bookings');
  List<String> bookings = [];

  Future<void> bookService(String paymentType) async {
    try {
      await bookingRef.add({
        'name': name,
        'phone': phone,
        'address': address,
        'car_name': carName,
        'car_model_type': radio == 0 ? "Hatchback&sedan" : "SUV",
        'payment_type': paymentType,
        'view_status': false,
        'date': date,
        'service': Get.arguments[2].name.toString(),
      }).then((value) => Get.snackbar(
            "Great !",
            "you booked the service successfully",
            backgroundColor: Colors.green,
            colorText: Colors.white,
          ));
    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    }
  }

  callNumber() async {
    const number = '+911122334455'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

  ///payment business logic

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    bookService('Proceed to pay');
    // Get.snackbar("Payment Success",
    //     "${response.orderId}  \n  ${response.paymentId} \n ${response.signature}");
    // print(
    //     "Payment Success   ????????????${response.orderId}  \n  ${response.paymentId} \n ${response.signature}");
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    Get.snackbar("Payment Failsed", "${response.message}",
        backgroundColor: Colors.red, colorText: Colors.white);
    //print("Payment Failsed >>>>>>>>>>>>${response.message}");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    Get.snackbar("External Wallet Successful", "${response.walletName}");
    //print("External Wallet Successful >>>>>>>>>>${response.walletName}");
  }

  //String _rzp_test_key = "rzp_test_WfJqnJXLpg5sXl";
  String _rzp_key = "pQUNYR4nEIAT7NDbensXeU6g";
  void dispatchPayment() {
    var option = {
      'key': _rzp_key,
      'amount': "$price" + "00",
      'name': name,
      'description': "",
      'prefill': {
        'contact': FirebaseAuth.instance.currentUser!.phoneNumber,
        'email': FirebaseAuth.instance.currentUser!.email,
      },
      'external': {
        'wallets': [""]
      },
    };

    try {
      _razorpay.open(option);
    } catch (e) {
      //print(e.toString());
      Get.snackbar("ERORR", "$e");
    }
  }
}
