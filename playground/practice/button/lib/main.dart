// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';  
  
void main() { runApp(MyApp());}  
  
class MyApp extends StatefulWidget {  
  @override  
  _MyAppState createState() => _MyAppState();  
}  
  
class _MyAppState extends State<MyApp> {  
  Choice _selectedOption = choices[0];  
  
  void _select(Choice choice) {  
    setState(() {  
      _selectedOption = choice;  
    });  
  }  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      home: Scaffold(  
        appBar: AppBar(  
          title: const Text('PopupMenu Button Example'),  
          actions: <Widget>[  
            PopupMenuButton<Choice>(  
              onSelected: _select,  
              itemBuilder: (BuildContext context) {  
                return choices.skip(0).map((Choice choice) {  
                  return PopupMenuItem<Choice>(  
                    value: choice,  
                    child: Text(choice.name),  
                  );  
                }).toList();  
              },  
            ),  
          ],  
        ),  
        body: Padding(  
          padding: const EdgeInsets.all(10.0),  
          child: ChoiceCard(choice: _selectedOption),  
        ),  
      ),  
    );  
  }  
}  
  
class Choice {  
  const Choice({this.name, this.icon});  
  final String name;  
  final IconData icon;  
}  
  
const List<Choice> choices = const <Choice>[  
  const Choice(name: 'Wi-Fi', icon: Icons.wifi),  
  const Choice(name: 'Bluetooth', icon: Icons.bluetooth),  
  const Choice(name: 'Battery', icon: Icons.battery_alert),  
  const Choice(name: 'Storage', icon: Icons.storage),  
];  
  
class ChoiceCard extends StatelessWidget {  
  const ChoiceCard({ Key key, this.choice}) : super(key: key);  
  
  final Choice choice;  
  
  @override  
  Widget build(BuildContext context) {  
    final TextStyle textStyle = Theme.of(context).textTheme.headline;  
    return Card(  
      color: Colors.greenAccent,  
      child: Center(  
        child: Column(  
          mainAxisSize: MainAxisSize.min,  
          crossAxisAlignment: CrossAxisAlignment.center,  
          children: <Widget>[  
            Icon(choice.icon, size: 115.0, color: textStyle.color),  
            Text(choice.name, style: textStyle),  
          ],  
        ),  
      ),  
    );  
  }  
}  