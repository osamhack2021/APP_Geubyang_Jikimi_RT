import 'package:flutter/material.dart';  
  
void main() {  
  runApp(MyApp());  
}  
  
class MyApp extends StatefulWidget {  
  @override  
  _MyAppState createState() => _MyAppState();  
}  
  
class _MyAppState extends State<MyApp> {  
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
                   leading: Icon(Icons.home,
                   color: Colors.grey[850],
                   ),
                   title: Text('Home'),
                   onTap: (){
                     print('Home is clicked');
                   },
                   trailing: Icon(Icons.add),
                 )
                 
               ],
               ),
          ),
          body: Center (
            child: Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[  
            Container( 
              width: 60,
              height: 100,
              margin: EdgeInsets.all(25),  
              child: FlatButton(  
                child: Text('표준식단', style: TextStyle(fontSize: 20.0),),
                color: Colors.blueAccent,  
                textColor: Colors.white,   
                onPressed: () {},  
              ),  
            ),  
            Container(  
              margin: EdgeInsets.all(25),  
              child: FlatButton(  
                child: Text('급식 만족도조사', style: TextStyle(fontSize: 20.0),),
                color: Colors.blueAccent,  
                textColor: Colors.white,   
                onPressed: () {},  
              ),  
            ),  
          ]  
         ))  
      ),  
    );  
  }  
}  