import 'package:flutter/material.dart';

class ContainerSatu extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: Colors.redAccent[400],
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(
            "https://lh3.googleusercontent.com/grass-cs/AABkmLf35aeTl8x7Hof6whP3z8AUnpPdplT5hfShT8EYD93U-R_MLzQ3NnbA7iq3DUhKNm3uYBcIBSxvfcdY6DRgwRjYXtyr4FCE09_BPcTNlpubXfYLnYT2-YRrhYaMvO1jCSVH_clm2A=w145-h156-n-k-no"
          ),
          fit: BoxFit.fill,
          )
      ),
      child: Text("Lorem IpsumDolor Sit Amer",
      style: TextStyle(color: Colors.black),
      ),
    );
  }
}