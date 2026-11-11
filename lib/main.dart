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
// import 'Listview/list-screen.dart';
// import 'navigator.dart';

// Pastikan import ini mengarah ke file app_routes.dart yang baru kita buat
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'eCommax Electronics',
      debugShowCheckedModeBanner: false,
      // Tambahkan tema warna biru gelap khas eCommax
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF00155C),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        useMaterial3: true,
      ),
      // Sesuaikan pemanggilan route dengan class AppRoutes yang baru
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes(),
    );
  }
}

// HelloWidget tetap dibiarkan jika Anda masih ingin menyimpannya untuk referensi
class HelloWidget extends StatelessWidget {
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