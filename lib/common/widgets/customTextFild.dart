import 'package:flutter/material.dart';
import 'package:suchi/constants/global_variable.dart';

class Customtextfild extends StatelessWidget {
   Customtextfild({super.key, required this.controller, required this.HintText, this.maxLine=1});
  final TextEditingController controller;
  final String HintText;
  final int maxLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      controller: controller,
      keyboardType: TextInputType.text,
      validator: (val){
          if(val==null || val.isEmpty){
            return 'Enter Your $HintText';
          }
          return null;
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 0.5,
          )
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.grey
          )
        ),
        hintText: HintText,
        fillColor: Colors.white,
        filled: true,


      ),
    );
  }
}
