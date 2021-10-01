//https://flutter.dev/docs/cookbook/networking/fetch-data#2-make-a-network-request
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'diet.dart';

Future<Diet> fetchDiet() async {
  final response = await http.get(Uri.parse(
      'https://openapi.mnd.go.kr/sample/json/DS_TB_MNDT_DATEBYMLSVC/1/5/'));

  if (response.statusCode == 200) {
    return Diet.fromjson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}

class DietTableListView extends StatefulWidget {
  const DietTableListView({Key? key}) : super(key: key);

  @override
  _DietListViewState createState() => _DietListViewState();
}

class _DietListViewState extends State<DietTableListView> {
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
          title: const Text('표준식단'),
        ),
        body: Center(
          child: FutureBuilder<Diet>(
              future: futureDiet,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.brft);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error} adfasdf');
                }

                return const CircularProgressIndicator();
              }),
        ));
  }
}

//