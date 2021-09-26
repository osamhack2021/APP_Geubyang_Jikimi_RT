import 'package:flutter/material.dart';


class DietListView extends StatelessWidget {
  const DietListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet-ListView'),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: const <Widget>[
        Text("조식 : 배추김치, 열무김치, 우유, 감귤주스, 찹쌀밥, 얼큰떡만둣국"),
        Text('중식 : 아욱된장국 새송이쇠고기볶음 미나리무생채 양념통닭'),
        Text('석식 : 참치마요덮밥, 돼지고기김치찌개, 오징어채무침'),
        ],
      )
    );
  }
}