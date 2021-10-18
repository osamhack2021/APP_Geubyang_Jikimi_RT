import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'recipe_rewrite_page.dart';

class RecipeDetailPage extends StatelessWidget {
  final int id;

  const RecipeDetailPage(this.id, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
//    String data = Get.arguments;

    return Scaffold(
        appBar: AppBar(),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            '[PX] 짜파구리',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          const Divider(),
          Row(
            children: const [
              // ElevatedButton(
              //     onPressed: () {
              //       Get.back();
              //     },
              //     child: const Text('delete')),
              // const SizedBox(
              //   width: 10,
              // ),
              // ElevatedButton(
              //     onPressed: () {
              //       Get.to(const RecipeRewritePage());
              //     },
              //     child: const Text('rewrite')),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Expanded(
              child: SingleChildScrollView(
                child: Text('1. 컵에 짜파게티와 너구리의 건더기 스프(후레이크)를 둘 다 넣고 면을 익힌다.\n 2. 4분 30초 후, 150ml(스무 밥숟가락)분량의 물을 남기고 버린다.\n 3. 짜파게티 스프 1개 분량, 너구리 스프 1/2 분량, 짜파게티 별첨 올리브유를 넣고 30초간 잘 섞는다.\n 4. 취식.'),
              ),
            ),
          )
        ]));
  }
}
