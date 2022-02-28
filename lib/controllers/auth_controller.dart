import 'package:CloudMotors/screens/newBottomNarbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  bool authenticated = false;
  String? phone;
  String code = "";
  String vID = "";
  String userPhone = "";
  String userName = "";
  String userEmail = "";
  bool userExistence = false;
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

  /*
  1-signin
  2-register
  3-nav
  */
  Future<void> signInWithPhoneNumber() async {
    try {
      AuthCredential credential =
          PhoneAuthProvider.credential(verificationId: vID, smsCode: code);
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
            value.user!.updateDisplayName(name);
            value.user!.updateEmail(email!);
          })
          .then(
            (value) => authenticated = true,
          )
          .then((value) => Get.off(newBottomNavrbar()));
    } catch (e) {
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
        'name': name ?? "none",
        'email': email ?? "none@none.none",
        'phone': phone ?? "00000000",
      });
    } catch (e) {
      Get.snackbar("Registration error", e.toString(),
          duration: Duration(seconds: 7));
    }
  }

  Future<void> whetherUserExist() async {
    await reference.where('phone', isEqualTo: phone).get().then((value) {
      value.docs.forEach((element) {
        if (element.exists) {
          print("exist");
          userExistence = true;
          update();
        } else {
          print("dont exist");
          userExistence = false;
          update();
        }
      });
    });
    print(userExistence);
    update();
  }

  Future<void> getUserData() async {
    userPhone = FirebaseAuth.instance.currentUser!.phoneNumber.toString();
    userEmail = FirebaseAuth.instance.currentUser!.email.toString();
    userName = FirebaseAuth.instance.currentUser!.displayName.toString();
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