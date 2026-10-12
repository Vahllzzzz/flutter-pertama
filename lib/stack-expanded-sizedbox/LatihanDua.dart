import 'package:flutter/material.dart';

class LatihanDua extends StatelessWidget {
  const LatihanDua({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 140,
              color: const Color.fromARGB(255, 0, 45, 122),
            ),
            Positioned(
              bottom: -50,
              left: 20,
              child: SizedBox(
                width: 80,
                height: 80,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRuF-Pjm2wMxkFIZk56m0ccnlsmL4TmaHR93DO5H5lb0Q&s=10",
                  ),
                ),
              ),
            ),
          ],
        ),
        
      ],
    );
  }
}
