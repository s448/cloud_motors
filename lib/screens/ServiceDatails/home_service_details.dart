import 'package:CloudMotors/constants/color_constant.dart';
import 'package:CloudMotors/models/travlog_model.dart';
import 'package:CloudMotors/screens/Booking/booking_info.dart';
import 'package:CloudMotors/widgets/custom_details_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

class HomeSD extends StatefulWidget {
  const HomeSD({Key? key}) : super(key: key);

  @override
  State<HomeSD> createState() => _HomeSDState();
}

class _HomeSDState extends State<HomeSD> {
  int current = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          travlogs1[0].name + " Details",
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
                          'assets/swiper/home/${detailsSwiper[current]}.jpg',
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
            Text(
              "Service Include:",
              style: TextStyle(fontSize: 26, color: Colors.black),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: homeDetails.length,
                //physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) => Item(
                  itemText: homeDetails[index],
                ),
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(minWidth: double.infinity),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(BookingInfo(), arguments: [599, 699, travlogs1[0]]);
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
