import 'package:CloudMotors/models/travlog_model.dart';
import 'package:flutter/material.dart';

class EmergencyPickUpSD extends StatelessWidget {
  const EmergencyPickUpSD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          travlogs3[1].name + " Details",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [Text("TODO DEtails HERE")],
        ),
      ),
    );
  }
}
