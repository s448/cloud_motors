import 'package:CloudMotors/constants/color_constant.dart';
import 'package:CloudMotors/constants/constant_style.dart';
import 'package:CloudMotors/models/travlog_model.dart';
import 'package:CloudMotors/screens/Booking/booking_info.dart';
import 'package:CloudMotors/widgets/custom_details_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

class VehiclePickUpSD extends StatefulWidget {
  const VehiclePickUpSD({Key? key}) : super(key: key);

  @override
  State<VehiclePickUpSD> createState() => _VehiclePickUpSDState();
}

class _VehiclePickUpSDState extends State<VehiclePickUpSD> {
  int current = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          travlogs3[0].name + " Details",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: Get.height,
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              child: Swiper(
                onIndexChanged: (index) {
                  setState(() {
                    current = index;
                  });
                },
                autoplay: true,
                layout: SwiperLayout.DEFAULT,
                itemCount: 3,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/swiper/pickup/${detailsSwiper[current]}.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Text(
                "Option to book service at specific date when we will pickup the vehicle from given location",
                style: TextStyle(
                  fontSize: 25,
                  color: mSubtitleColor,
                  fontFamily: tface,
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(BookingInfo(), arguments: [299, 299, travlogs3[0]]);
                },
                child: Text(
                  "Book",
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
          ],
        ),
      ),
    );
  }
}
