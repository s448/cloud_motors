import 'package:CloudMotors/constants/color_constant.dart';
import 'package:CloudMotors/constants/constant_style.dart';
import 'package:CloudMotors/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingInfo extends StatefulWidget {
  const BookingInfo({Key? key}) : super(key: key);

  @override
  State<BookingInfo> createState() => _BookingInfoState();
}

class _BookingInfoState extends State<BookingInfo> {
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text(
          Get.arguments[0].name.toString() + " Booking",
          style: TextStyle(
              color: Colors.white,
              fontFamily: tface,
              fontSize: 26,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 16,
            ),
            CustomTextField(
              function: () {},
              hint: 'Your Name',
              icon: Icon(Icons.person, color: mTitleColor),
              keyB: TextInputType.text,
            ),
            SizedBox(
              height: Get.height / 50,
            ),
            CustomTextField(
              keyB: TextInputType.phone,
              function: () {},
              hint: 'Your Phone Number',
              icon: Icon(
                Icons.phone,
                color: mTitleColor,
              ),
            ),
            SizedBox(
              height: Get.height / 50,
            ),
            CustomTextField(
                keyB: TextInputType.text,
                function: () {},
                hint: 'Your Address',
                icon: Icon(
                  Icons.location_city,
                  color: mTitleColor,
                )),
            SizedBox(
              height: Get.height / 25,
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: mCardSubtitleColor),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Car Information",
                      style: mTitleStyle,
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 50,
                  ),
                  TextField(
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    cursorColor: mTitleColor,
                    decoration: InputDecoration(
                      hintText: "Car Name",
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      iconColor: mTitleColor,
                      hintStyle: TextStyle(
                          fontFamily: tface,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 50,
                  ),
                  TextField(
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    cursorColor: mTitleColor,
                    decoration: InputDecoration(
                      hintText: "Car Model",
                      fillColor: Colors.grey.shade300,
                      filled: true,
                      iconColor: mTitleColor,
                      hintStyle: TextStyle(
                          fontFamily: tface,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 25,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: mTitleColor,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(
                        5.0,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        isExpanded: true,
                        hint: Text("Select car type"),
                        // icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: mBlueColor),
                        // underline: Container(
                        //   height: 2,
                        //   color: mBlueColor,
                        // ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['Hatchback & Sedan', 'Suv']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: mServiceTitleStyle,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height / 60,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "NEXT",
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
            ),
            SizedBox(
              height: Get.height / 60,
            ),
          ],
        ),
      ),
    );
  }
}
