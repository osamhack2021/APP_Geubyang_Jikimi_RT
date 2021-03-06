import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:geubyang/board_cheering.dart';
import 'package:geubyang/login.dart';
import 'package:geubyang/storage_manage.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_textbutton.dart';
import 'diet.dart';
import 'diet_utils.dart';
import 'recipe_page/recipe_board.dart';
import 'survey.dart';

class DietTableMonthly extends StatefulWidget {
  const DietTableMonthly({Key? key}) : super(key: key);

  @override
  _DietTableMonthlyState createState() => _DietTableMonthlyState();
}

class _DietTableMonthlyState extends State<DietTableMonthly> {
  launchBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    }
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  Future<List<Diet>> fetchDiet() async {
    final String response =
        await rootBundle.loadString('assets/data/diet_info_ATC_Oct.json');
    List list = jsonDecode(response)['DS_TB_MNDT_DATEBYMLSVC_ATC_OCT'];
    List<Diet> diets = list.map((e) => Diet.fromjson(e)).toList();
    return diets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('급양지키미'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 250,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                ),
                child: Column(
                  children: [
                    const Text(
                      '급양 지키미',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      width: 200,
                      height: 100,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/hand_wash.jpg"),
                          fit: BoxFit.fitWidth,
                        ),
                        // shape: BoxShape.circle
                      ),
                    ),
                    const SizedBox(height: 20,),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          launchBrowser(
                              "https://www.weather.go.kr/w/theme/daily-life/health-weather-index.do");
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.food_bank,
                            color: Colors.red,
                          ),
                          Text(
                            '식중독 지수',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.login,
                color: Colors.grey[850],
              ),
              title: const Text('로그 아웃'),
              onTap: () => Get.to(const LoginScreen()),
            ),
            ListTile(
              leading: Icon(
                Icons.storage,
                color: Colors.grey[850],
              ),
              title: const Text('창고정리'),
              onTap: () => Get.to(const StorageManage()),
            ),
            ListTile(
              leading: Icon(
                Icons.qr_code_scanner_rounded,
                color: Colors.grey[850],
              ),
              title: const Text('QR코드 스캔'),
              onTap: (() {}),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) async {
              if (!isSameDay(_selectedDay, selectedDay)) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              }
              List<Diet> dietList = await fetchDiet();
              Diet selectedDiet = dietList.firstWhere(
                  (element) =>
                      isSameDay(DateTime.parse(element.dates), selectedDay),
                  orElse: () {
                return Diet(
                  dates: '0000-00-00',
                  breakfast: '조식',
                  lunch: '중식',
                  dinner: '석식',
                );
              });
              showModalBottomSheet<void>(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(selectedDiet.dates),
                          ListTile(
                            leading: const Text('조식'),
                            title: Text(
                              selectedDiet.breakfast,
                              textAlign: TextAlign.center,
                            ),
                            onLongPress: () => Get.off(
                              DietSurvey(
                                dietInfo: selectedDiet.breakfast,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: const Text('중식'),
                            title: Text(
                              selectedDiet.lunch,
                              textAlign: TextAlign.center,
                            ),
                            onLongPress: () => Get.off(
                              DietSurvey(
                                dietInfo: selectedDiet.lunch,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: const Text('석식'),
                            title: Text(
                              selectedDiet.dinner,
                              textAlign: TextAlign.center,
                            ),
                            onLongPress: () => Get.off(
                              DietSurvey(
                                dietInfo: selectedDiet.dinner,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                // Call `setState()` when updating calendar format
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              // No need to call `setState()` here
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 40),
          CustomTextButton(
            text: '응원의 말',
            pageRoute: () => Get.to(CheeringBoardPage()),
          ),
          const SizedBox(height: 40),
          CustomTextButton(
            text: '레시피',
            pageRoute: () => Get.to(RecipeBoardPage()),
          ),
        ],
      ),
    );
  }
}
