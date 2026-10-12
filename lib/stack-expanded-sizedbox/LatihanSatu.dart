import 'package:flutter/material.dart';

class LatihanSatu extends StatelessWidget {
  const LatihanSatu({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              color: const Color.fromARGB(255, 46, 138, 213),
              child: Center(
                child: Text(
                  "Pemasukan",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              height: 100,
              color: const Color.fromARGB(255, 98, 223, 102),
              child: Center(
                child: Text(
                  "Pengeluaran",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            child: Container(
              height: 100,
              color: const Color.fromARGB(255, 245, 230, 98),
              child: Center(
                child: Text(
                  "Saldo",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      )
    );
  }
}