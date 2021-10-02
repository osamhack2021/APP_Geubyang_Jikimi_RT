//https://flutter.dev/docs/cookbook/networking/fetch-data#2-make-a-network-request
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Diet {
  final String dates;
  final String brst;
  final String lunc;
  final String dinr;

  Diet({
    required this.dates,
    required this.brst,
    required this.lunc,
    required this.dinr,
  });

  factory Diet.fromjson(Map<String, dynamic> json) {
    try {
      return Diet(
        dates: json['dates'],
        brst: json['brst'],
        lunc: json['lunc'],
        dinr: json['dinr'],
      );
    } catch (e) {
      print(e);
    }

    return Diet(dates: 'dates', brst: 'brst', lunc: 'lunc', dinr: 'dinr');
  }
}

Future<List<Diet>> fetchDiet() async {
  final response = await http.get(Uri.parse(
      'https://openapi.mnd.go.kr/sample/json/DS_TB_MNDT_DATEBYMLSVC/1/5/'));

  if (response.statusCode == 200) {
    List list = jsonDecode(response.body)['DS_TB_MNDT_DATEBYMLSVC']['row'];
    List<Diet> diets = list.map((e) => Diet.fromjson(e)).toList();
    return diets;
  } else {
    throw Exception('Failed');
  }
}

class DietListView extends StatefulWidget {
  const DietListView({Key? key}) : super(key: key);

  @override
  _DietListViewState createState() => _DietListViewState();
}

class _DietListViewState extends State<DietListView> {
  @override
  void initState() {
    super.initState();
  }

  Widget _buildListItem(Diet diet) {
    return ListView(children: [
      Text(diet.dates),
      Text(diet.brst),
      Text(diet.lunc),
      Text(diet.dinr),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Diet-ListView'),
        ),
        body: Center(
          child: FutureBuilder<List<Diet>>(
              future: fetchDiet(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildListItem(snapshot.data![index]);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator();
              }),
        ));
  }
}
