import 'package:CloudMotors/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomServicePost extends StatelessWidget {
  final String title;
  final Widget widget;
  final String imagePath;
  CustomServicePost({
    Key? key,
    required this.title,
    required this.widget,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(widget);
      },
      child: Container(
        padding: EdgeInsets.only(bottom: 12.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9.0), color: mBlueColor),
        margin: EdgeInsets.all(5.0),
        child: Column(
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            SizedBox(
              height: 12,
            ),
            Center(
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
