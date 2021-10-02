import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'recipe_board.dart';
import 'recipe_rewrite_page.dart';

class RecipeDetailPage extends StatelessWidget {
  final int id;

  const RecipeDetailPage(this.id);

  @override
  Widget build(BuildContext context) {
    String data = Get.arguments;

    return Scaffold(
        appBar: AppBar(),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'title',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          const Divider(),
          Row(
            children: [
              ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('delete')),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    Get.to(RecipeRewritePage());
                  },
                  child: const Text('rewrite')),
            ],
          ),
          const Expanded(
            child: SingleChildScrollView(
              child: Text('content'),
            ),
          )
        ]));
  }
}
