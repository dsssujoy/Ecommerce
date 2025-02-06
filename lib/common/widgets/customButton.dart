import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPresed});
  final String text;
  final VoidCallback onPresed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPresed, child: Text(text),style: ElevatedButton.styleFrom(
      minimumSize: Size(double.infinity,50),
      shadowColor: Colors.greenAccent,
      textStyle: TextStyle(fontSize: 25),
      elevation: 10
    ),);
  }
}
