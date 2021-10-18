import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CheeringBoardPage extends StatelessWidget {
  CheeringBoardPage ({Key? key}) : super(key: key);

  final List<String> titles = ["조리병 ㅇㅇㅇ을 칭찬합니다.", "오늘 급식에 대해 한 말씀 드리겠습니다.", "조리병 응원 메시지", "브런치데이 좋은 점", "조리명 ㅁㅁㅁ 칭찬합니다.", "상병 OOO 칭찬의 말",];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
          itemCount: 6,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                
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
