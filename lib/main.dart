import 'package:flutter/material.dart';
// import 'row_column/RowColumn.dart';
// import 'container/ContainerSatu.dart';
// import 'latihan/LatihanSatu.dart';
// import 'latihan/LatihanDua.dart';
// import 'latihan/LatihanTiga.dart';
// import 'stack-expanded-sizedbox/StackWidget.dart';
// import 'stack-expanded-sizedbox/LayoutSatu.dart';
// import 'stack-expanded-sizedbox/LatihanSatu.dart';
// import 'stack-expanded-sizedbox/LatihanDua.dart';
// import 'stack-expanded-sizedbox/LatihanEmpat.dart';
// import 'Listview/Listview.dart';
// import 'Listview/Grid.dart';
import 'Listview/list-screen.dart';

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
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Flutter Widget"),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: ArticleListScreen()
      )
    );
  }
}

class HelloWidget extends StatelessWidget{
  const HelloWidget({super.key});

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