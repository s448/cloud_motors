import 'package:CloudMotors/models/travlog_model.dart';
import 'package:CloudMotors/screens/Booking/booking_info.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeepCleaningSD extends StatelessWidget {
  const DeepCleaningSD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          travlogs2[0].name + " Details",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        width: Get.width,
        //  height: Get.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("TODO DEtails HERE"),
              ElevatedButton(
                onPressed: () {
                  Get.to(BookingInfo(), arguments: [travlogs3[0]]);
                },
                child: Text("Book Now"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
