import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/color_constant.dart';
import '../constants/constant_style.dart';

class contactPage extends StatefulWidget {
  const contactPage({Key? key}) : super(key: key);

  @override
  _contactPageState createState() => _contactPageState();
}

class _contactPageState extends State<contactPage> {
  BoxDecoration customDecoration = BoxDecoration(
    gradient: LinearGradient(
      stops: [0.025, 0.02],
      colors: [mBlueColor, Colors.white],
    ),
    border: Border.all(color: mTitleColor),
    color: mFillColor,
    borderRadius: BorderRadius.circular(15.0),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 10,
            ),
            Container(
              decoration: customDecoration,
              padding: EdgeInsets.all(12.0),
              margin: EdgeInsets.all(5.0),
              child: Column(
                children: [
                  IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Address",
                          style: TextStyle(
                            fontSize: 24,
                            color: mTitleColor,
                            fontFamily: tface,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        VerticalDivider(
                          color: mBlueColor,
                          thickness: 2.5,
                        ),
                        Expanded(
                          child: Text(
                            "16/omar ebn alkhatab street / deyarb negm ",
                            softWrap: true,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 18,
                              color: mBlueColor,
                              fontFamily: tface,
                            ),
                          ),
                        ),
                        Image.asset(
                          "assets/icons/location.png",
                          width: 50,
                          height: 50,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                ],
              ),
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                width: Get.width,
                height: 37,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: mTitleColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Facebook",
                      style: const TextStyle(
                          fontFamily: 'myRiadh',
                          color: mTitleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 22),
                    ),
                    Image.asset(
                      'assets/icons/fb.png',
                      width: Get.width / 15,
                      height: Get.height / 15,
                    ),
                  ],
                ),
              ),
              // onTap: () {
              //   Get.to(Reports());
              // }),
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                width: Get.width,
                height: 37,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: mTitleColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Instagram",
                      style: TextStyle(
                          fontFamily: tface,
                          fontWeight: FontWeight.bold,
                          color: mTitleColor,
                          fontSize: 22),
                    ),
                    Image.asset(
                      'assets/icons/insta.png',
                      width: Get.width / 15,
                      height: Get.height / 15,
                    ),
                  ],
                ),
              ),
              // onTap: () {
              //   Get.to(Reports());
              // }),
            ),
            InkWell(
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                width: Get.width,
                height: 37,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: mTitleColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Our website",
                      style: TextStyle(
                          fontFamily: tface,
                          fontWeight: FontWeight.bold,
                          color: mTitleColor,
                          fontSize: 22),
                    ),
                    Image.asset(
                      'assets/icons/website.png',
                      width: Get.width / 15,
                      height: Get.height / 15,
                    ),
                  ],
                ),
              ),
              // onTap: () {
              //   Get.to(Reports());
              // }),
            ),
          ],
        ),
      ),
    );
  }
}
