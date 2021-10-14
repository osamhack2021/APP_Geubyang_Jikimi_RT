import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

import 'diet.dart';

Future<List<Diet>> fetchDiet() async {
  final String response =
      await rootBundle.loadString('assets/data/diet_info_ATC_Oct.json');
  List list = jsonDecode(response)['DS_TB_MNDT_DATEBYMLSVC_ATC_OCT'];
  List<Diet> diets = list.map((e) => Diet.fromjson(e)).toList();
  return diets;
}

class DietTableListView extends StatefulWidget {
  const DietTableListView({Key? key}) : super(key: key);

  @override
  _DietListViewState createState() => _DietListViewState();
}

class _DietListViewState extends State<DietTableListView> {
  // late Future<List<Diet>> futureDiet;

  @override
  void initState() {
    super.initState();
  }

  // 클래스 안에서만 사용하겠다는 의미 private method..
  Widget _buildListItem(Diet diet) {
    return Column(children: [
      Text(diet.dates),
      // Text(diet.breakfast),
      // Text(diet.lunch),
      // Text(diet.dinner),
      Expanded(
        child: DataTable(columns: const [
          DataColumn(label: Text('조식')),
          DataColumn(label: Text('중식')),
          DataColumn(label: Text('석식')),
        ], rows: [
          DataRow(cells: [
            DataCell(Text(diet.breakfast)),
            DataCell(Text(diet.lunch)),
            DataCell(Text(diet.dinner)),
          ]),
        ]),
      )
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
              future: fetchDiet(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildListItem(snapshot.data![index]);
                    }, separatorBuilder: (BuildContext context, int index) => const Divider()
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator();
              }),
        ));
  }
}
