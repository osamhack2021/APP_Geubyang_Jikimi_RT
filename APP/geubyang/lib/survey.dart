import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DietSurvey extends StatefulWidget {
  const DietSurvey({Key? key, required this.dietInfo}) : super(key: key);
  final String dietInfo;

  @override
  State<DietSurvey> createState() => _DietSurveyState();
}

enum SATISFACTION { na, veryBad, bad, fair, good, veryGood }

class _DietSurveyState extends State<DietSurvey> {
  SATISFACTION _satisfaction = SATISFACTION.na;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Text(widget.dietInfo),
            Row(children: [
              Radio(
                  value: SATISFACTION.veryBad,
                  groupValue: _satisfaction,
                  onChanged: (value) {
                    setState(() {
                      _satisfaction = SATISFACTION.veryBad;
                    });
                  }),
              const Text('매우 나쁨'),
              Radio(
                  value: SATISFACTION.bad,
                  groupValue: _satisfaction,
                  onChanged: (value) {
                    setState(() {
                      _satisfaction = SATISFACTION.bad;
                    });
                  }),
              const Text('나쁨'),
              Radio(
                  value: SATISFACTION.fair,
                  groupValue: _satisfaction,
                  onChanged: (value) {
                    setState(() {
                      _satisfaction = SATISFACTION.fair;
                    });
                  }),
              const Text('보통'),
              Radio(
                  value: SATISFACTION.good,
                  groupValue: _satisfaction,
                  onChanged: (value) {
                    setState(() {
                      _satisfaction = SATISFACTION.good;
                    });
                  }),
              const Text('좋음'),
              Radio(
                  value: SATISFACTION.veryGood,
                  groupValue: _satisfaction,
                  onChanged: (value) {
                    setState(() {
                      _satisfaction = SATISFACTION.veryGood;
                    });
                  }),
              const Text('매우 좋음'),
            ])
          ],
        ));
  }
}
