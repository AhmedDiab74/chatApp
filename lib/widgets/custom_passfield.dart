import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';

class CustomPassField extends StatelessWidget {
  CustomPassField({this.onChange, this.hitText});
  String? hitText;
  Function(String)? onChange;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: PasswordField(

          onChanged: onChange,
          passwordDecoration: PasswordDecoration(
            inputStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
            hintStyle: TextStyle(
              color: Colors.white,
            ),
          ),
          border: PasswordBorder(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)))),
    );
  }
}
// decoration: InputDecoration(
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(color: Colors.red),
// borderRadius: BorderRadius.circular(15)),
// hintStyle: TextStyle(color: Colors.white),
// fillColor: Colors.transparent,
// filled: true,
// prefixIcon: Icon(
// icon,
// color: Colors.white,
// ),
// contentPadding: EdgeInsets.only(left: 30, top: 40),
// hintText: hitText,
// border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
// ),
