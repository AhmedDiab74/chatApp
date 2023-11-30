import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/chat_page.dart';

class CustomButton extends StatelessWidget {
  String text;

  CustomButton({this.onPressed, required this.text});
  VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
        ),
        margin: EdgeInsets.symmetric(horizontal: 25),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: Colors.transparent,
          ),
          onPressed: onPressed,
          // Navigator.pop(context);
          child: Text(
            text,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }
}
