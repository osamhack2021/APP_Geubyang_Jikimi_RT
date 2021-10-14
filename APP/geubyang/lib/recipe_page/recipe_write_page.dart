import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geubyang/custom_textbutton.dart';
import 'package:geubyang/main_page.dart';

class WritePage extends StatelessWidget {
  const WritePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          TextFormField(
              //hint: title
              decoration: const InputDecoration(
                hintText: 'title',
              ),
            ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter content'
            ),
            maxLines: 15,
          ),
          CustomTextButton(text: '글쓰기', pageRoute: () => Get.off(MainPage))
        ],
      ),
    );
  }
}
