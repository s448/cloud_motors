import 'package:CloudMotors/constants/constant_style.dart';
import 'package:CloudMotors/models/carousel_model.dart';
import 'package:CloudMotors/models/travlog_model.dart';
import 'package:CloudMotors/screens/Booking/booking_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import '../constants/color_constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  // CALL FUNCTION
  _callNumber() async {
    const number = '+911122334455'; //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }
  // CALL FUNCTION END

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mBackgroundColor,
        title: Center(
          child: Text(
            "Cloud Motors",
            style: TextStyle(
              fontSize: 30,
              fontFamily: tface,
              color: mBlueColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        elevation: 0,
      ),
      backgroundColor: mBackgroundColor,
      body: Container(
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16, bottom: 24),
              child: Center(
                child: Text(
                  "Have a look at our services 👇",
                  style: mTitleStyle,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount: carousels.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(
                                carousels[index].image,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: map<Widget>(carousels, (index, image) {
                          return Container(
                            alignment: Alignment.centerLeft,
                            height: 6,
                            width: 6,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _current == index
                                    ? mBlueColor
                                    : mGreyColor),
                          );
                        }),
                      ),
                      Text(
                        "Book Now",
                        style: mMoreDiscountStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
              child: Text(
                "Book by Category",
                style: mTitleStyle,
              ),
            ),
            // SizedBox(height: 16),
            Container(
              height: 144,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      // CATEGORY 1
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.home, color: mBlueColor),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Home\nServices",
                                      style: mServiceTitleStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // CATEGORY 2
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.car_repair, color: mBlueColor),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Garage\nServices",
                                      style: mServiceTitleStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      // CATEGORY 3
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.local_car_wash, color: mBlueColor),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Washing\nServices",
                                      style: mServiceTitleStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // CATEGORY 4
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 8),
                          padding: EdgeInsets.only(left: 16),
                          height: 64,
                          decoration: BoxDecoration(
                            color: mFillColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: mBorderColor, width: 1),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.rv_hookup, color: mBlueColor),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Pickup\nService",
                                      style: mServiceTitleStyle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
              child: Center(
                child: Text(
                  "!! EMERGENCY !!",
                  style: TextStyle(
                      color: Color.fromRGBO(244, 67, 54, 1),
                      fontSize: 22,
                      fontFamily: tface,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Container(
              height: Get.height / 7,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: _callNumber,
                          child: Container(
                            margin: EdgeInsets.only(right: 8),
                            padding: EdgeInsets.only(left: 16),
                            height: 64,
                            decoration: BoxDecoration(
                              color: mFillColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: mBorderColor, width: 1),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                    onPressed: _callNumber,
                                    icon: Icon(
                                      Icons.local_phone,
                                      size: 30,
                                      color: Colors.red,
                                    )),
                                Padding(
                                  // width: Get.width,
                                  // height: Get.height / 9,
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Vehicle Broke Down...??",
                                        style: mServiceTitleStyle,
                                      ),
                                      Flexible(
                                        child: Text(
                                          "CLICK HERE \nto give us a call and we will pickup your vehicle",
                                          style: mServiceSubtitleStyle,
                                          overflow: TextOverflow.fade,
                                          softWrap: false,
                                          maxLines: 4,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16, top: 24, bottom: 12),
              child: Text(
                "All Services",
                style: mTitleStyle,
              ),
            ),

//////////////////////////////////////>>> All Services <<<////////////////////////////////

            // 1ST ALL SERVICES
            Container(
              height: Get.height / 3.5,
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: travlogs1.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(BookingInfo(), arguments: [travlogs1[index]]);
                      //print(travlogs1[index].name);
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 16),
                      width: Get.width / 1.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: Get.height / 6,
                                width: Get.width / 1.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(travlogs1[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: SvgPicture.asset(
                                    "assets/svg/travlog_bottom_gradient.svg"),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 8,
                                child: Text(
                                  travlogs1[index].name,
                                  style: mTravelLogTitleStyle,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            travlogs1[index].content,
                            maxLines: 3,
                            style: mTravelLogContentStyle,
                          ),
                          SizedBox(height: 8),
                          Text(
                            travlogs1[index].place,
                            style: mTravelLogPlaceStyle,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // 2ND ALL SERVICES
            Container(
              height: Get.height / 3.5,
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: travlogs2.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(BookingInfo(), arguments: [travlogs2[index]]);
                      //print(travlogs1[index].name);
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 16),
                      width: Get.width / 1.6,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: Get.height / 6,
                                width: Get.width / 1.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(travlogs2[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: SvgPicture.asset(
                                    "assets/svg/travlog_bottom_gradient.svg"),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 8,
                                child: Text(
                                  travlogs2[index].name,
                                  style: mTravelLogTitleStyle,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            travlogs2[index].content,
                            maxLines: 3,
                            style: mTravelLogContentStyle,
                          ),
                          SizedBox(height: 8),
                          Text(
                            travlogs2[index].place,
                            style: mTravelLogPlaceStyle,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // 3RD ALL SERVICES
            Container(
              height: Get.height / 2.7,
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: travlogs1.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(BookingInfo(), arguments: [travlogs3[index]]);
                      //print(travlogs1[index].name);
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: 16),
                      width: Get.width / 1.6,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height: Get.height / 5.4,
                                width: Get.width / 1.5,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(travlogs3[index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: SvgPicture.asset(
                                    "assets/svg/travlog_bottom_gradient.svg"),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 8,
                                child: Text(
                                  travlogs3[index].name,
                                  style: mTravelLogTitleStyle,
                                  softWrap: true,
                                  maxLines: 5,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            travlogs3[index].content,
                            maxLines: 3,
                            style: mTravelLogContentStyle,
                          ),
                          SizedBox(height: 8),
                          Text(
                            travlogs3[index].place,
                            style: mTravelLogPlaceStyle,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
