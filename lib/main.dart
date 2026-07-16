import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Portfolio Website",
      debugShowCheckedModeBanner: false,
      home: DeveloperPortfolio(),
    );
  }
}
// today once again i do not have time but im commiting code..
