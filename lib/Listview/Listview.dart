import 'package:flutter/material.dart';

class Listview extends StatelessWidget {
  const Listview({super.key});

final List<String> produk = const
[
  'Samsung'
];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: ListTile(
                leading: Icon(Icons.check_circle, color: Colors.green),
                title: Text("Activity ${index + 1}"),
                subtitle: Text("Description of activity ${index + 1}"),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
              ),
            );
          },
        ),
      ),
    );
  }
}
