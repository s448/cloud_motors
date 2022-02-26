import 'package:CloudMotors/screens/ServiceDatails/deep_cleaning_service_details.dart';
import 'package:CloudMotors/screens/ServiceDatails/monthly_washing_service_details.dart';
import 'package:CloudMotors/widgets/custom_service_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WashingS extends StatelessWidget {
  const WashingS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Washing Services",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: Get.height / 20,
          ),
          CustomServicePost(
            imagePath: Get.arguments[0].image,
            widget: DeepCleaningSD(),
            title: Get.arguments[0].name,
          ),
          CustomServicePost(
            imagePath: Get.arguments[1].image,
            widget: MonthlyWashingSD(),
            title: Get.arguments[1].name,
          )
        ],
      )),
    );
  }
}
