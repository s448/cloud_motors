import 'package:CloudMotors/constants/color_constant.dart';
import 'package:CloudMotors/screens/contact.dart';
import 'package:CloudMotors/screens/home_screen.dart';
import 'package:CloudMotors/screens/myBookings.dart';
import 'package:CloudMotors/screens/userProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class newBottomNavrbar extends StatefulWidget {
  const newBottomNavrbar({Key? key}) : super(key: key);

  @override
  _newBottomNavrbarState createState() => _newBottomNavrbarState();
}

class _newBottomNavrbarState extends State<newBottomNavrbar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    //Center(child: Container(child: Text("Home"))),
    HomeScreen(),
    contactPage(),
    myBookings(),
    ProfilePage(),
  ];

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        currentIndex: _currentIndex,
        items: [
          // NAVBAR ITEM 1
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? Icon(Icons.home, color: mBlueColor)
                : Icon(Icons.home_filled, color: mGreyColor),
            label: "Home",
            backgroundColor: mFillColor,
          ),

          // NAVBAR ITEM 2
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? Icon(Icons.perm_contact_calendar, color: mBlueColor)
                : Icon(Icons.perm_contact_calendar, color: mGreyColor),
            label: "Contact",
            backgroundColor: mFillColor,
          ),

          // NAVBAR ITEM 3
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Icon(Icons.event_busy, color: mBlueColor)
                : Icon(Icons.event_busy, color: mGreyColor),
            label: "My Bookings",
            backgroundColor: mFillColor,
          ),

          // NAVBAR ITEM 4
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? Icon(Icons.person, color: mBlueColor)
                : Icon(Icons.person_outline, color: mGreyColor),
            label: "Profile",
            backgroundColor: mFillColor,
          ),
        ],
        selectedItemColor: mBlueColor,
        unselectedItemColor: mSubtitleColor,
        backgroundColor: Colors.transparent,
        showUnselectedLabels: true,
        elevation: 0,
      ),
    );
  }
}
