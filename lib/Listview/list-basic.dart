import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ListBasic extends StatelessWidget {
  const ListBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Go Back"),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            width: 200,
            color: Colors.amber,
            child: Text("1"),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            width: 200,
            color: Colors.blueAccent,
            child: Text("2"),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            width: 200,
            color: Colors.greenAccent,
            child: Text("3"),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            width: 200,
            color: Colors.redAccent,
            child: Text("4"),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            width: 200,
            color: Colors.purpleAccent,
            child: Text("5"),
          ),
        ],
      );
  }
}