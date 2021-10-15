import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:geubyang/custom_textbutton.dart';
import 'package:geubyang/diet_table_monthly.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              child: Text(widget.dietInfo),
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
            ),
            Row(children: [
              Radio(
                value: SATISFACTION.veryBad,
                groupValue: _satisfaction,
                onChanged: (value) {
                  setState(() {
                    _satisfaction = SATISFACTION.veryBad;
                  });
                },
              ),
              const Text('매우 나쁨'),
              Radio(
                value: SATISFACTION.bad,
                groupValue: _satisfaction,
                onChanged: (value) {
                  setState(() {
                    _satisfaction = SATISFACTION.bad;
                  });
                },
              ),
              const Text('나쁨'),
              Radio(
                value: SATISFACTION.fair,
                groupValue: _satisfaction,
                onChanged: (value) {
                  setState(() {
                    _satisfaction = SATISFACTION.fair;
                  });
                },
              ),
              const Text('보통'),
              Radio(
                value: SATISFACTION.good,
                groupValue: _satisfaction,
                onChanged: (value) {
                  setState(() {
                    _satisfaction = SATISFACTION.good;
                  });
                },
              ),
              const Text('좋음'),
              Radio(
                value: SATISFACTION.veryGood,
                groupValue: _satisfaction,
                onChanged: (value) {
                  setState(() {
                    _satisfaction = SATISFACTION.veryGood;
                  });
                },
              ),
              const Text('매우 좋음'),
            ]),
            const Text('좋았던 메뉴'),
            TextFormField(),
            const Text('이유'),
            TextFormField(),
            const Text('아쉬웠던 메뉴'),
            TextFormField(),
            const Text('이유'),
            TextFormField(),
            const Text('바라는 점 및 개선점'),
            TextFormField(),
            Align(
              child: CustomTextButton(
                text: '제출',
                pageRoute: () => Get.off(const DietTableMonthly()),
              ),
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      ),
    );
  }
}
