import 'package:CloudMotors/constants/color_constant.dart';
import 'package:CloudMotors/constants/constant_style.dart';
import 'package:CloudMotors/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController valTE = TextEditingController();
  AuthController authController = Get.put(AuthController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: authController,
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: mGreyColor,
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 35, 0, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back,
                    size: 32,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Container(
              decoration: BoxDecoration(
                color: mTitleColor,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/images/illustration-3.png',
                width: Get.width,
                height: Get.height / 3,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              'Verification',
              style: TextStyle(
                fontSize: 22,
                fontFamily: tface,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Enter your OTP code",
              style: TextStyle(
                fontSize: 14,
                fontFamily: tface,
                fontWeight: FontWeight.bold,
                color: Colors.black38,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 28,
            ),
            Container(
              padding: EdgeInsets.all(28),
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: Get.height / 12,
                        width: Get.width * 0.75,
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: TextField(
                            controller: valTE,
                            autofocus: true,
                            onChanged: (value) {
                              authController.code = value;
                              authController.update();
                              print(authController.code);
                            },
                            showCursor: false,
                            readOnly: false,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              wordSpacing: 2,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            keyboardType: TextInputType.number,
                            maxLength: 6,
                            decoration: InputDecoration(
                              hintText: "Enter the 6 digits code",
                              counter: Offstage(),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 2, color: Colors.black12),
                                  borderRadius: BorderRadius.circular(12)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 2, color: mTitleColor),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        authController.signInWithPhoneNumber();
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(mTitleColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          'Verify',
                          style: TextStyle(
                            fontSize: 22,
                            fontFamily: tface,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't you receive the code?",
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: tface,
                    fontWeight: FontWeight.bold,
                    color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  "Resend New Code",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: tface,
                    fontWeight: FontWeight.bold,
                    color: mTitleColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: Get.height / 10,
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
