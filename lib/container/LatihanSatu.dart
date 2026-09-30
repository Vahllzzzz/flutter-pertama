import 'package:flutter/material.dart';

class LatihanSatu extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(20),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Colors.lightGreen,
        borderRadius: BorderRadius.circular(15),
        border: BoxBorder.all( color: Colors.green, width: 2)
      ),
      child: Container(
        height: 60,
        width: 200,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(10),
        ),
      child: Text(
        "XII RPL 1",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
      ),
      ),
    );
  }
}