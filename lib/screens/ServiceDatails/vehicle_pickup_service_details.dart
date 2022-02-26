import 'package:CloudMotors/models/travlog_model.dart';
import 'package:flutter/material.dart';

class VehiclePickUpSD extends StatelessWidget {
  const VehiclePickUpSD({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Column(
          children: [Text("TODO DEtails HERE")],
        ),
      ),
    );
  }
}
