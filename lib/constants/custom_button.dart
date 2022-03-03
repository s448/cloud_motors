import 'package:CloudMotors/constants/color_constant.dart';
import 'package:flutter/material.dart';

class CutomButton extends StatelessWidget {
  final String title;
  final VoidCallback function;
  const CutomButton({
    Key? key,
    required this.title,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: double.infinity),
      child: ElevatedButton(
        onPressed: function,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 26,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(mBlueColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
