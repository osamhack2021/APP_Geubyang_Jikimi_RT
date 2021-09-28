//https://flutter.dev/docs/cookbook/networking/fetch-data#2-make-a-network-request
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

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
    return Diet(
      dates: json['dates'],
      brft: json['brft'],
      lunc: json['lunc'],
      dinr: json['dinr'],
    );
  }
}

Future<Diet> fetchDiet() async {
  final response = await http.get(Uri.parse(
      'https://openapi.mnd.go.kr/3331313632303337343131363432313034/json/DS_TB_MNDT_DATEBYMLSVC/1/5/'));

  if (response.statusCode == 200) {
    return Diet.fromjson(jsonDecode(response.body));
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
                  return Text('${snapshot.error} adfasdf');
                }

                return const CircularProgressIndicator();
              }),
        ));
  }
}
