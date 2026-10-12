import 'package:flutter/material.dart';

class KartuProfil extends StatelessWidget {
  const KartuProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 72,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [BoxShadow(color: Colors.black, blurRadius: 2)],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 48,
              height: 48,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuF-Pjm2wMxkFIZk56m0ccnlsmL4TmaHR93DO5H5lb0Q&s=10",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
