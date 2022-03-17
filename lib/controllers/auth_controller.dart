import 'package:CloudMotors/screens/newBottomNarbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  GlobalKey<FormState> authFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    //print(box.read('key'));
  }

  final FirebaseAuth auth = FirebaseAuth.instance;
  final box = GetStorage();
  String? name;
  String? email;
  String? phone;
  String code = "";
  String vID = "";
  String userPhone = "";
  String userName = "";
  String userEmail = "";
  bool? loginCheck;
  bool? signupCheck;
  String? bookingDate;

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
      //  Get.snackbar("Verification Completed", "");
    };
    PhoneVerificationFailed verificationFailed = (FirebaseAuthException) {
      Get.snackbar("Verification Failed", FirebaseAuthException.toString());
    };
    PhoneCodeSent codeSent = (verificationId, forceResendingToken) {
      vID = verificationId;
      // Get.snackbar("Verification Code Sent", "");
      update();
    };
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (verificationId) {
      Get.snackbar("Verification Timeout", "");
    };
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91 $phone",
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
      );
    } catch (e) {
      Get.snackbar("Verifivation ERROR", e.toString());
    }
    update();
  }

  /*
  1-signin
  2-register
  3-nav
  */
  Future<void> signInWithPhoneNumber() async {
    //print(code);
    try {
      AuthCredential credential =
          PhoneAuthProvider.credential(verificationId: vID, smsCode: code);
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
            if (signupCheck != true) {
              FirebaseAuth.instance.currentUser!.updateDisplayName(name);
              FirebaseAuth.instance.currentUser!.updateEmail(email!);
            }
          })
          .then(
            (value) => box.write('key', true),
          )
          .then((value) => Get.off(newBottomNavrbar()));
    } catch (e) {
      //print(e.toString());
      Get.snackbar(
        "ERROR",
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

  CollectionReference reference =
      FirebaseFirestore.instance.collection("users");

  Future<void> registerNewUser() async {
    try {
      await reference.add({
        'name': name ?? "unknown",
        'email': email ?? "unknown",
        'phone': "+91$phone",
      });
    } catch (e) {
      Get.snackbar("Registration error", e.toString(),
          duration: Duration(seconds: 7));
    }
  }

  Future<void> LoginCheck() async {
    //print("phone ???????????????" + phone.toString());
    await reference.where('phone', isEqualTo: "+91$phone").get().then((value) {
      value.docs.forEach((element) {
        loginCheck = element.exists;
        update();
      });
    });
    print("loginCheck $loginCheck");
    //print(loginCheck);
    update();
  }

  Future<void> signUpCheck() async {
    //print("phone ???????????????" + phone.toString());
    await reference.where('phone', isEqualTo: "+91$phone").get().then((value) {
      value.docs.forEach((element) {
        signupCheck = element.exists;
        update();
      });
      print("signupCheck $signupCheck");
    });
    //print(loginCheck);
    loginCheck = null;
    //print(loginCheck);
    update();
  }

  clearBuffer() {
    signupCheck = null;
    loginCheck = null;
    update();
  }
}
//sign up
/*
1-check existence
2-verify
3-create
4-signin
5-nav to home
*/

//login
/*
1-check existence
2-verify]
3-login
4-nav to home
*/