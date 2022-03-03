import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_share/flutter_share.dart';

class UrlLaiuncherController {
  launchURL(String url) async {
    try {
      !await launch(url);
    } catch (e) {
      Get.snackbar("ERROR", "please try again");
      print(e.toString());
    }
  }

  Future<void> share(String url) async {
    await FlutterShare.share(
        title: 'Cloud Motors',
        text: 'Best Car Service application',
        linkUrl: url,
        chooserTitle: 'Cloud Motors');
  }
}
