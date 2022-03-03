import 'package:CloudMotors/constants/color_constant.dart';
import 'package:CloudMotors/constants/constant_style.dart';
import 'package:CloudMotors/screens/home_screen.dart';
import 'package:CloudMotors/screens/login_signup/otp.dart';
import 'package:CloudMotors/screens/login_signup/phone_login.dart';
import 'package:CloudMotors/screens/newBottomNarbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'register.dart';
import 'package:get/get.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: mBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Get.height / 20),
            SvgPicture.asset(
              'assets/illustrations/2.svg',
              width: Get.width * 0.60,
              height: Get.height / 4,
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "Let's get started",
              style: TextStyle(
                fontSize: 28,
                fontFamily: tface,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 38,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: Get.width),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(mTitleColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: tface,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Center(
                child: Text(
                  "Or",
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
              ),
              height: Get.height / 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: Get.width),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(PhoneLogin());
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(mTitleColor),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 255, 255, 255)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: tface,
                      ),
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
