import 'package:flutter/material.dart';
import 'package:project_pertama/pages/home_page.dart';
import 'package:project_pertama/pages/about_page.dart';
import 'package:project_pertama/ListView/Grid.dart';
import 'package:project_pertama/pages/form_page.dart';
import 'package:project_pertama/pages/input_form.dart';
import 'package:project_pertama/pages/ekskul_form.dart';
import '../toko/home_screen.dart';
import '../toko/checkout_screen.dart';
import '../toko/receipt_screen.dart';

class AppRoutes {
  static const  home = '/';
  static const  about = '/about';
  static const  gridProduct = '/Grid';
  static const  form = '/Form';
  static const  inputForm = '/input-form';
  static const  ekskulForm = '/ekskul-form';
  static const  homeScreen = '/home';
  static const  checkoutScreen = '/checkout';
  static const  receiptScreen = '/receipt';

  static Map<String, WidgetBuilder> routes() {
    return {
      home: (context) => const HomePage(),
      about: (context) => const AboutPage(),
      gridProduct: (context) => const GridProductPage(),
      form:(context) => const FormPage(),
      inputForm:(context) => const BelajarForm(),
      ekskulForm:(context) => const EkskulForm(),
      homeScreen: (context) => const HomeScreen(),
      checkoutScreen: (context) => const CheckoutScreen(),
      receiptScreen: (context) => const ReceiptScreen()
    };
  }
}