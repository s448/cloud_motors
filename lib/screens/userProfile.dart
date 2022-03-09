import 'package:CloudMotors/constants/color_constant.dart';
import 'package:CloudMotors/constants/constant_style.dart';
import 'package:CloudMotors/controllers/auth_controller.dart';
import 'package:CloudMotors/controllers/url_launch_controller.dart';
import 'package:CloudMotors/controllers/user_controller.dart';
import 'package:CloudMotors/screens/login_signup/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfilePage extends StatelessWidget {
  String appUrl =
      "https://play.google.com/store/apps/details?id=com.saidmo.cloudmotors";

  UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<UserController>(
        init: userController,
        builder: (UserController) => SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CustomPaint(
                    child: Container(
                      width: Get.width,
                      height: Get.height / 3,
                    ),
                    painter: HeaderCurvedContainer(),
                  ),
                  Positioned(
                    top: Get.height / 12,
                    left: Get.width / 5.3,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 3,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 4),
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/icons/profile.png'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.all(8.0),
                  width: Get.width,
                  height: Get.height / 4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: mTitleColor, width: 2),
                    color: mBackgroundColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.centerLeft,
                        height: Get.height / 15,
                        width: double.infinity,
                        color: mBackgroundColor,
                        child: Row(
                          children: [
                            Icon(Icons.person),
                            VerticalDivider(
                              thickness: 1.2,
                              color: mTitleColor,
                            ),
                            Text(
                              userController.userInfo[0]['name'],
                              style: TextStyle(
                                color: mTitleColor,
                                fontFamily: tface,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        alignment: Alignment.centerLeft,
                        height: Get.height / 15,
                        width: double.infinity,
                        color: mGreyColor,
                        child: Row(
                          children: [
                            Icon(Icons.email),
                            VerticalDivider(
                              thickness: 1.2,
                              color: mTitleColor,
                            ),
                            Text(
                              userController.userInfo[0]['email'],
                              style: TextStyle(
                                color: mTitleColor,
                                fontSize: 22,
                                fontFamily: tface,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          padding: EdgeInsets.all(8.0),
                          alignment: Alignment.centerLeft,
                          height: Get.height / 15,
                          width: double.infinity,
                          color: mBackgroundColor,
                          child: Row(
                            children: [
                              Icon(Icons.phone),
                              VerticalDivider(
                                thickness: 1.2,
                                color: mTitleColor,
                              ),
                              Text(
                                FirebaseAuth
                                        .instance.currentUser!.phoneNumber ??
                                    "Unknown",
                                style: TextStyle(
                                  color: mTitleColor,
                                  fontSize: 22,
                                  fontFamily: tface,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          )),
                    ],
                  )),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: Get.width / 1.1),
                child: ElevatedButton(
                  onPressed: () {
                    AuthController()
                        .signOut()
                        .then(
                            (value) => AuthController().box.write('key', false))
                        .then((value) => GetStorage().write('key', false))
                        .then((value) => Get.offAll(Welcome()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Log out",
                        style: TextStyle(
                            fontFamily: tface,
                            fontSize: 26,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Icon(Icons.logout)
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: const Divider(
                        thickness: 2,
                        color: mTitleColor,
                        height: 36,
                      ),
                    ),
                  ),
                  Text(
                    "Other".tr,
                    style: TextStyle(
                      fontSize: 26,
                      fontFamily: tface,
                      color: mTitleColor,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20.0, right: 10.0),
                      child: const Divider(
                        thickness: 2,
                        color: mTitleColor,
                        height: 36,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomInkWell(
                    imagePass: 'report',
                    title: "Report a problem",
                    function: () async {
                      await FirebaseAuth.instance.currentUser!
                          .updateDisplayName('0');
                      print(FirebaseAuth.instance.currentUser!.displayName);
                      UrlLaiuncherController().launchURL("url");
                    },
                  ),
                  CustomInkWell(
                    imagePass: 'rate',
                    title: "Rate the app",
                    function: () {
                      UrlLaiuncherController().launchURL(appUrl);
                    },
                  ),
                  CustomInkWell(
                    imagePass: 'share',
                    title: "Share the app",
                    function: () {
                      UrlLaiuncherController().share(
                        appUrl,
                      );
                    },
                  ),
                ],
              ),
              SizedBox(
                height: Get.height / 27,
              ),
              Center(
                child: Text(
                  "Version : 1.0.0",
                  style: TextStyle(
                      color: mGreyColor, fontFamily: tface, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomInkWell extends StatelessWidget {
  final String title;
  final String imagePass;
  final VoidCallback? function;
  const CustomInkWell({
    Key? key,
    required this.title,
    required this.function,
    required this.imagePass,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(horizontal: 4.0),
        width: Get.width / 4,
        height: Get.height / 4.8,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: mTitleColor),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icons/$imagePass.png',
              width: Get.width / 10,
              height: Get.height / 10,
            ),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'myRiadh',
                color: mTitleColor,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
      onTap: function,
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = mBlueColor;
    Path path = Path()
      ..relativeLineTo(0, 170)
      ..quadraticBezierTo(size.width / 2, 250, size.width, 100)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}



/**
 *           
 */


/**
 * StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where(
                      'phone',
                      isEqualTo: FirebaseAuth.instance.currentUser!.phoneNumber,
                    )
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: Text("Loading..."));
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Nothing to view"),
                    );
                  } else {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text("Nothing to view"),
                      );
                    }
                    return ListView(
                      children:
                          snapshot.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data =
                            document.data()! as Map<String, dynamic>;
                        return Row(
                          children: [
                            Flexible(
                              child: IntrinsicHeight(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          Icon(Icons.person),
                                          VerticalDivider(
                                            thickness: 1.2,
                                            color: mTitleColor,
                                          ),
                                          Text(
                                            data['name'],
                                            style: TextStyle(
                                              color: mTitleColor,
                                              fontFamily: tface,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15.0),
                                      color: mGreyColor,
                                      child: IntrinsicHeight(
                                        child: Row(
                                          children: [
                                            Icon(Icons.phone),
                                            VerticalDivider(
                                              thickness: 1.2,
                                              color: mTitleColor,
                                            ),
                                            Text(
                                              data['phone'],
                                              style: TextStyle(
                                                color: mTitleColor,
                                                fontFamily: tface,
                                                fontSize: 22,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          Icon(Icons.email),
                                          VerticalDivider(
                                            thickness: 1.2,
                                            color: mTitleColor,
                                          ),
                                          Text(
                                            data['email'],
                                            style: TextStyle(
                                              color: mTitleColor,
                                              fontFamily: tface,
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      }).toList(),
                    );
                  }
                },
              ),
 */