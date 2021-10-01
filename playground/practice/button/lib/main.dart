import 'package:flutter/material.dart';  
  
void main() {  
  runApp(MyApp());  
}  
  
class MyApp extends StatefulWidget {  
  @override  
  _MyAppState createState() => _MyAppState();  
}  
  
class _MyAppState extends State<MyApp> {
  get ind => null;

  get rounded => null;

  get countValue => null;
  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      home: Scaffold(  
          appBar: AppBar(  
            title: Text('급양지키미'), 
            actions:<Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward_ios_rounded),
                onPressed: () {},
              )
            ]
                      ),  
          drawer: Drawer(
             child:ListView(
               padding: EdgeInsets.zero,
               children: <Widget>[
                 UserAccountsDrawerHeader(
                   currentAccountPicture: CircleAvatar(
                   backgroundImage: AssetImage('assets/프로젝트로고.png'),
                   backgroundColor: Colors.white,
                 ),
                 accountName: Text('Morivi'),
                 accountEmail: Text('morivi@morivi.com'),
                 ),
                 ListTile(
                   leading: Icon(Icons.person_sharp,
                   color: Colors.grey[850],
                   ),
                   title: Text('마이페이지'),
                   onTap: (){
                     print('마이페이지 is clicked');
                   },
                   trailing: Icon(Icons.arrow_forward_ios_rounded,
                   color: Colors.grey[850],
                   ),
                 ),
                 ListTile(
                   leading: Icon(Icons.rule_outlined,
                   color: Colors.grey[850],
                   ),
                   title: Text('창고정리'),
                   onTap: (){
                     print('창고정리 is clicked');
                   },
                   trailing: Icon(Icons.arrow_forward_ios_rounded,
                   color: Colors.grey[850],
                   ),
                 ),
                 ListTile(
                   leading: Icon(Icons.qr_code_scanner_rounded,
                   color: Colors.grey[850],
                   ),
                   title: Text('QR코드 스캔'),
                   onTap: (){
                     print('QR코드 스캔 is clicked');
                   },
                   trailing: Icon(Icons.arrow_forward_ios_rounded,
                   color: Colors.grey[850],
                   ),
                 ),
                 ListTile(
                   leading: Icon(Icons.logout_rounded,
                   color: Colors.grey[850],
                   ),
                   title: Text('로그아웃'),
                   onTap: (){
                     print('로그아웃 is clicked');
                   },
                   trailing: Icon(Icons.arrow_forward_ios_rounded,
                   color: Colors.grey[850],
                   ),
                 ),
                 
               ],
               ),
          ),
            body: Column(children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 35.0,
              crossAxisSpacing: 35.0,
              padding: const EdgeInsets.fromLTRB(20.0, 40.0, 40.0, 20.0),
              childAspectRatio: 1/1,
              children: <Widget>[
                  
                  
                  TextButton(
                   style: TextButton.styleFrom(
                     backgroundColor: Colors.blueAccent,
                     primary: Colors.black
                   ),
                  
                  child: Text('표준식단',
                      style: TextStyle(fontSize:50)),
                  onPressed: (){}
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                     backgroundColor: Colors.blueAccent,
                     primary: Colors.black
                   ),
                  child: Text('급식 만족도조사',
                      style: TextStyle(fontSize: 50)),
                  onPressed: (){}
                  ),
                 
                  TextButton(
                    style: TextButton.styleFrom(
                     backgroundColor: Colors.blueAccent,
                     primary: Colors.black
                   ),
                  child: Text('응원의 말',
                      style: TextStyle(fontSize: 50)),
                  onPressed: (){}
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                     backgroundColor: Colors.blueAccent,
                     primary: Colors.black
                   ),
                  child: Text('레시피',
                      style: TextStyle(fontSize: 50)),
                  onPressed: (){}
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                     backgroundColor: Colors.blueAccent,
                     primary: Colors.black
                   ),
                  child: Text('브런치데이 의견 종합',
                      style: TextStyle(fontSize: 50)),
                  onPressed: (){}
                  )
              ],
                ),   
                ),
            ],
            ),  
    
    ));  
  }  
}  