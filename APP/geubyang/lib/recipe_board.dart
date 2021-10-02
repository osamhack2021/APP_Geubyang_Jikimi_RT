import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:geubyang/recipe_detail_page.dart';

class RecipeBoardPage extends StatelessWidget {
  const RecipeBoardPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Get.to(RecipeDetailPage(index), arguments: "데이터");
              },
              title: const Text('제목'),
              leading: const Text('1'),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ));
  }
}
