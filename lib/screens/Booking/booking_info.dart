import 'package:CloudMotors/constants/color_constant.dart';
import 'package:CloudMotors/constants/constant_style.dart';
import 'package:CloudMotors/constants/custom_button.dart';
import 'package:CloudMotors/controllers/booking_controller.dart';
import 'package:CloudMotors/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BookingInfo extends StatefulWidget {
  const BookingInfo({Key? key}) : super(key: key);

  @override
  State<BookingInfo> createState() => _BookingInfoState();
}

class _BookingInfoState extends State<BookingInfo> {
  TextEditingController nameTE = TextEditingController();
  TextEditingController phoneTE = TextEditingController();
  TextEditingController adressTE = TextEditingController();
  TextEditingController carNameTE = TextEditingController();
  TextEditingController carModelTE = TextEditingController();
  BookingController bookingController = Get.put(
    BookingController(),
    permanent: true,
  );
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
      init: bookingController,
      builder: ((controller) => Scaffold(
            backgroundColor: Colors.grey.shade300,
            appBar: AppBar(
              title: Text(
                Get.arguments[0].name.toString() + " Booking",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: tface,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height / 16,
                  ),
                  TextFormField(
                    controller: nameTE,
                    onChanged: (val) {
                      bookingController.getName(nameTE.text);
                    },
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    cursorColor: mTitleColor,
                    decoration: InputDecoration(
                      hintText: 'Your Name',
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
                      prefixIcon: Icon(Icons.person, color: mTitleColor),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 50,
                  ),
                  TextFormField(
                    controller: phoneTE,
                    onChanged: (val) {
                      bookingController.getPhone(phoneTE.text);
                    },
                    keyboardType: TextInputType.phone,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    cursorColor: mTitleColor,
                    decoration: InputDecoration(
                      hintText: 'Your Phone',
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: TextStyle(fontFamily: tface, fontSize: 18),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.phone, color: mTitleColor),
                    ),
                  ),
                  SizedBox(
                    height: Get.height / 50,
                  ),
                  TextFormField(
                    controller: adressTE,
                    onChanged: (val) {
                      bookingController.getAdress(adressTE.text);
                    },
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    cursorColor: mTitleColor,
                    decoration: InputDecoration(
                      hintText: 'Your Address',
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: TextStyle(fontFamily: tface, fontSize: 18),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.location_city, color: mTitleColor),
                    ),
                  ),
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
                          controller: carNameTE,
                          onChanged: (val) {
                            bookingController.getCarName(carNameTE.text);
                          },
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
                          controller: carModelTE,
                          onChanged: (val) {
                            bookingController.getCarModel(carModelTE.text);
                          },
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
                              value: bookingController.dropdownValue,
                              isExpanded: true,
                              hint: Text("Select car type"),
                              elevation: 16,
                              style: const TextStyle(color: mBlueColor),
                              onChanged: (String? newValue) {
                                setState(() {
                                  bookingController.dropdownValue = newValue!;
                                });
                              },
                              items: <String>[
                                'Hatchback & Sedan',
                                'Suv'
                              ].map<DropdownMenuItem<String>>((String value) {
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
                  CutomButton(
                    title: bookingController.date == null
                        ? "Select Date"
                        : "you selected ${DateFormat.yMMMd().format(DateTime.parse(bookingController.date!))}",
                    function: () {
                      showDatePicker(
                        context: context,
                        cancelText: "",
                        selectableDayPredicate: (DateTime day) {
                          return bookingController.dates.contains(day)
                              ? false
                              : true;
                        },
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2222),
                      )
                          .then(
                            (date) => bookingController.getDate(
                              date.toString(),
                            ),
                          )
                          .then((value) => bookingController.update());
                    },
                  ),
                  SizedBox(
                    height: Get.height / 14,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 10.0, right: 20.0),
                            child: const Divider(
                              thickness: 1,
                              color: Colors.black,
                              height: 36,
                            ),
                          ),
                        ),
                        Text(
                          "Payment Options".tr,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Expanded(
                          child: Container(
                            margin:
                                const EdgeInsets.only(left: 20.0, right: 10.0),
                            child: const Divider(
                              thickness: 1,
                              color: Colors.black,
                              height: 36,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CutomButton(
                      title: "Pay Cash",
                      function: () {
                        bookingController.bookService("Cash Payment");
                      }),
                  CutomButton(title: "Proceed to pay", function: () {}),
                  SizedBox(
                    height: Get.height / 60,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
