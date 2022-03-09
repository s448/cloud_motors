import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getUserData();
    print("init ????????????????????");
    print(FirebaseAuth.instance.currentUser!.phoneNumber);
  }

  List userInfo = [];
  CollectionReference userRef = FirebaseFirestore.instance.collection('users');

  getUserData() async {
    try {
      var response = await userRef
          .where('phone',
              isEqualTo: FirebaseAuth.instance.currentUser!.phoneNumber)
          .get();
      for (var element in response.docs) {
        userInfo.add(element.data());
        print(userInfo);
      }
    } catch (e) {
      Get.snackbar(e.toString(), "NO DATA AVAILBLE");
    }
    update();
  }

  // updateStatus() async {
  //   var response =
  //       await userRef.where('view_status', isEqualTo: false).get();
  //   for (var element in response.docs) {
  //     userRef.doc(element.id).update({
  //       'view_status': true,
  //     });
  //   }
  //   update();
  // }
}
