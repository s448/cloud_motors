import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_share/flutter_share.dart';

class UrlLaiuncherController {
  launchURL(String url) async {
    try {
      !await launch(url);
    } catch (e) {
      Get.snackbar("ERROR", "please try again");
      //print(e.toString());
    }
  }

  Future<void> share(String url) async {
    await FlutterShare.share(
        title: 'Cloud Motors',
        text: 'Best Car Service application',
        linkUrl: url,
        chooserTitle: 'Cloud Motors');
  }

  Future<void> launceEmail() async {
    final String url =
        'mailto:support@cloudmotor.in?subject=Cloud Motor Reports';
    // "mailto:$toEmail?subject=${Uri.encodeFull(subject)}&message=${Uri.encodeFull(message)}";
    if (await canLaunch(url)) {
      try {
        await launch(url);
      } catch (e) {
        Get.snackbar("ERROR", e.toString());
      }
    }
  }
}
