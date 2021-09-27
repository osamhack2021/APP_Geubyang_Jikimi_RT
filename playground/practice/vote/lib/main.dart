import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const title = 'Grid List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(4, (Button) {
            return Center(
              
          width: 60,
              height: 100,
              margin: EdgeInsets.all(25),
              child: FlatButton(  
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