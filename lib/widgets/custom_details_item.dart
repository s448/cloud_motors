import 'package:CloudMotors/constants/color_constant.dart';
import 'package:CloudMotors/constants/constant_style.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';

class Item extends StatelessWidget {
  final String itemText;
  const Item({Key? key, required this.itemText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      width: Get.width,
      // height: Get.height/25,
      child: Row(
        children: [
          Icon(
            Icons.circle,
            color: mSubtitleColor,
            size: 20,
          ),
          SizedBox(
            width: 8.0,
          ),
          Expanded(
            child: Text(
              itemText,
              softWrap: true,
              maxLines: 3,
              style: TextStyle(
                fontSize: 25,
                color: mSubtitleColor,
                fontFamily: tface,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          )
        ],
      ),
    );
  }
}
