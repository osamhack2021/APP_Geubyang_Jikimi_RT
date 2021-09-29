// import packages
import 'package:app/diet_daily.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// import modules
import 'table_cal_examples/table_cal.dart';
import 'table_cal_examples/basic_example.dart';
import 'diet_listview.dart';
import 'fetch_data_from_interenet_example.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '급양지키미',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: '급양지키미'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/프로젝트로고.png'),
                backgroundColor: Colors.white,
              ),
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
      ),
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
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                child: const Placeholder(),
                color: Colors.amber[600],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Flexible(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 35.0,
                crossAxisSpacing: 35.0,
                padding: const EdgeInsets.fromLTRB(20.0, 40.0, 40.0, 20.0),
                childAspectRatio: 1 / 1,
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        primary: Colors.black),
                    child: const Text('표준식단', style: TextStyle(fontSize: 50)),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const DietCalendarDaily()),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        primary: Colors.black),
                    child:
                        const Text('급식 만족도조사', style: TextStyle(fontSize: 50)),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const DietListView()),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        primary: Colors.black),
                    child: const Text('응원의 말', style: TextStyle(fontSize: 50)),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HttpAlbum()),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        primary: Colors.black),
                    child: const Text('레시피', style: TextStyle(fontSize: 50)),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const TableEventsExample()),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        primary: Colors.black),
                    child: const Text('브런치데이 의견 종합',
                        style: TextStyle(fontSize: 50)),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const TableBasicsExample()),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // TextButton mainPageTextButton(BuildContext context, String buttonName, ) {
  //   return TextButton(
  //                 style: TextButton.styleFrom(
  //                     backgroundColor: Colors.blueAccent,
  //                     primary: Colors.black),
  //                 child: const Text('레시피', style: TextStyle(fontSize: 50)),
  //                 onPressed: () => Navigator.push(
  //                   context,
  //                   MaterialPageRoute(builder: (_) => const HttpAlbum()),
  //                 ),
  //               );
  // }
}
