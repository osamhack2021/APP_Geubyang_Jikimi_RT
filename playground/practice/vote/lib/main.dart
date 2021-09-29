import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SamplePage(),
    );
  }
}

class SamplePage extends StatefulWidget {
  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  late List<bool> isSelected;

  @override
  void initState() {
    // this is for 3 buttons, add "false" same as the number of buttons here
    isSelected = [true, false, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToggleButtons Demo'),
      ),
      body: Center(
        child: ToggleButtons(
          children: <Widget>[
            // first toggle button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'First',
              ),
            ),
            // second toggle button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Second',
              ),
            ),
            // third toggle button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Third',
              ),
            ),
          ],
          // logic for button selection below
          onPressed: (int index) {
            setState(() {
              for (int i = 0; i < isSelected.length; i++) {
                isSelected[i] = i == index;
              }
            });
          },
          isSelected: isSelected,
        ),
      ),
    );
  }
}