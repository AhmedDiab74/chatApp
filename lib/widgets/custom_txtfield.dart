import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTxtFormField extends StatelessWidget {
  CustomTxtFormField({this.onChange, this.hitText, this.prefixIcon,this.suffixIcon,this.colorInput,this.hinColor,this.onSubmitted,this.controller});
  String? hitText;
  IconData? prefixIcon ,suffixIcon;
  Color? colorInput,hinColor;
  Function(String)? onChange ,onSubmitted;
  TextEditingController? controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller:controller ,
        onFieldSubmitted: onSubmitted,
        validator: (data){
          if (data!.isEmpty){
            return "Required";
          }
          return null; 
        },
          onChanged: onChange,
          style: TextStyle(
            color:colorInput?? Colors.white,
            fontSize: 20,
          ),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(15)),
            hintStyle: TextStyle(color:hinColor?? Colors.white, fontSize: 20),
            fillColor: Colors.transparent,
            filled: true,
            suffixIcon: Icon(
              suffixIcon,
              color: PGColor,
            ),
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.white,
            ),
            contentPadding: EdgeInsets.only(left: 30, top: 40),
            hintText: hitText,

            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          )),
    );
  }
}
