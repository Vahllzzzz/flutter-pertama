import 'package:flutter/material.dart';

class StackWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 200,
          width: 200,
          padding: EdgeInsets.all(15),
          margin: EdgeInsets.all(20),
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            borderRadius: BorderRadius.circular(15),
            border: BoxBorder.all( color: Colors.green, width: 2)
          ),
        ),
    
      ],
    );
  }
}