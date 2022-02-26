import 'package:CloudMotors/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  bool authenticated = true;
  String? phone;
  String code = "";
  String vID = "";
  getName(val) {
    name = val;
  }

  getEmail(val) {
    email = val;
  }

  getPhone(val) {
    phone = val;
  }

  getCode(val) {
    code = val;
  }

  Future<void> verifyPhoneNumber(phone) async {
    PhoneVerificationCompleted verificationCompleted =
        (PhoneAuthCredential phoneAuthCredential) async {
      Get.snackbar("Verification Completed", "");
    };
    PhoneVerificationFailed verificationFailed = (FirebaseAuthException) {
      Get.snackbar("Verification Failed", FirebaseAuthException.toString());
    };
    PhoneCodeSent codeSent = (verificationId, forceResendingToken) {
      vID = verificationId;
      Get.snackbar("Verification Code Sent", "");
      update();
    };
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (verificationId) {
      Get.snackbar("Verification TimeOUT", "");
    };
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: "+20 $phone",
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
    } catch (e) {
      Get.snackbar("Verifivation ERROR", e.toString());
    }
    update();
  }

  Future<void> signInWithPhoneNumber() async {
    // print(verificationId);
    // print(smsCode);
    try {
      AuthCredential credential =
          PhoneAuthProvider.credential(verificationId: vID, smsCode: code);
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then(
            (value) => Get.offAll(
              () => HomeScreen(),
            ),
          )
          .then(
            (value) => authenticated = true,
          );
    } catch (e) {
      Get.snackbar(
        "ERROR While Sign up",
        e.toString(),
        duration: const Duration(
          seconds: 10,
        ),
      );
    }
    update();
  }

  Future<void> signOut() async {
    FirebaseAuth.instance.signOut();
  }
}
