import 'package:CloudMotors/models/travlog_model.dart';
import 'package:flutter/material.dart';

class WorkshopSD extends StatelessWidget {
  const WorkshopSD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          travlogs1[1].name + " Details",
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
