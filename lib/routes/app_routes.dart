import 'package:flutter/material.dart';
import 'package:project_pertama/pages/home_page.dart';
import 'package:project_pertama/pages/about_page.dart';
import 'package:project_pertama/ListView/Grid.dart';

class AppRoutes {
  static const  home = '/';
  static const  about = '/about';
  static const  gridProduct = '/Grid';

  static Map<String, WidgetBuilder> routes() {
    return {
      home: (context) => const HomePage(),
      about: (context) => const AboutPage(),
      gridProduct: (context) => const GridProductPage(),
    };
  }
}