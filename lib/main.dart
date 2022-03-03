import 'package:CloudMotors/constants/color_constant.dart';
import 'package:CloudMotors/constants/constant_style.dart';
import 'package:CloudMotors/controllers/auth_controller.dart';
import 'package:CloudMotors/controllers/booking_controller.dart';
import 'package:CloudMotors/screens/login_signup/welcome.dart';
import 'package:CloudMotors/screens/newBottomNarbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BookingController().returnDayOffValue();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    newBottomNavrbar();
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: mTitleColor,
        //iconTheme: IconThemeData(color: mTitleColor),
        fontFamily: tface,
        // primarySwatch: mTitleColor,
        appBarTheme: AppBarTheme(
          color: mBlueColor,
        ),
      ),
      //  home: newBottomNavrbar(),
      debugShowCheckedModeBanner: false,
      home: AuthController().authenticated ? newBottomNavrbar() : Welcome(),
    );
  }
}
