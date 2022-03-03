import 'package:CloudMotors/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:CloudMotors/constants/constant_style.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String hint;
  final VoidCallback function;
  final Icon icon;
  final TextEditingController controller;
  final TextInputType keyB;
  const CustomTextField({
    required this.keyB,
    Key? key,
    required this.hint,
    required this.function,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (val) {
        function;
      },
      keyboardType: keyB,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      cursorColor: mTitleColor,
      decoration: InputDecoration(
          hintText: hint,
          //  fillColor: Colors.white,
          //iconColor: mTitleColor,
          fillColor: Colors.white,
          filled: true,
          hintStyle: TextStyle(fontFamily: tface, fontSize: 18),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12),
              borderRadius: BorderRadius.circular(10)),
          prefixIcon: icon),
    );
  }
}
