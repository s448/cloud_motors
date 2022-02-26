import 'package:CloudMotors/screens/ServiceDatails/home_service_details.dart';
import 'package:CloudMotors/widgets/custom_service_post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeS extends StatelessWidget {
  const HomeS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Get.arguments[0].name,
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
            widget: HomeSD(),
            title: Get.arguments[0].name,
          )
        ],
      )),
    );
  }
}
