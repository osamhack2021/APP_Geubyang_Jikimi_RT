import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'main_page.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(
        title: '급양지키미',
      ),
    );
  }
}
