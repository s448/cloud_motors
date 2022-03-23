import 'package:CloudMotors/constants/color_constant.dart';
import 'package:CloudMotors/constants/constant_style.dart';
import 'package:CloudMotors/controllers/auth_controller.dart';
import 'package:CloudMotors/controllers/booking_controller.dart';
import 'package:CloudMotors/screens/Booking/booking_info.dart';
import 'package:CloudMotors/screens/home_screen.dart';
import 'package:CloudMotors/screens/login_signup/welcome.dart';
import 'package:CloudMotors/screens/newBottomNarbar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  BookingController().returnDayOffValue();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

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
      debugShowCheckedModeBanner: false,
      //home: HomeScreen(),
      home: AuthController().box.read('key') == true
          ? newBottomNavrbar()
          : Welcome(),
    );
  }
}
