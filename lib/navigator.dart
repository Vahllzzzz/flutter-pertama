import 'package:flutter/material.dart';
import 'Listview/Grid.dart';

class NavigatorWidget extends StatelessWidget {
  const NavigatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return GridProductPage();
                },
              ),
            );
          },
          child: Text("Grid Products"),
        ),
      ]
    );
  }
}