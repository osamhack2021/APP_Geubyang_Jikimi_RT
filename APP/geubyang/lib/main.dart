import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geubyang/counts.dart';
import 'package:provider/provider.dart';

import 'main_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counts()),
      ],
      child: const MyApp(),
  ),
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
