import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({Key? key, required this.text, required this.pageRoute}) : super(key: key);
  
  final String text;
  final pageRoute;


  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: TextButton.styleFrom(
            backgroundColor: Colors.blueAccent, primary: Colors.black),
        child: Text(text, style: const TextStyle(fontSize: 50)),
        onPressed: pageRoute);
  }
}
