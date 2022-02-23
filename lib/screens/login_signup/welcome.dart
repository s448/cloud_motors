import 'package:CloudMotors/constants/color_constant.dart';
import 'package:CloudMotors/constants/constant_style.dart';
import 'package:CloudMotors/screens/home_screen.dart';
import 'package:CloudMotors/screens/login_signup/otp.dart';
import 'package:CloudMotors/screens/newBottomNarbar.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: mGreyColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/illustration-1.png',
              width: Get.width,
              height: Get.height / 2,
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
              height: 10,
            ),
            Text(
              "Never a better time than now to start.",
              style: TextStyle(
                fontSize: 20,
                fontFamily: tface,
                fontWeight: FontWeight.w600,
                color: Colors.black38,
              ),
              textAlign: TextAlign.center,
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
                      'Create Account',
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
              height: Get.height / 60,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: Get.width),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(newBottomNavrbar());
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(mTitleColor),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Login',
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
