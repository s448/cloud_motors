import 'package:CloudMotors/constants/color_constant.dart';
import 'package:CloudMotors/constants/constant_style.dart';
import 'package:CloudMotors/controllers/auth_controller.dart';
import 'package:CloudMotors/screens/login_signup/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  // Widget textfield({@required hintText}) {
  //   return Material(
  //     elevation: 4,
  //     shadowColor: mBlueColor,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: TextField(
  //       decoration: InputDecoration(
  //           hintText: hintText,
  //           hintStyle: TextStyle(
  //             letterSpacing: 2,
  //             color: Colors.black54,
  //             fontWeight: FontWeight.bold,
  //           ),
  //           fillColor: mBlueColor,
  //           filled: true,
  //           border: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(10.0),
  //               borderSide: BorderSide.none)),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CustomPaint(
                  child: Container(
                    width: Get.width,
                    height: Get.height / 3,
                  ),
                  painter: HeaderCurvedContainer(),
                ),
                Positioned(
                  top: Get.height / 12,
                  left: Get.width / 5.3,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    width: MediaQuery.of(context).size.width / 3,
                    height: MediaQuery.of(context).size.width / 3,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 4),
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/icons/profile.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              // padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(8.0),
              width: Get.width,
              height: Get.height / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: mTitleColor, width: 2),
                color: mBackgroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    height: Get.height / 15,
                    width: double.infinity,
                    color: mBackgroundColor,
                    child: Row(
                      children: [
                        Icon(Icons.person),
                        VerticalDivider(
                          thickness: 1.2,
                          color: mTitleColor,
                        ),
                        Text(
                          "Said Muhammad Hassan",
                          style: TextStyle(
                            color: mTitleColor,
                            fontFamily: tface,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    height: Get.height / 15,
                    width: double.infinity,
                    color: mGreyColor,
                    child: Row(
                      children: [
                        Icon(Icons.email),
                        VerticalDivider(
                          thickness: 1.2,
                          color: mTitleColor,
                        ),
                        Text(
                          "elsaedmohassan@mail.com",
                          style: TextStyle(
                            color: mTitleColor,
                            fontSize: 22,
                            fontFamily: tface,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(8.0),
                      alignment: Alignment.centerLeft,
                      height: Get.height / 15,
                      width: double.infinity,
                      color: mBackgroundColor,
                      child: Row(
                        children: [
                          Icon(Icons.phone),
                          VerticalDivider(
                            thickness: 1.2,
                            color: mTitleColor,
                          ),
                          Text(
                            "+201557912724",
                            style: TextStyle(
                              color: mTitleColor,
                              fontSize: 22,
                              fontFamily: tface,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                    child: const Divider(
                      thickness: 2,
                      color: mTitleColor,
                      height: 36,
                    ),
                  ),
                ),
                Text(
                  "Other".tr,
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: tface,
                    color: mTitleColor,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                    child: const Divider(
                      thickness: 2,
                      color: mTitleColor,
                      height: 36,
                    ),
                  ),
                ),
              ],
            ),
            CustomInkWell(
              imagePass: 'assets/icons/report.png',
              title: "Report a problem",
            ),
            CustomInkWell(
              imagePass: 'assets/icons/rate.png',
              title: "Rate the app",
            ),
            CustomInkWell(
              imagePass: 'assets/icons/share.png',
              title: "Share the app",
            ),
            SizedBox(
              height: Get.height / 27,
            ),
            Center(
              child: Text(
                "Version : 1.0.0",
                style: TextStyle(
                    color: mGreyColor, fontFamily: tface, fontSize: 18),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: Get.width / 1.1),
              child: ElevatedButton(
                onPressed: () {
                  AuthController()
                      .signOut()
                      .then((value) => print("Signout done"))
                      .then((value) => Get.offAll(Welcome()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Sign out",
                      style: TextStyle(
                          fontFamily: tface,
                          fontSize: 26,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Icon(Icons.logout)
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomInkWell extends StatelessWidget {
  final String title;
  final String imagePass;
  const CustomInkWell({
    Key? key,
    required this.title,
    required this.imagePass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        width: Get.width,
        height: 37,
        decoration: BoxDecoration(
          color: mBlueColor,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                //fontFamily: 'myRiadh',
                color: Colors.white,
                fontFamily: tface,
                fontSize: 22,
              ),
            ),
            Image.asset(
              imagePass,
              width: Get.width / 15,
              height: Get.height / 15,
            ),
          ],
        ),
      ),
      // onTap: () {
      //   Get.to(Reports());
      // }),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = mBlueColor;
    Path path = Path()
      ..relativeLineTo(0, 170)
      ..quadraticBezierTo(size.width / 2, 250, size.width, 100)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
