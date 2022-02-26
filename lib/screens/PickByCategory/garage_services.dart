import 'package:CloudMotors/screens/ServiceDatails/workshop_service_details.dart';
import 'package:CloudMotors/widgets/custom_service_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GarageS extends StatelessWidget {
  const GarageS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Garage Services",
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
            widget: WorkshopSD(),
            title: Get.arguments[0].name,
          )
        ],
      )),
    );
  }
}
