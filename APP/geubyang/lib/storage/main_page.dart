import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geubyang/storage/diet_table_listview.dart';
import 'package:url_launcher/url_launcher.dart';
import '../custom_textbutton.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  launchBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  setState(() {
                    launchBrowser("http://poisonmap.mfds.go.kr/");
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.link),
                    Text("식중독 지수 예보!")
                  ],
                )),
            const Text('오늘의 식단'),
            DataTable(columns: const [
              DataColumn(label: Text('조식')),
            ], rows: const [
              DataRow(cells: [DataCell(Text('밥'))]),
            ]),
            // provider
            const SizedBox(
              height: 50,
            ),
            Flexible(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 35.0,
                crossAxisSpacing: 35.0,
                padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                childAspectRatio: 1 / 1,
                children: <Widget>[
                  CustomTextButton(
                    text: '표준식단',
                    pageRoute: () => Get.to(const DietTableListView()),
                  ),
                  CustomTextButton(
                    text: '급식만족도조사',
                    pageRoute: () => Get.to(const DietTableListView()),
                  ),
                  CustomTextButton(
                    text: '응원의 말',
                    pageRoute: () => Get.to(const DietTableListView()),
                  ),
                  CustomTextButton(
                    text: '레시피',
                    pageRoute: () => Get.to(const DietTableListView()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            // currentAccountPicture: CircleAvatar(
            //   backgroundImage: AssetImage('assets/프로젝트로고.png'),
            //   backgroundColor: Colors.white,
            // ),
            accountName: Text('Morivi'),
            accountEmail: Text('morivi@morivi.com'),
          ),
          ListTile(
            leading: Icon(
              Icons.person_sharp,
              color: Colors.grey[850],
            ),
            title: const Text('마이페이지'),
            onTap: () {
              print('마이페이지 is clicked');
            },
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey[850],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.rule_outlined,
              color: Colors.grey[850],
            ),
            title: const Text('창고정리'),
            onTap: () {
              print('창고정리 is clicked');
            },
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey[850],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.qr_code_scanner_rounded,
              color: Colors.grey[850],
            ),
            title: const Text('QR코드 스캔'),
            onTap: () {
              print('QR코드 스캔 is clicked');
            },
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey[850],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.logout_rounded,
              color: Colors.grey[850],
            ),
            title: const Text('로그아웃'),
            onTap: () {
              print('로그아웃 is clicked');
            },
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.grey[850],
            ),
          ),
        ],
      ),
    );
  }
}
