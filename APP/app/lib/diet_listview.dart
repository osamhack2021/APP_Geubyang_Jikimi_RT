import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Diet {
  final String dates;
  final String brft;
  final String lunc;
  final String dinr;

  Diet({
    required this.dates,
    required this.brft,
    required this.lunc,
    required this.dinr,
  });

  factory Diet.fromjson(Map<String, dynamic> json) {
   return Diet(dates: json['dates'], brft: json['brft'], lunc: json['lunc'], dinr: json['dinr'],);
  }
}

Future<Diet> fetchDiet() async {
  final response = await http.get(Uri.parse('https://openapi.mnd.go.kr/3331313632303337343131363432313034/json/DS_TB_MNDT_DATEBYMLSVC/1/5/'));

  if (response.statusCode == 200) {
    return Diet.fromjson(jsonDecode(response.body));
  }
  else {
    throw Exception('Failed');
  }
}


class DietListView extends StatefulWidget {
  const DietListView({Key? key}) : super(key: key);

  @override
  _DietListViewState createState()  => _DietListViewState();
}

class _DietListViewState extends State<DietListView> {
  late Future<Diet> futureDiet;

  @override
  void initState() {
    super.initState();
    futureDiet = fetchDiet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet-ListView'),
      ),
      body: Center(
        child: FutureBuilder<Diet>(
    future: futureDiet,
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Text(snapshot.data!.brft);
      } else if (snapshot.hasError) {
        return Text('${snapshot.error}');
      }

      return const CircularProgressIndicator();
    }
  ),
      )
    );
  }
}

// class DietListView extends StatelessWidget {
//   const DietListView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Diet-ListView'),
//       ),
//       body: ListView(
//         shrinkWrap: true,
//         padding: const EdgeInsets.all(20.0),
//         children: const <Widget>[
//         Text("조식 : 배추김치, 열무김치, 우유, 감귤주스, 찹쌀밥, 얼큰떡만둣국"),
//         Text('중식 : 아욱된장국 새송이쇠고기볶음 미나리무생채 양념통닭'),
//         Text('석식 : 참치마요덮밥, 돼지고기김치찌개, 오징어채무침'),
//         ],
//       )
//     );
//   }
// }