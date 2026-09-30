import 'package:flutter/material.dart';
// import 'row_column/RowColumn.dart';
// import 'container/ContainerSatu.dart';
// import 'latihan/LatihanSatu.dart';
// import 'latihan/LatihanDua.dart';
import 'latihan/LatihanTiga.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Identitas Siswa"),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: LatihanTiga()
      )
    );
  }
}

class HelloWidget extends StatelessWidget{
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Hello Flutter",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.amber,
        ),
      ),
    );
  }
}