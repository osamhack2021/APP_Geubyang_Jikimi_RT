import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'recipe_detail_page.dart';

class RecipeBoardPage extends StatelessWidget {
  RecipeBoardPage({Key? key}) : super(key: key);

  final List<String> titles = ["햄감자채볶음", "닭고기양배추볶음", "오삼불고기", "[PX] 짜파구리", "[PX] 싸르보나라", "새송이버섯야채볶음",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
          itemCount: 6,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Get.to(RecipeDetailPage(index), arguments: "데이터");
              },
              title: Text(titles[index]),
              leading: Text((index + 1).toString()),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
        ));
  }
}
