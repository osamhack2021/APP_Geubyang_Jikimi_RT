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
  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      home: Scaffold(  
          appBar: AppBar(  
            title: Text('급양지키미'),  
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
          body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(4, (Button) {
            return Center(
              
          
             
              child: FlatButton(  
                height: 80,
                minWidth: 90,
                child: Text('표준식단', style: TextStyle(fontSize: 20.0),),
                color: Colors.blueAccent,  
                textColor: Colors.white,   
                onPressed: () {},  
              
              
              ),
            );
          }),
        ),
      ),  
    );  
  }  
}  