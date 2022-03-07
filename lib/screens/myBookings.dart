import 'package:CloudMotors/constants/color_constant.dart';
import 'package:CloudMotors/constants/constant_style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class myBookings extends StatefulWidget {
  const myBookings({Key? key}) : super(key: key);

  @override
  _myBookingsState createState() => _myBookingsState();
}

class _myBookingsState extends State<myBookings> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: null,
          bottom: TabBar(
            tabs: [
              Tab(
                child: Text(
                  "Processed",
                  style: mTravelLogTitleStyle,
                ),
              ),
              Tab(
                child: Text(
                  "Waiting",
                  style: mTravelLogTitleStyle,
                ),
              )
            ],
          ),
        ),
        backgroundColor: mFillColor,
        body: TabBarView(
          children: [
            Container(
              padding: EdgeInsets.all(8.0),
              color: mBackgroundColor,
              child: Center(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('bookings')
                      .where(
                        'phone',
                        isEqualTo:
                            FirebaseAuth.instance.currentUser!.phoneNumber ??
                                "null",
                      )
                      .where('view_status', isEqualTo: true)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Nothing to view"),
                      );
                    } else {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Text("Nothing to view"),
                        );
                      }
                      return ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return Row(
                            children: [
                              Flexible(
                                  child: Container(
                                margin: EdgeInsets.all(8.0),
                                padding: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: mTitleColor,
                                    )),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Name : ",
                                          style: mTitleStyle,
                                        ),
                                        Text(
                                          data['name'],
                                          style: mServiceSubtitleStyle,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Address : ",
                                          style: mTitleStyle,
                                        ),
                                        Text(
                                          data['address'],
                                          style: mServiceSubtitleStyle,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Phone : ",
                                          style: mTitleStyle,
                                        ),
                                        Text(
                                          data['phone'],
                                          style: mServiceSubtitleStyle,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Car Model : ",
                                          style: mTitleStyle,
                                        ),
                                        Text(
                                          data['car_model_type'],
                                          style: mServiceSubtitleStyle,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Date : ",
                                          style: mTitleStyle,
                                        ),
                                        Text(
                                          data['date'],
                                          style: mServiceSubtitleStyle,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          );
                        }).toList(),
                      );
                    }
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              color: mBackgroundColor,
              child: Center(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('bookings')
                      .where(
                        'phone',
                        isEqualTo:
                            FirebaseAuth.instance.currentUser!.phoneNumber ??
                                "null",
                      )
                      .where('view_status', isEqualTo: false)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Nothing to view"),
                      );
                    } else {
                      if (!snapshot.hasData) {
                        return Center(
                          child: Text("Nothing to view"),
                        );
                      }
                      return ListView(
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                          Map<String, dynamic> data =
                              document.data()! as Map<String, dynamic>;
                          return Row(
                            children: [
                              Flexible(
                                  child: Container(
                                margin: EdgeInsets.all(8.0),
                                padding: EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                    color: Colors.white,
                                    border: Border.all(
                                      color: mTitleColor,
                                    )),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Name : ",
                                          style: mTitleStyle,
                                        ),
                                        Text(
                                          data['name'],
                                          style: mServiceSubtitleStyle,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Address : ",
                                          style: mTitleStyle,
                                        ),
                                        Text(
                                          data['address'],
                                          style: mServiceSubtitleStyle,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Phone : ",
                                          style: mTitleStyle,
                                        ),
                                        Text(
                                          data['phone'],
                                          style: mServiceSubtitleStyle,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Car Model : ",
                                          style: mTitleStyle,
                                        ),
                                        Text(
                                          data['car_model_type'],
                                          style: mServiceSubtitleStyle,
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Date : ",
                                          style: mTitleStyle,
                                        ),
                                        Text(
                                          data['date'],
                                          style: mServiceSubtitleStyle,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          );
                        }).toList(),
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
