import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geubyang/custom_textbutton.dart';
import 'package:geubyang/main_page.dart';

class WritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          TextFormField(
              //hint: title
              decoration: InputDecoration(
                hintText: 'title',
              ),
            ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Enter content'
            ),
            maxLines: 15,
          ),
          CustomTextButton(text: '글쓰기', pageRoute: Get.off(MainPage))
        ],
      ),
    );
  }
}
