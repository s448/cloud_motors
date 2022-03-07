import 'package:CloudMotors/constants/color_constant.dart';
import 'package:CloudMotors/constants/constant_style.dart';
import 'package:CloudMotors/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'otp.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController phoneTE = TextEditingController();
  TextEditingController emailTE = TextEditingController();
  TextEditingController nameTE = TextEditingController();

  AuthController authController = Get.put(AuthController(), permanent: false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: mBackgroundColor,
      body: GetBuilder<AuthController>(
        init: AuthController(),
        builder: (authController) => SingleChildScrollView(
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
              SvgPicture.asset(
                'assets/illustrations/1.svg',
                width: Get.width * 0.80,
                height: Get.height / 3,
              ),
              SizedBox(
                height: Get.height / 50,
              ),
              Text(
                'Register',
                style: TextStyle(
                  fontSize: 26,
                  fontFamily: tface,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: Get.height / 50,
              ),
              // Text(
              //   "Add your phone number . we'll send you a verification code",
              //   softWrap: true,
              //   maxLines: 5,
              //   style: TextStyle(
              //     fontSize: 20,
              //     fontFamily: tface,
              //     fontWeight: FontWeight.bold,
              //     color: Colors.black38,
              //   ),
              //   textAlign: TextAlign.center,
              // ),
              SizedBox(
                height: 28,
              ),
              Form(
                key: authController.authFormKey,
                child: Container(
                  padding: EdgeInsets.all(28),
                  decoration: BoxDecoration(
                    color: mBackgroundColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please fill this required field";
                          }
                          return null;
                        },
                        onChanged: ((value) {
                          authController.getName(value);
                        }),
                        keyboardType: TextInputType.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Your name",
                          hintStyle: TextStyle(fontFamily: tface, fontSize: 18),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.green,
                            size: 32,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height / 50,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please fill this required field";
                          } else if (!value.isEmail) {
                            return "Please enter a valid email";
                          }
                          return null;
                        },
                        controller: emailTE,
                        onChanged: (value) {
                          authController.getEmail(value);
                          //print(authController.email);
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Email adress",
                          hintStyle: TextStyle(
                            fontFamily: tface,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.green,
                            size: 32,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height / 50,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please fill this required field";
                          }
                          return null;
                        },
                        controller: phoneTE,
                        onChanged: ((value) {
                          authController.getPhone(value);
                          //print(authController.phone);
                          authController.update();
                        }),
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Phone Number",
                          hintStyle: TextStyle(
                            fontFamily: tface,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black12),
                              borderRadius: BorderRadius.circular(10)),
                          prefix: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              '(+91)',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.green,
                            size: 32,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            final isValid = authController
                                .authFormKey.currentState!
                                .validate();
                            if (!isValid) {
                              return;
                            } else {
                              await authController.signUpCheck().then(
                                (value) {
                                  if (authController.signupCheck != true) {
                                    authController
                                        .verifyPhoneNumber(phoneTE.text)
                                        .then((value) => Get.to(Otp()));
                                  } else {
                                    Get.snackbar(
                                      "User with this phone already exist",
                                      "try to signup instead",
                                    );
                                  }
                                },
                              ).then((value) => authController.clearBuffer);
                            }
                          },
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(mTitleColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(14.0),
                            child: Text(
                              'Get OTP',
                              style: TextStyle(
                                  fontSize: 22,
                                  fontFamily: tface,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
