import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    returnDayOffValue();
  }

  //vars for bookings
  String? dropdownValue;
  String name = '';
  String phone = '';
  String address = '';
  String carName = '';
  String carModel = '';

  //getters for bookings
  getName(val) {
    name = val;
    print(name);
  }

  getPhone(val) {
    phone = val;
    print(phone);
  }

  getAdress(val) {
    address = val;
    print(address);
  }

  getCarName(val) {
    carName = val;
    print(carName);
  }

  getCarModel(val) {
    carModel = val;
    print(carModel);
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
        print(dates);
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar(e.toString(), "NO DATA AVAILBLE");
    }
    print(dates);
    return dayOffIndex;
  }

  getDate(val) {
    date = val;
    print(date);
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
        'car_model': carModel,
        'car_model_type': dropdownValue,
        'payment_type': paymentType,
        'view_status': false,
        'date': date,
        'service': Get.arguments[0].name.toString(),
      }).then((value) =>
          Get.snackbar("Great !", "you booked the service successfully"));
    } catch (e) {
      Get.snackbar("ERROR", e.toString());
    }
  }
}
