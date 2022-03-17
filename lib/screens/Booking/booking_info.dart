import 'package:CloudMotors/constants/color_constant.dart';
import 'package:CloudMotors/constants/constant_style.dart';
import 'package:CloudMotors/constants/custom_button.dart';
import 'package:CloudMotors/controllers/auth_controller.dart';
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
  //radio

  TextEditingController nameTE = TextEditingController();
  TextEditingController phoneTE = TextEditingController();
  TextEditingController adressTE = TextEditingController();
  TextEditingController carNameTE = TextEditingController();
  TextEditingController carModelTE = TextEditingController();
  BookingController bookingController = Get.put(
    BookingController(),
    permanent: false,
  );
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BookingController>(
      init: bookingController,
      builder: ((controller) => Scaffold(
            backgroundColor: Colors.grey.shade300,
            appBar: AppBar(
              title: Text(
                Get.arguments[2].name.toString() + " Booking",
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
              child: Form(
                key: bookingController.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height / 16,
                    ),
                    SizedBox(
                      height: Get.height / 50,
                    ),
                    Text(
                      "Your Address",
                      style: mTitleStyle,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please fill this required field";
                        }
                        return null;
                      },
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
                        fillColor: Colors.white,
                        filled: true,
                        hintStyle: TextStyle(fontFamily: tface, fontSize: 18),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12),
                            borderRadius: BorderRadius.circular(10)),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Car Details",
                              style: mTitleStyle,
                            ),
                          ),
                          SizedBox(
                            height: Get.height / 50,
                          ),
                          Text(
                            "Car name",
                            style: mTitleStyle,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please fill this required field";
                              }
                              return null;
                            },
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
                              //hintText: "Car Name",
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
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Radio(
                                      value: 0,
                                      groupValue: bookingController.radio,
                                      onChanged:
                                          bookingController.selectCarModel,
                                    ),
                                    Text("Hatchback & sedan"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Radio(
                                      value: 1,
                                      groupValue: bookingController.radio,
                                      onChanged:
                                          bookingController.selectCarModel,
                                    ),
                                    Text("Suv"),
                                  ],
                                )
                              ],
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
                          lastDate: DateTime.now().add(Duration(days: 16)),
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
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
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
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 10.0),
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
                        title: bookingController.price == null
                            ? "Pay Cash"
                            : "Pay Cash (${bookingController.price} INR)",
                        function: () {
                          if (bookingController.date == null) {
                            Get.snackbar("Please Select a Date", "");
                          } else if (bookingController.radio == null) {
                            Get.snackbar("Please select a car model", "");
                          } else {
                            final isValid = bookingController
                                .formKey.currentState!
                                .validate();
                            if (!isValid) {
                              return;
                            } else {
                              bookingController.bookService("Cash Payment");
                            }
                          }
                        }),
                    Get.arguments[2].name == "Workshop Service"
                        ? SizedBox(
                            height: 0,
                          )
                        : CutomButton(
                            title: bookingController.price == null
                                ? "Proceed to pay"
                                : "Proceed to pay (${bookingController.price} INR)",
                            function: () {
                              if (bookingController.date == null) {
                                Get.snackbar("Please Select a Date", "");
                              } else if (bookingController.radio == null) {
                                Get.snackbar("Please select a car model", "");
                              } else {
                                final isValid = bookingController
                                    .formKey.currentState!
                                    .validate();
                                if (!isValid) {
                                  return;
                                } else {
                                  bookingController.dispatchPayment();
                                }
                              }
                            },
                          ),
                    SizedBox(
                      height: Get.height / 60,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
