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
        Text("I'm dedicating every day to you"),
        Text('Domestic life was never quite my style'),
        Text('When you smile, you knock me out, I fall apart'),
        Text('And I thought I was so smart'),
        ],
      )
    );
  }
}
