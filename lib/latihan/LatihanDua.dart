import 'package:flutter/material.dart';

class LatihanDua extends StatelessWidget {
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
        color: Colors.lightBlueAccent,
        borderRadius: BorderRadius.circular(15),
        border: BoxBorder.all( color: Colors.green, width: 2)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                "Nama : Max",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "Kerja : Balap",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                "Tim : ORBR",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              ),
            ]
          ),
          Column(
            children: [
              Container(
                alignment: Alignment.center,
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage
                  (image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuF-Pjm2wMxkFIZk56m0ccnlsmL4TmaHR93DO5H5lb0Q&s=10"
                  ),
                  fit: BoxFit.fill),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}