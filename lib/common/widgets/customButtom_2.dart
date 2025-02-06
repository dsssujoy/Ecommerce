import 'package:flutter/material.dart';
import 'package:suchi/constants/global_variable.dart';

class Custombuttom2 extends StatelessWidget {
  const Custombuttom2({super.key, required this.text, required this.onPresed});
  final String text;
  final VoidCallback onPresed;

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: ElevatedButton(onPressed: onPresed, child: Text(text),style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity,50),
          shadowColor: Colors.greenAccent,
          textStyle: TextStyle(fontSize: 25),
          elevation: 10
      ),),
    );
  }
}
