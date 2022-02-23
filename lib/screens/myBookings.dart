import 'package:CloudMotors/constants/color_constant.dart';
import 'package:CloudMotors/constants/constant_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class myBookings extends StatefulWidget {
  const myBookings({Key? key}) : super(key: key);

  @override
  _myBookingsState createState() => _myBookingsState();
}

class _myBookingsState extends State<myBookings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mFillColor,
      body: Column(
        children: [
          SizedBox(
            height: Get.height / 8,
          ),
          Image.asset(
            'assets/images/nodata.png',
            width: double.infinity,
            height: Get.height / 2,
          ),
          Center(
            child: Text(
              "You have no bookings yet",
              style: TextStyle(
                fontFamily: tface,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
