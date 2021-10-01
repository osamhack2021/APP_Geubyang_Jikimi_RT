//https://flutter.dev/docs/cookbook/networking/fetch-data#2-make-a-network-request
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'diet.dart';

Future<List<Diet>> fetchDiet() async {
  final response = await http.get(Uri.parse(
      'https://openapi.mnd.go.kr/3331313632303337343131363432313034/json/DS_TB_MNDT_DATEBYMLSVC/1/5/'));

  if (response.statusCode == 200) {
    List list = jsonDecode(response.body)['DS_TB_MNDT_DATEBYMLSVC']['row'];

    List<Diet> diets = list.map((e) => Diet.fromjson(e)).toList();
    return diets;
  } else {
    print(Error);
    throw Exception('Failed');
  }
}

class DietTableListView extends StatefulWidget {
  const DietTableListView({Key? key}) : super(key: key);

  @override
  _DietListViewState createState() => _DietListViewState();
}

class _DietListViewState extends State<DietTableListView> {
  late Future<List<Diet>> futureDiet;

  @override
  void initState() {
    super.initState();
    futureDiet = fetchDiet();
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
          title: const Text('표준식단'),
        ),
        body: Center(
          child: FutureBuilder<List<Diet>>(
              future: futureDiet,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildListItem(snapshot.data![index]);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error} adfasdf');
                }

                return const CircularProgressIndicator();
              }),
        ));
  }
}
