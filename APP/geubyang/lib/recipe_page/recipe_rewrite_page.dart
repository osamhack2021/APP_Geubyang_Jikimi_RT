import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geubyang/custom_textbutton.dart';
import 'recipe_board.dart';

class RecipeRewritePage extends StatelessWidget {
  const RecipeRewritePage({Key? key}) : super(key: key);



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
              initialValue: '제목',
            ),
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter content'
            ),
            initialValue: '내용',
            maxLines: 15,
          ),
          CustomTextButton(text: '글수정하기', pageRoute: Get.off(const RecipeBoardPage()))
        ],
      ),
    );
  }
}
