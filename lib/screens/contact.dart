import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/color_constant.dart';
import '../constants/constant_style.dart';
import '../models/popular_destination_model.dart';

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
    // border: Border.all(color: Colors.black),
    color: mFillColor,
    borderRadius: BorderRadius.circular(15.0),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
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
                  Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: mBlueColor),
                      color: mFillColor,
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "you can also view our location on GPS",
                            style: TextStyle(fontFamily: tface, fontSize: 18),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: Text(
                            "Location",
                            style: TextStyle(
                                color: mFillColor,
                                fontFamily: tface,
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          color: mBlueColor,
                        )
                      ],
                    ),
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
                  //  border: Border.all(color: Colors.black),
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
                  //  border: Border.all(color: Colors.black),
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
                  //     border: Border.all(color: Colors.black),
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
