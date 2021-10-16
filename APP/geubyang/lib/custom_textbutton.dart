import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton(
      {Key? key, required this.text, required this.pageRoute})
      : super(key: key);

  final String text;
  final dynamic pageRoute;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.blue.shade500,
            primary: Colors.black,
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 25),
          ),
          onPressed: pageRoute),
      width: 200,
      height: 50,
    );
  }
}
